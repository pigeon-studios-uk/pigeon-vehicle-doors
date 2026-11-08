--[[
    Pigeon Vehicle Doors: Traditional Chinese (繁體中文).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'zh-tw'
    to use it, or leave it on 'auto' and set ox_lib's language.
]]

Locales = Locales or {}

Locales['zh-tw'] = {
    title = '車門',
    key_door = '開 / 關車門',
    key_window = '車窗 降 / 升',
    key_hood = '開 / 關引擎蓋',
    key_trunk = '開 / 關後車廂',
    no_vehicle = '附近沒有車輛。',
    locked = '那輛車已上鎖。',
    no_door = '那輛車沒有這扇門。',
    driver_only = '只有駕駛可以這樣做。',
    inside_only = '上車後才能使用車窗。',
    usage = '使用 /{command} 1 到 4 或 all。1 為駕駛，2 為副駕駛，3 和 4 為後座。',
}
