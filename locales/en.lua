--[[
    Pigeon Vehicle Doors: English.

    To translate, copy this file to a new one named with the language's code (such as de.lua or pt-br.lua),
    change `Locales.en` to match (Locales.de), translate the text in quotes, and set Config.Locale.
    Keep words in {curly brackets} and ~GTA codes~ exactly as they are; they're filled in automatically.
]]

Locales = Locales or {}

Locales.en = {
    -- Title of the messages.
    title = 'Vehicle doors',
    -- In GTA's Settings -> Key Bindings -> FiveM.
    key_door = 'Open / close a door',
    -- In GTA's Settings -> Key Bindings -> FiveM.
    key_window = 'Window down / up',
    -- In GTA's Settings -> Key Bindings -> FiveM.
    key_hood = 'Open / close the hood',
    -- In GTA's Settings -> Key Bindings -> FiveM.
    key_trunk = 'Open / close the trunk',
    -- On foot, with no vehicle close by.
    no_vehicle = 'There\'s no vehicle near you.',
    -- On foot, next to a locked vehicle.
    locked = 'That vehicle is locked.',
    -- The vehicle doesn't have that door, or it's broken off.
    no_door = 'That vehicle doesn\'t have that door.',
    -- A passenger trying another door, the hood or the trunk.
    driver_only = 'Only the driver can do that.',
    -- Using /window on foot.
    inside_only = 'Get in the vehicle to use its windows.',
    -- {command} is the command name, such as door. Also shown as the chat suggestion.
    usage = 'Use /{command} 1 to 4 or all. 1 is the driver\'s, 2 the front passenger\'s, 3 and 4 the rear.',
}
