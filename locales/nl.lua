--[[
    Pigeon Vehicle Doors: Dutch (Nederlands).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'nl'
    to use it, or leave it on 'auto' and set ox_lib's language.
]]

Locales = Locales or {}

Locales.nl = {
    title = 'Voertuigdeuren',
    key_door = 'Deur open / dicht',
    key_window = 'Raam omlaag / omhoog',
    key_hood = 'Motorkap open / dicht',
    key_trunk = 'Kofferbak open / dicht',
    no_vehicle = 'Er is geen voertuig in de buurt.',
    locked = 'Dat voertuig is op slot.',
    no_door = 'Dat voertuig heeft die deur niet.',
    driver_only = 'Alleen de bestuurder kan dat.',
    inside_only = 'Stap in het voertuig om de ramen te gebruiken.',
    usage = 'Gebruik /{command} 1 tot 4 of all. 1 is van de bestuurder, 2 de bijrijder, 3 en 4 achter.',
}
