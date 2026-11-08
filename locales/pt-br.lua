--[[
    Pigeon Vehicle Doors: Brazilian Portuguese (Português do Brasil).

    Translated from locales/en.lua, which has the notes on each line. If something reads
    wrong, please send a fix (see the README's Contributing section). Set Config.Locale = 'pt-br'
    to use it, or leave it on 'auto' and set ox_lib's language.
]]

Locales = Locales or {}

Locales['pt-br'] = {
    title = 'Portas do veículo',
    key_door = 'Abrir / fechar uma porta',
    key_window = 'Vidro para baixo / cima',
    key_hood = 'Abrir / fechar o capô',
    key_trunk = 'Abrir / fechar o porta-malas',
    no_vehicle = 'Não há nenhum veículo perto de você.',
    locked = 'Esse veículo está trancado.',
    no_door = 'Esse veículo não tem essa porta.',
    driver_only = 'Só o motorista pode fazer isso.',
    inside_only = 'Entre no veículo para usar os vidros.',
    usage = 'Use /{command} 1 a 4 ou all. 1 é a do motorista, 2 a do passageiro, 3 e 4 as de trás.',
}
