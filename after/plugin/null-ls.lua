require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.shfmt, -- shell script formatting
        require("null-ls").builtins.formatting.yamlfmt, -- shell script formatting
        -- diagnostics+actions default olarak çalışıyor shellcheck eklentisi yüklendiğinde
        -- çalışmazsa eğer ->
        --require("null-ls").builtins.diagnostics.shellcheck, -- shell script diagnostics
        --require("null-ls").builtins.code_actions.shellcheck, -- shell script code actions
    },
})
