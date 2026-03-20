local function switch_three_layouts(player, active_quick_bar)
    if active_quick_bar == 1 then
        player.set_active_quick_bar_page(1, 4)
        player.set_active_quick_bar_page(2, 10)
        player.set_active_quick_bar_page(3, 5)
        player.set_active_quick_bar_page(4, 6)
    elseif active_quick_bar == 4 then
        player.set_active_quick_bar_page(1, 7)
        player.set_active_quick_bar_page(2, 10)
        player.set_active_quick_bar_page(3, 8)
        player.set_active_quick_bar_page(4, 9)
    else
        player.set_active_quick_bar_page(1, 1)
        player.set_active_quick_bar_page(2, 10)
        player.set_active_quick_bar_page(3, 2)
        player.set_active_quick_bar_page(4, 3)
    end
end

local function switch_two_layouts(player, active_quick_bar)
    if active_quick_bar <= 4 then
        player.set_active_quick_bar_page(1, 5)
        player.set_active_quick_bar_page(2, 6)
        player.set_active_quick_bar_page(3, 7)
        player.set_active_quick_bar_page(4, 8)
    else
        player.set_active_quick_bar_page(1, 1)
        player.set_active_quick_bar_page(2, 2)
        player.set_active_quick_bar_page(3, 3)
        player.set_active_quick_bar_page(4, 4)
    end
end

local function switch_quick_bar(player)
    local active_quick_bar = player.get_active_quick_bar_page(1)
    local player_settings = settings.get_player_settings(player)
    local layout_mode = player_settings["quick-bar-layout-mode"].value

    if layout_mode == "two" then
        switch_two_layouts(player, active_quick_bar)
    else
        switch_three_layouts(player, active_quick_bar)
    end
end

script.on_event("switch-quick-bar", function(event)
    local player = game.get_player(event.player_index)
    if player then
        switch_quick_bar(player)
    end
end)
