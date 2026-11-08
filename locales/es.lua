--[[
    Pigeon Vehicle Doors: Spanish (Español).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'es'
    to use it, or leave it on 'auto' and set ox_lib's language.
]]

Locales = Locales or {}

Locales.es = {
    title = 'Puertas del vehículo',
    key_door = 'Abrir / cerrar una puerta',
    key_window = 'Bajar / subir ventanilla',
    key_hood = 'Abrir / cerrar el capó',
    key_trunk = 'Abrir / cerrar el maletero',
    no_vehicle = 'No hay ningún vehículo cerca.',
    locked = 'Ese vehículo está cerrado con llave.',
    no_door = 'Ese vehículo no tiene esa puerta.',
    driver_only = 'Solo el conductor puede hacer eso.',
    inside_only = 'Sube al vehículo para usar sus ventanillas.',
    usage = 'Usa /{command} 1 a 4 o all. 1 es la del conductor, 2 la del copiloto, 3 y 4 las traseras.',
}
