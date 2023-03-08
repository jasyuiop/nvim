-- leader key
vim.g.mapleader = " "

-- directory görünümüne dön
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Visual modda J/K ile highlight edilenleri taşımak
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- satırları tek satırda birleştirme
vim.keymap.set("n", "J", "mzJ`z")

-- cursoru ortada tutarak pagede hareket etmek
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- cursoru ortada tutarak search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "nzzzv")

-- "Q" ya basınca düttürüdüt demesin
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix / Location list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- cursorun üzerinde olduğu kelimeyi file'ın her yerinde değiştir
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- format düzgün çalışmazsa ->
vim.keymap.set("n", "<leader>nf", "<cmd>NullFormat<CR>")

-- Escape insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Ansible lsp'nın file'ı yaml dosyasından ayırt etmesi lazım
vim.keymap.set("n", "<leader>la", "<cmd>set ft=yaml.ansible<CR>")
