--[[
    Pigeon Vehicle Doors: client.

    /door, /window, /hood and /trunk open and close a vehicle's doors, windows, hood and trunk. In a vehicle
    they work on that vehicle; on foot, on the nearest unlocked one (doors, hood and trunk only).

    The player's game works out what to open and asks the server, which checks the player is allowed. Doors
    are then moved by the game that owns the vehicle, so the game syncs them to everyone. Windows are kept in
    the vehicle's `pigeonWindows` state bag, which every game rolls them to.
]]

local DOOR_BONES = { [0] = 'door_dside_f', [1] = 'door_pside_f', [2] = 'door_dside_r', [3] = 'door_pside_r' }
local HOOD, TRUNK = 4, 5
local SEAT_DOOR = { [-1] = 0, [0] = 1, [1] = 2, [2] = 3 }   -- seat -> its door and window

-- 'auto' follows ox_lib's language (the ox:locale convar), and English when that isn't set.
local locale = Config.Locale == 'auto' and GetConvar('ox:locale', 'en') or Config.Locale
local strings = Locales[locale] or Locales.en

local function t(key, values)
    local text = strings[key] or Locales.en[key] or key
    return (text:gsub('{(%w+)}', function(name)
        local value = values and values[name]
        return value ~= nil and tostring(value) or '{' .. name .. '}'
    end))
end

local lastMessage = {}

local function notify(key, values)
    if not Config.ShowMessages then return end
    local now = GetGameTimer()
    if lastMessage[key] and now - lastMessage[key] < 1000 then return end
    lastMessage[key] = now
    local text = t(key, values)
    local mode = Config.Notifications
    if mode == 'ox_lib' or (mode == 'auto' and GetResourceState('ox_lib') == 'started') then
        TriggerEvent('ox_lib:notify', { title = strings.title, description = text, type = 'error' })
    else
        BeginTextCommandThefeedPost('STRING')
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandThefeedPostTicker(false, false)
    end
end

--- The seat the ped is in, or nil.
local function seatOf(veh, ped)
    for seat = -1, GetVehicleMaxNumberOfPassengers(veh) - 1 do
        if not IsVehicleSeatFree(veh, seat) and GetPedInVehicleSeat(veh, seat) == ped then return seat end
    end
end

local function nearestVehicle(ped)
    local coords = GetEntityCoords(ped)
    local best, bestDistance = nil, Config.Distance
    for _, veh in ipairs(GetGamePool('CVehicle')) do
        local distance = #(coords - GetEntityCoords(veh))
        if distance <= bestDistance then best, bestDistance = veh, distance end
    end
    return best
end

local function nearestDoor(veh, ped)
    local coords = GetEntityCoords(ped)
    local best, bestDistance
    for door, bone in pairs(DOOR_BONES) do
        local index = GetEntityBoneIndexByName(veh, bone)
        if index ~= -1 and GetIsDoorValid(veh, door) then
            local distance = #(coords - GetWorldPositionOfEntityBone(veh, index))
            if not bestDistance or distance < bestDistance then best, bestDistance = door, distance end
        end
    end
    return best
end

local function isLocked(veh)
    return GetVehicleDoorLockStatus(veh) >= 2
end

--- The vehicle to work on, the player's seat in it (nil on foot), or nil with a message.
local function target(ped)
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= 0 then return veh, seatOf(veh, ped) end
    veh = nearestVehicle(ped)
    if not veh then
        notify('no_vehicle')
        return nil
    end
    if isLocked(veh) then
        notify('locked')
        return nil
    end
    return veh, nil
end

--- "1".."4" -> { 0..3 }, "all" -> all four, nil -> nil. false for anything else.
local function parse(arg)
    if arg == nil then return nil end
    arg = tostring(arg):lower()
    if arg == 'all' then return { 0, 1, 2, 3 } end
    local n = tonumber(arg)
    if n and n >= 1 and n <= 4 and n % 1 == 0 then return { n - 1 } end
    return false
end

--- Can this seat (nil on foot) use these doors or windows? Shows why not.
local function allowed(seat, list)
    if seat == nil or seat == -1 or not Config.PassengersOwnOnly then return true end
    for _, index in ipairs(list) do
        if SEAT_DOOR[seat] ~= index then
            notify('driver_only')
            return false
        end
    end
    return true
end

