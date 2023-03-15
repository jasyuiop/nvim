local builtin = require('telescope.builtin')
-- find files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- find in files
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- find in git files, "git-ls-files" respect .gitignore
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})

-- live grep
vim.keymap.set('n', '<leader>pl', builtin.live_grep, {})

-- help
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})

-- diagnostics
vim.keymap.set('n', '<leader>pd', builtin.diagnostics, {})

-- man pages
vim.keymap.set('n', '<leader>pm', builtin.man_pages, {})

-- buffer
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
