return {
    {
        "SivaCaden/catdo.nvim",

        config = function()
            require("catdo").setup()
        end,
        keys = {
            { "<leader>ct", "<cmd>Catdo<cr>", desc = "catdo" },
       },

    },
}
