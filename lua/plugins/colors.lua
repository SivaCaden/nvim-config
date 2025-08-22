return {
  "eldritch-theme/eldritch.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- keep it minimal; just ensure styles exists
    styles = {},            -- ← prevents “attempt to index field 'styles' (a nil value)”
    transparent = false,
    terminal_colors = true,
  },
  config = function(_, opts)
    require("eldritch").setup(opts)
    vim.cmd.colorscheme("eldritch")
  end,

}
