--[[
    Pigeon Vehicle Doors: Swedish (Svenska).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'sv'
    to use it, or leave it on 'auto' and set ox_lib's language.
]]

Locales = Locales or {}

Locales.sv = {
    title = 'Fordonsdörrar',
    key_door = 'Öppna / stäng en dörr',
    key_window = 'Ruta ner / upp',
    key_hood = 'Öppna / stäng motorhuven',
    key_trunk = 'Öppna / stäng bagageluckan',
    no_vehicle = 'Det finns inget fordon nära dig.',
    locked = 'Det fordonet är låst.',
    no_door = 'Det fordonet har inte den dörren.',
    driver_only = 'Bara föraren kan göra det.',
    inside_only = 'Sätt dig i fordonet för att använda rutorna.',
    usage = 'Använd /{command} 1 till 4 eller all. 1 är förarens, 2 passagerarens fram, 3 och 4 bak.',
}
