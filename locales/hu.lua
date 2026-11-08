--[[
    Pigeon Vehicle Doors: Hungarian (Magyar).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'hu'
    to use it, or leave it on 'auto' and set ox_lib's language.
]]

Locales = Locales or {}

Locales.hu = {
    title = 'Járműajtók',
    key_door = 'Ajtó nyitása / zárása',
    key_window = 'Ablak le / fel',
    key_hood = 'Motorháztető nyitása / zárása',
    key_trunk = 'Csomagtartó nyitása / zárása',
    no_vehicle = 'Nincs jármű a közeledben.',
    locked = 'Az a jármű zárva van.',
    no_door = 'Annak a járműnek nincs ilyen ajtaja.',
    driver_only = 'Ezt csak a sofőr teheti meg.',
    inside_only = 'Szállj be a járműbe az ablakok használatához.',
    usage = 'Használd: /{command} 1-4 vagy all. 1 a sofőré, 2 az anyósülésé, 3 és 4 hátul.',
}
