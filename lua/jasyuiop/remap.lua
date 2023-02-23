-- leader key
vim.g.mapleader = " "

-- space + pv ile klasör görünümüne dön
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Visual modda J/K ile highlight ederek hareket ettirme
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- cursoru hareket ettirmeden satırları tek satırda birleştirme
vim.keymap.set("n", "J", "mzJ`z")

-- cursoru ortada tutarak ctrl + d / u ile pagede hareket etmek
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- cursoru ortada tutarak search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "nzzzv")

-- "Q" ya basınca düttürüdüt demesin
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix navigation
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- cursorun üzerinde olduğu kelimeyi tüm sayfada değiştirmeye yarıyor
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- bash script gibi dosyaları tek hamlede executable yapmaya yarıyor
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- null-ls'in çalıştığı bufferlarda NullFormat komutu geçerli oluyor
vim.keymap.set("n", "<leader>nf", "<cmd>NullFormat<CR>")

-- anlatmaya gerek yok görüyorsun
vim.keymap.set("i", "<C-c>", "<Esc>")

-- neovim üzerinde yapılan değişiklikleri çıkmadan geçerli kılmak source .zshrc gibi.
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)

-- Glow markdown preview
vim.keymap.set("n", "<leader>mp", "<cmd>Glow<CR>")

-- Ansible lsp için gerekli
vim.keymap.set("n", "<leader>la", "<cmd>set ft=yaml.ansible<CR>")
