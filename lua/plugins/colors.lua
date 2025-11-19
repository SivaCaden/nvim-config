return {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        styles = {},
        transparent = false,
        terminal_colors = true,
    },
    config = function(_, opts)
        require("eldritch").setup(opts)
        vim.cmd.colorscheme("eldritch")

        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
    end,
}
