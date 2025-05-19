
function color(c)
    c = c or "kanagawa"
    vim.cmd.colorscheme(c)

    vim.api.nvim_set_hl(0, "Normal", { bg="none"})
    vim.api.nvim_set_hl(0, "NormalFloat", { bg="none"})
end

color()
