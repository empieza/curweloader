--[[
    Curwe Loader — test script
    Upload to: https://github.com/empieza/curweloader
]]

local test = {}; do
    local TAB = "LUA"
    local GROUP = "A"

    local refs = {
        label = ui.new_label(TAB, GROUP, "\a90EE90FF[test]\aFFFFFFFF loaded from GitHub"),
        enable = ui.new_checkbox(TAB, GROUP, "Test overlay"),
        color = ui.new_color_picker(TAB, GROUP, "Overlay color", 144, 238, 144, 255),
    }

    local function on_paint()
        if not ui.get(refs.enable) then
            return
        end

        local sw, sh = client.screen_size()
        local r, g, b, a = ui.get(refs.color)
        local text = "curwe test script"

        local tw, th = renderer.measure_text("", text)
        local x = math.floor(sw * 0.5 - tw * 0.5)
        local y = math.floor(sh * 0.5 + 120)

        renderer.rectangle(x - 8, y - 4, tw + 16, th + 8, 15, 15, 15, 180)
        renderer.text(x, y, r, g, b, a, "", 0, text)
    end

    client.set_event_callback("paint", on_paint)
    client.color_log(144, 238, 144, "[curwe test] \0")
    client.color_log(255, 255, 255, "script started")

    function test.unload()
        client.unset_event_callback("paint", on_paint)
        client.color_log(255, 180, 100, "[curwe test] \0")
        client.color_log(255, 255, 255, "script stopped")
    end
end

return test
