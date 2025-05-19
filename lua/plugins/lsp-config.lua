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

            local keymap = vim.keymap
            local opts = { noremap = true, silent = true }
            local on_attach = function(client, bufnr)
                opts.buffer = bufnr

                opts.desc = "Show lsp references"
                keymap.set("n", "<leader>gR", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "goto definition"
                keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

                opts.desc = "Show lsp type definition"
                keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                opts.desc = "hover"
                keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
                
                opts.desc = "Rename"
                keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

                opts.desc = "Code action"
                keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

                opts.desc = "Formatting"
                keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0>CR>", opts)

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

                opts.desc = "restart lsp server"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
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
