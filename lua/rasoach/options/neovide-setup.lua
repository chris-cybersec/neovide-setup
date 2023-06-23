
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here

local o = vim.o
local g = vim.g


-- guifont
  o.guifont = "Roboto_Mono_Light:h10"

-- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  g.neovide_transparency = 1.0
  g.transparency = 0.8
  g.neovide_background_color = "#f70419" .. alpha()

-- Scroll Animation Length
  g.neovide_scroll_animation_length = 0.3

-- Hiding the mouse when typing
  g.neovide_hide_mouse_when_typing = true

-- Cursor Animation_Length
  g.neovide_cursor_animation_length = 0.08

-- Cursor_Trail_Size
  g.neovide_cursor_trail_size = 0.2

-- Cursor Particles
  -- g.neovide_cursor_vfx_mode = "railgun"

  g.neovide_cursor_vfx_mode = "ripple"
end
