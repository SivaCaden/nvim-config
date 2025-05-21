return {
    {
        "neovim/nvim-lspconfig",
        event = {"BufReadPre", "BufNewFile"},
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            { "antosha417/nvim-lsp-file-operations", config = true },
        },


        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            local opts = { noremap = true, silent = true }
            local on_attach = function(client, bufnr)
                opts.buffer = bufnr
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

            end
            local capabilities = cmp_nvim_lsp.default_capabilities()

            local signs = {
                Error = "✗",
                Warn = "⚠",
                Hint = "➤",
                Info = "ℹ",
            }

             lspconfig["pyright"].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoImportCompletions = true,
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",

                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            }

            lspconfig["pylsp"].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            ignore = {"W391"},
                            maxLineLength = 100,
                            pyflakes = { enabled = false },
                            flake8 = { enabled = false },
                            pycodestyle = { enabled = false },
                            pylint = { enabled = false },
                            mccabe = { enabled = false },
                            yapf = { enabled = true },
                        },
                    },
                },
            }

            lspconfig["ts_ls"].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    javascript = {
                        format = {
                            enable = true,
                        },
                    },
                    typescript = {
                        format = {
                            enable = true,
                        },
                    },
                },
            }
            lspconfig["rust_analyzer"].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        diagnostics = {
                            enable = false,
                        },
                    },
                },
            }
            lspconfig["lua_ls"].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }


            -- Additional setup for specific servers can go here
        end,
    }
}
