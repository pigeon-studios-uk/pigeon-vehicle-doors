--[[
    Pigeon Vehicle Doors: Norwegian (Norsk).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'no'
    to use it, or leave it on 'auto' and set ox_lib's language.
]]

Locales = Locales or {}

Locales.no = {
    title = 'Kjøretøydører',
    key_door = 'Åpne / lukk en dør',
    key_window = 'Vindu ned / opp',
    key_hood = 'Åpne / lukk panseret',
    key_trunk = 'Åpne / lukk bagasjerommet',
    no_vehicle = 'Det er ingen kjøretøy i nærheten.',
    locked = 'Det kjøretøyet er låst.',
    no_door = 'Det kjøretøyet har ikke den døren.',
    driver_only = 'Bare sjåføren kan gjøre det.',
    inside_only = 'Sett deg inn i kjøretøyet for å bruke vinduene.',
    usage = 'Bruk /{command} 1 til 4 eller all. 1 er sjåførens, 2 passasjerens foran, 3 og 4 bak.',
}
