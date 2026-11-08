--[[
    Pigeon Vehicle Doors: Finnish (Suomi).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'fi'
    to use it, or leave it on 'auto' and set ox_lib's language.
]]

Locales = Locales or {}

Locales.fi = {
    title = 'Ajoneuvon ovet',
    key_door = 'Avaa / sulje ovi',
    key_window = 'Ikkuna alas / ylös',
    key_hood = 'Avaa / sulje konepelti',
    key_trunk = 'Avaa / sulje takakontti',
    no_vehicle = 'Lähelläsi ei ole ajoneuvoa.',
    locked = 'Se ajoneuvo on lukossa.',
    no_door = 'Siinä ajoneuvossa ei ole sitä ovea.',
    driver_only = 'Vain kuljettaja voi tehdä sen.',
    inside_only = 'Nouse ajoneuvoon käyttääksesi sen ikkunoita.',
    usage = 'Käytä /{command} 1–4 tai all. 1 on kuljettajan, 2 etumatkustajan, 3 ja 4 takana.',
}
