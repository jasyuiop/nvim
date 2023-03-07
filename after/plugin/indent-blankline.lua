vim.cmd [[highlight IndentBlanklineIndent1 guifg=#7c6f64 gui=nocombine]]

require("indent_blankline").setup {
    show_current_context = true,
    char_highlight_list = {
        "indentblanklineindent1",
    },
}
