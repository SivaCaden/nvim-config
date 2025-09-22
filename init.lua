require('siva')

vim.api.nvim_create_autocmd({'BufNew', 'BufEnter'}, {
    pattern = { '*.p8' },
    callback = function(args)
        vim.lsp.start({
            name = 'pico8-ls',
            cmd = { 'pico8-ls', '--stdio' },
            root_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(args.buf)),
            -- Setup your keybinds in the on_attach function
            on_attach = on_attach,
        })
    end
})
