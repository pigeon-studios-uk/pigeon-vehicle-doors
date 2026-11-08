--[[
    Pigeon Vehicle Doors: Simplified Chinese (简体中文).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'zh-cn'
    to use it, or leave it on 'auto' and set ox_lib's language.
]]

Locales = Locales or {}

Locales['zh-cn'] = {
    title = '车门',
    key_door = '开 / 关车门',
    key_window = '车窗 降 / 升',
    key_hood = '开 / 关引擎盖',
    key_trunk = '开 / 关后备箱',
    no_vehicle = '附近没有车辆。',
    locked = '那辆车已上锁。',
    no_door = '那辆车没有这扇门。',
    driver_only = '只有驾驶员可以这样做。',
    inside_only = '上车后才能使用车窗。',
    usage = '使用 /{command} 1 到 4 或 all。1 为驾驶员，2 为副驾驶，3 和 4 为后排。',
}
