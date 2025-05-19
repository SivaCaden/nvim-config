return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        local mason = require('mason')
        local lsp = require('mason-lspconfig')
       mason.setup({
            ui = {
                border = 'rounded',
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        })
        lsp.setup({
            ensure_installed = {
                'rust_analyzer',
                'lua_ls',
                'pyright',
            },
            automatic_installation = true,
        })
    end,
}
