local builtin = require('telescope.builtin')
-- space + pf ile dosya bul
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- ctrl + p ile git files'lara bak
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- space + ps ile ripgrep kullanarak file'lar içerisinde birşey ara
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- help previewlere bak 
vim.keymap.set('n', '<leader>hp', builtin.help_tags, {})
