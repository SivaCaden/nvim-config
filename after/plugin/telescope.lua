local buitlin = require('telescope.builtin')

vim.keymap.set("n", "<leader>pf", buitlin.find_files, {})
vim.keymap.set("n", "<C-p>", buitlin.git_files, {})
