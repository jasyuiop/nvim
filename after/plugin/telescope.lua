local builtin = require('telescope.builtin')
-- space + pf ile dosya bul
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- ctrl + p ile git files'lara bak
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- space + ps ile ripgrep kullanarak file'lar içerisinde birşey ara
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- live grep
vim.keymap.set('n', '<leader>pl', builtin.live_grep, {})

-- help previewlere bak 
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
