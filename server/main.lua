--[[
    Pigeon Vehicle Doors: server.

    Checks each request before anything moves: the vehicle exists, the player is in it (passengers only
    their own door and window with Config.PassengersOwnOnly) or on foot next to it and it isn't locked,
    and they aren't sending too many. Doors go to the game that owns the vehicle; windows go in the
    vehicle's `pigeonWindows` state bag.
]]

local RATE_MS = 200             -- the shortest time between two requests from one player
local LAG = 2.0                 -- metres allowed on top of Config.Distance, for movement and lag
local SEAT_DOOR = { [-1] = 0, [0] = 1, [1] = 2, [2] = 3 }

local last = {}

AddEventHandler('playerDropped', function() last[source] = nil end)

local function vehicleFrom(netId)
    if type(netId) ~= 'number' then return nil end
    local veh = NetworkGetEntityFromNetworkId(netId)
    if veh == 0 or not DoesEntityExist(veh) or GetEntityType(veh) ~= 2 then return nil end
    return veh
end

local function seatOf(veh, ped)
    for seat = -1, 14 do
        if GetPedInVehicleSeat(veh, seat) == ped then return seat end
    end
end

--- A list of whole numbers from first to max, or nil.
local function indexes(list, max)
    if type(list) ~= 'table' or #list == 0 or #list > 4 then return nil end
    local out = {}
    for i = 1, #list do
        local n = list[i]
        if type(n) ~= 'number' or n % 1 ~= 0 or n < 0 or n > max then return nil end
        out[i] = n
    end
    return out
end

--- The checks every request goes through. Returns the vehicle, and whether the player is in it.
local function check(src, netId, list, windows)
    local now = GetGameTimer()
    if last[src] and now - last[src] < RATE_MS then return nil end
    last[src] = now

    local veh = vehicleFrom(netId)
    if not veh then return nil end
    local ped = GetPlayerPed(src)
    if ped == 0 then return nil end

    local inside = GetVehiclePedIsIn(ped, false)
    if inside == veh then
        local seat = seatOf(veh, ped)
        if seat == nil then return nil end
        if seat ~= -1 and Config.PassengersOwnOnly then
            for _, index in ipairs(list) do
                if SEAT_DOOR[seat] ~= index then return nil end
            end
        end
        return veh
    end

    if inside ~= 0 or windows then return nil end
    if #(GetEntityCoords(ped) - GetEntityCoords(veh)) > Config.Distance + LAG then return nil end
    if GetVehicleDoorLockStatus(veh) >= 2 then return nil end
    return veh
end

RegisterNetEvent('pigeon-vehicle-doors:doors', function(netId, doors, open)
    local src = source
    doors = indexes(doors, 5)
    if not doors or type(open) ~= 'boolean' then return end
    local veh = check(src, netId, doors, false)
    if not veh then return end
    local owner = NetworkGetEntityOwner(veh)
    if not owner or owner <= 0 then owner = src end
    TriggerClientEvent('pigeon-vehicle-doors:apply', owner, netId, doors, open)
end)

RegisterNetEvent('pigeon-vehicle-doors:windows', function(netId, windows, down)
    local src = source
    windows = indexes(windows, 3)
    if not windows or type(down) ~= 'boolean' then return end
    local veh = check(src, netId, windows, true)
    if not veh then return end
    local state = Entity(veh).state
    local mask = tonumber(state.pigeonWindows) or 0
    for _, w in ipairs(windows) do
        if down then mask = mask | (1 << w) else mask = mask & ~(1 << w) end
    end
    state:set('pigeonWindows', mask ~= 0 and mask or nil, true)
end)
