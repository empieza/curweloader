local example = {}; do
    local ref = ui.new_checkbox("LUA", "A", "Curwe example loaded")

    client.set_event_callback("paint_ui", function()
        if ui.get(ref) and ui.is_menu_open() then
            renderer.text(12, 12, 144, 238, 144, 255, "", 0, "curwe example is active")
        end
    end)

    function example.unload()
        ui.set_visible(ref, false)
    end
end

return example
