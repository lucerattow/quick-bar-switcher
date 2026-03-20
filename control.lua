local function switch_three_layouts(player)
    local player_settings = settings.get_player_settings(player)
    local anchor_pos = player_settings["quick-bar-anchor-position"].value

    -- Collect the 3 non-anchor slot positions in order
    local other_pos = {}
    for i = 1, 4 do
        if i ~= anchor_pos then
            table.insert(other_pos, i)
        end
    end

    -- Detect current layout by what bar is at the first non-anchor slot
    local first_bar = player.get_active_quick_bar_page(other_pos[1])
    local bars
    if first_bar == 1 then
        bars = {4, 5, 6}   -- in layout A (1-3), advance to B (4-6)
    elseif first_bar == 4 then
        bars = {7, 8, 9}   -- in layout B (4-6), advance to C (7-9)
    else
        bars = {1, 2, 3}   -- in layout C (7-9) or unknown, reset to A (1-3)
    end

    player.set_active_quick_bar_page(anchor_pos, 10)
    player.set_active_quick_bar_page(other_pos[1], bars[1])
    player.set_active_quick_bar_page(other_pos[2], bars[2])
    player.set_active_quick_bar_page(other_pos[3], bars[3])
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
        switch_three_layouts(player)
    end
end

script.on_event("switch-quick-bar", function(event)
    local player = game.get_player(event.player_index)
    if player then
        switch_quick_bar(player)
    end
end)