local function sendDoors(veh, doors)
    local valid = {}
    for _, door in ipairs(doors) do
        if GetIsDoorValid(veh, door) and not IsVehicleDoorDamaged(veh, door) then valid[#valid + 1] = door end
    end
    if #valid == 0 then
        notify('no_door')
        return
    end
    -- Open them all if any is shut, otherwise shut them all.
    local open = false
    for _, door in ipairs(valid) do
        if GetVehicleDoorAngleRatio(veh, door) <= 0.0 then open = true end
    end
    TriggerServerEvent('pigeon-vehicle-doors:doors', VehToNet(veh), valid, open)
end

local function door(arg)
    local ped = PlayerPedId()
    local doors = parse(arg)
    if doors == false then
        notify('usage', { command = Config.Commands.door })
        return
    end
    local veh, seat = target(ped)
    if not veh then return end
    if not doors then
        local own = seat and SEAT_DOOR[seat] or (not seat and nearestDoor(veh, ped))
        if not own then
            notify('no_door')
            return
        end
        doors = { own }
    end
    if not allowed(seat, doors) then return end
    sendDoors(veh, doors)
end

local function window(arg)
    local ped = PlayerPedId()
    local windows = parse(arg)
    if windows == false then
        notify('usage', { command = Config.Commands.window })
        return
    end
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then
        notify('inside_only')
        return
    end
    local seat = seatOf(veh, ped)
    if not windows then
        local own = seat and SEAT_DOOR[seat]
        if not own then
            notify('no_door')
            return
        end
        windows = { own }
    end
    if not allowed(seat, windows) then return end
    -- Down if any is up, otherwise all up.
    local mask = Entity(veh).state.pigeonWindows or 0
    local down = false
    for _, w in ipairs(windows) do
        if mask & (1 << w) == 0 then down = true end
    end
    TriggerServerEvent('pigeon-vehicle-doors:windows', VehToNet(veh), windows, down)
end

local function hoodOrTrunk(which)
    local ped = PlayerPedId()
    local veh, seat = target(ped)
    if not veh then return end
    if seat and seat ~= -1 and Config.PassengersOwnOnly then
        notify('driver_only')
        return
    end
    sendDoors(veh, { which })
end

---------------------------------------------------------------------------
-- Applying what the server sends

-- The server sends doors to the game that owns the vehicle, so the game syncs them to everyone.
RegisterNetEvent('pigeon-vehicle-doors:apply', function(netId, doors, open)
    if not NetworkDoesNetworkIdExist(netId) then return end
    local veh = NetToVeh(netId)
    if veh == 0 or not DoesEntityExist(veh) then return end
    for _, d in ipairs(doors) do
        if open then
            SetVehicleDoorOpen(veh, d, false, false)
        else
            SetVehicleDoorShut(veh, d, false)
        end
    end
end)

-- Windows: every game rolls them to the vehicle's state bag, when it changes and when the vehicle
-- comes into range.
local seen = {}

AddStateBagChangeHandler('pigeonWindows', nil, function(bagName, _, value)
    local mask = tonumber(value) or 0
    local veh = GetEntityFromStateBagName(bagName)
    local giveUp = GetGameTimer() + 2000
    while veh == 0 and GetGameTimer() < giveUp do
        Wait(100)
        veh = GetEntityFromStateBagName(bagName)
    end
    if veh == 0 then return end
    local before = seen[bagName] or 0
    for w = 0, 3 do
        local bit = 1 << w
        if mask & bit ~= before & bit then
            if mask & bit ~= 0 then RollDownWindow(veh, w) else RollUpWindow(veh, w) end
        end
    end
    seen[bagName] = mask ~= 0 and mask or nil
end)

---------------------------------------------------------------------------
-- Commands and keys

local commands = Config.Commands
local keys = Config.Keys or {}

RegisterCommand(commands.door, function(_, args) door(args[1]) end, false)
RegisterKeyMapping(commands.door, strings.key_door or Locales.en.key_door, 'keyboard', keys.door or '')

RegisterCommand(commands.window, function(_, args) window(args[1]) end, false)
RegisterKeyMapping(commands.window, strings.key_window or Locales.en.key_window, 'keyboard', keys.window or '')

RegisterCommand(commands.hood, function() hoodOrTrunk(HOOD) end, false)
RegisterKeyMapping(commands.hood, strings.key_hood or Locales.en.key_hood, 'keyboard', keys.hood or '')

RegisterCommand(commands.trunk, function() hoodOrTrunk(TRUNK) end, false)
RegisterKeyMapping(commands.trunk, strings.key_trunk or Locales.en.key_trunk, 'keyboard', keys.trunk or '')

TriggerEvent('chat:addSuggestion', '/' .. commands.door, t('usage', { command = commands.door }), { { name = '1-4 / all' } })
TriggerEvent('chat:addSuggestion', '/' .. commands.window, t('usage', { command = commands.window }), { { name = '1-4 / all' } })
