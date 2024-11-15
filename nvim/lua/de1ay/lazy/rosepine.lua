return {
  "rose-pine/neovim",
  name = "rose-pine",

  lazy = false,      -- make sure we load this during startup if it is your main colorscheme
  priority = 1000,   -- make sure to load this before all the other start plugins

  config = function()
    require("rose-pine").setup({
      variant = "auto",            -- auto, main, moon, or dawn
      dark_variant = "main",       -- main, moon, or dawn
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true,   -- Improve compatibility for previous versions of Neovim
        migrations = true,          -- Handle deprecated options automatically
      },

      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },
    })

    vim.cmd("colorscheme rose-pine")
  end,
}
