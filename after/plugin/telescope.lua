local builtin = require('telescope.builtin')
-- find files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- ripgrep kullanarak file'lar içerisinde ara
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- live grep
vim.keymap.set('n', '<leader>pl', builtin.live_grep, {})

-- help previewlere bak
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
