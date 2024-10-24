local current_quick_bar = 1 -- Variable para rastrear la barra rápida actual

-- Función para alternar entre las páginas de la barra rápida
local function switch_quick_bar(player)
    -- Obtener la página actual de la barra rápida (index 1 es la primera fila visible en pantalla)
    local active_quick_bar = player.get_active_quick_bar_page(1)

    -- Cambiar entre las barras 1-4 y 5-8
    if active_quick_bar <= 4 then
        player.set_active_quick_bar_page(1, 5) -- Cambia a las barras 5-8
        player.set_active_quick_bar_page(2, 6) -- Cambia a las barras 5-8
        player.set_active_quick_bar_page(3, 7) -- Cambia a las barras 5-8
        player.set_active_quick_bar_page(4, 8) -- Cambia a las barras 5-8
    else
        player.set_active_quick_bar_page(1, 1) -- Cambia a las barras 1-4
        player.set_active_quick_bar_page(2, 2) -- Cambia a las barras 1-4
        player.set_active_quick_bar_page(3, 3) -- Cambia a las barras 1-4
        player.set_active_quick_bar_page(4, 4) -- Cambia a las barras 1-4
    end
end

-- Evento para manejar la tecla personalizada
script.on_event("switch-quick-bar", function(event)
    local player = game.get_player(event.player_index)
    if player then
        switch_quick_bar(player)
    end
end)

-- Configuración para manejar cuando se cambian las teclas en las configuraciones del jugador
script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
    if event.setting == "quick-bar-switch-key" then
        local new_key_sequence = settings.get_player_settings(event.player_index)["quick-bar-switch-key"].value
        game.custom_input_prototypes["switch-quick-bar"].key_sequence = new_key_sequence -- Actualizar la combinación de teclas
    end
end)
