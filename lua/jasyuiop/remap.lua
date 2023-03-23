-- leader key
vim.g.mapleader = " "

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
-- vim.keymap.set("n", "<leader>nf", "<cmd>NullFormat<CR>")

-- Escape insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- unhighlight search
vim.keymap.set("n", "<CR>", ":nohlsearch<cr>", { silent = true })

-- executable files
vim.keymap.set("n", "<leader>ex", "<cmd>!chmod +x %<CR>", { silent = true })

-- ansible file'ı olduğu tanımlanmadan önce diğer yaml ile alakalı lsp serverlar
-- da çalıştığı için sorun olmaması açısından onları durduruyorum.
function ANSIBLE()
  vim.cmd "set ft=yaml.ansible"
  vim.cmd "LspStop"
  vim.cmd "LspStart"
end

-- ansiblels'nin çalışması için yaml.ansible olarak tanımlanması lazım
vim.keymap.set("n", "<leader>la", "<cmd>lua ANSIBLE()<CR>")
