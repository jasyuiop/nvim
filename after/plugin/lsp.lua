local lsp = require("lsp-zero")

lsp.preset("recommended")

-- 'ansiblels', 'bashls', 'docker_compose_language_service', 'gopls', 'jsonls',
-- 'marksman', 'pyright', 'rust_analyzer', 'yamlls', 'ansible_lint', 'golangcilint',
-- 'markdownlint', 'pylint', 'shellcheck', 'yamllint', 'autopep8', 'goimports',
-- 'rustfmt', 'shfmt', 'yamlfmt', 'bash-debug-adapter', 'delve',
lsp.ensure_installed({
    'lua_ls',
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      telemetry = { enable = false },
    }
  }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- lsp-zero yazarı .setup_nvim_cmp'den kurtulmak istiyor bu yüzden yerine
--cmp.setup(cmp_mappings)
-- gibi bir şey kullanabilirim (tab hala işliyor bi bak ilerde)
lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '',
        warn = '',
        hint = '󰘥',
        info = ''
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)

        local format_cmd = function(input)
            vim.lsp.buf.format({
                id = client.id,
                timeout_ms = 5000,
                async = input.bang,
            })
        end

        local bufcmd = vim.api.nvim_buf_create_user_command
        bufcmd(bufnr, 'NullFormat', format_cmd, {
            bang = true,
            range = true,
            desc = 'Format using null-ls'
        })
    end,
    sources = {
        require("null-ls").builtins.formatting.shfmt, -- shell script formatting
        require("null-ls").builtins.formatting.yamlfmt, -- yaml formatting
        require("null-ls").builtins.formatting.autopep8, -- python formatting
    }
})
