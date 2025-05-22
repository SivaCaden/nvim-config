return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
        signs = {
            add = { text = "│" },
            change = { text = "│" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
        },
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, lhs, rhs, opts)
                opts = vim.tbl_extend("force", { buffer = bufnr }, opts or {})
                vim.keymap.set(mode, lhs, rhs, opts)
            end

            -- Navigation
            map("n", "]c", function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            map("n", "[c", function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })
        end,
    },
}
