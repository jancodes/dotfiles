local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Setup lspconfig.
local capabilities = cmp_nvim_lsp.default_capabilities()
local capabilitiesWithSnippetSupport = cmp_nvim_lsp.default_capabilities()
capabilitiesWithSnippetSupport.textDocument.completion.completionItem.snippetSupport = true
-- local servers = { 'tsserver', 'html' }
local servers = { 'html' }
local serversWithSnippetSupport = { 'cssls', 'jsonls' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
    }
end
for _, lsp in ipairs(serversWithSnippetSupport) do
    lspconfig[lsp].setup {
        capabilities = capabilitiesWithSnippetSupport,
    }
end

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end
local on_attach = function(client, bufnr)
    if client.server_capabilities.signatureHelpProvider then
        local lsp_format_modifications = require "lsp-format-modifications"
        lsp_format_modifications.attach(client, bufnr, { format_on_save = false })
    end
end


-- lspconfig.tailwindcss.setup {
--     root_dir = lspconfig.util.root_pattern('tailwind.config.js', 'tailwind.config.ts'),
--     flags = { debounce_text_changes = 150 }
-- }

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
    }
)

-- html lsp
lspconfig.html.setup {}

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅙',
            [vim.diagnostic.severity.INFO] = '󰋼',
            [vim.diagnostic.severity.HINT] = '󰌵',
            [vim.diagnostic.severity.WARN] = '',
        },
        -- linehl = {
        --   [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
        -- },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
        },
    },
})

-- go lsp
lspconfig.gopls.setup({
    -- custom settings here
    -- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#configuration
})
