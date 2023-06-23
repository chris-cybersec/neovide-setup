local status, colorizer = pcall(require, "colorizer")
if not status then
  return
end

local default_options = {
  RGB      = true;         -- #RGB hex codes
        RRGGBB   = true;         -- #RRGGBB hex codes
        names    = true;         -- "Name" codes like Blue
        RRGGBBAA = false;        -- #RRGGBBAA hex codes
        rgb_fn   = false;        -- CSS rgb() and rgba() functions
        hsl_fn   = false;        -- CSS hsl() and hsla() functions
        css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
}

local options = {
  css = default_options;
  scss = default_options;
}

colorizer.setup(options)
