--[[
    Pigeon Vehicle Doors: German (Deutsch).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'de'
    to use it, or leave it on 'auto' and set ox_lib's language.
]]

Locales = Locales or {}

Locales.de = {
    title = 'Fahrzeugtüren',
    key_door = 'Tür öffnen / schließen',
    key_window = 'Fenster runter / hoch',
    key_hood = 'Motorhaube öffnen / schließen',
    key_trunk = 'Kofferraum öffnen / schließen',
    no_vehicle = 'Kein Fahrzeug in der Nähe.',
    locked = 'Das Fahrzeug ist abgeschlossen.',
    no_door = 'Das Fahrzeug hat diese Tür nicht.',
    driver_only = 'Das kann nur der Fahrer.',
    inside_only = 'Steig ins Fahrzeug, um die Fenster zu benutzen.',
    usage = 'Nutze /{command} 1 bis 4 oder all. 1 ist die Fahrertür, 2 der Beifahrer, 3 und 4 hinten.',
}
