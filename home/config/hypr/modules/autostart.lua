-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

require("modules.variables")

hl.on("hyprland.start", function()
    hl.exec_cmd("wayle panel start")
    -- hl.exec_cmd(Terminal)
    -- hl.exec_cmd("nm-applet")
    -- hl.exec_cmd("hyprpaper")
end)
