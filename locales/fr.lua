--[[
    Pigeon Vehicle Doors: French (Français).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'fr'
    to use it, or leave it on 'auto' and set ox_lib's language.
]]

Locales = Locales or {}

Locales.fr = {
    title = 'Portes du véhicule',
    key_door = 'Ouvrir / fermer une porte',
    key_window = 'Baisser / monter la vitre',
    key_hood = 'Ouvrir / fermer le capot',
    key_trunk = 'Ouvrir / fermer le coffre',
    no_vehicle = 'Il n\'y a aucun véhicule près de toi.',
    locked = 'Ce véhicule est verrouillé.',
    no_door = 'Ce véhicule n\'a pas cette porte.',
    driver_only = 'Seul le conducteur peut faire ça.',
    inside_only = 'Monte dans le véhicule pour utiliser ses vitres.',
    usage = 'Utilise /{command} 1 à 4 ou all. 1 est celle du conducteur, 2 du passager avant, 3 et 4 à l\'arrière.',
}
