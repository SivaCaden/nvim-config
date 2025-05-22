return {
  "famiu/feline.nvim",
  config = function()
    local monokai = require("modules.theme")

    require("feline").setup({
      theme = monokai.theme,
      components = monokai.components,
      vi_mode_colors = monokai.vi_mode_colors,
    })
  end
}

