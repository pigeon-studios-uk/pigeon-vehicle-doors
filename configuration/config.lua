Config = {}

-- Language for the text players see. 'auto' follows ox_lib's language (setr ox:locale "de" in
-- server.cfg) and is English when that isn't set. Or name a file from locales/, such as 'de' or 'pt-br'.
Config.Locale = 'auto'

-- The command names. /door and /window take 1 to 4 or all: 1 is the driver's, 2 the front passenger's,
-- 3 behind the driver and 4 behind the front passenger. On their own, they use the player's own door or
-- window, or on foot the door they're standing nearest.
Config.Commands = {
    door = 'door',
    window = 'window',
    hood = 'hood',
    trunk = 'trunk',
}

-- Default keys for the commands without a number. '' leaves a key unbound until a player picks one in
-- GTA's Settings -> Key Bindings -> FiveM.
-- Codes: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.Keys = {
    door = '',
    window = '',
    hood = '',
    trunk = '',
}

-- How close, in metres, a player on foot has to be to a vehicle to open its doors, hood or trunk.
Config.Distance = 5.0

-- true: passengers can only open their own door and window, and only the driver can open the others,
-- the hood and the trunk. false: anyone in the vehicle can open any of them.
Config.PassengersOwnOnly = true

-- Tell players why they can't open something.
Config.ShowMessages = true

-- How messages are shown.
-- 'auto' uses ox_lib notifications if ox_lib is running, otherwise GTA's notification feed.
-- 'ox_lib' or 'gta' to force one.
Config.Notifications = 'auto'

-- Update checks are controlled in server.cfg for every Pigeon Studios resource at once:
--     set pigeon_update_check "on"      (default)  |  "quiet"  |  "off"
