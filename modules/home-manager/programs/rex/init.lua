-- Rex configuration.
--
-- This ports the pane layout and navigation shortcuts from Ghostty. Rex owns
-- the multiplexer actions; font, cursor, and client appearance are configured
-- by the Rex client rather than this server-side Lua file.

-- Splits
rex.bind("cmd+j", "pane.split", { direction = "down" })
rex.bind("cmd+k", "pane.split", { direction = "up" })
rex.bind("cmd+h", "pane.split", { direction = "left" })
rex.bind("cmd+l", "pane.split", { direction = "right" })

-- Navigate splits. Rex exposes directional focus as a session method rather
-- than a documented client action, so use function bindings here.
local function focus(direction)
  return function()
    local _, err = rex.session.focus_direction({ direction = direction })
    if err ~= nil then
      rex.log("error", err)
      return false
    end
    return true
  end
end

rex.bind("ctrl+alt+j", focus("down"))
rex.bind("ctrl+alt+k", focus("up"))
rex.bind("ctrl+alt+h", focus("left"))
rex.bind("ctrl+alt+l", focus("right"))
