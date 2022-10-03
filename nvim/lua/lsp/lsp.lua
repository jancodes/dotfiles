local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Setup lspconfig.
local defaultCapabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = cmp_nvim_lsp.update_capabilities(defaultCapabilities)
local capabilitiesWithSnippetSupport = cmp_nvim_lsp.update_capabilities(defaultCapabilities)
capabilitiesWithSnippetSupport.textDocument.completion.completionItem.snippetSupport = true
local servers = { 'tsserver', 'omnisharp' }
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
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.format()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    buf_map(bufnr, "n", "[g", ":LspDiagPrev<CR>")
    buf_map(bufnr, "n", "]g", ":LspDiagNext<CR>")
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
    if client.server_capabilities.documentFormattingProvider then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
    end
    --- Guard against servers without the signatureHelper capability
    if client.server_capabilities.signatureHelpProvider then
        require('lsp-overloads').setup(client, {
            ui = {
              -- The border to use for the signature popup window. Accepts same border values as |nvim_open_win()|.
              border = "single"
            },
            keymaps = {
              next_signature = "<C-j>",
              previous_signature = "<C-k>",
              next_parameter = "<C-l>",
              previous_parameter = "<C-h>",
            },
        })
    end
end

lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({
            enable_import_on_completion = true,
            update_imports_on_move = true,
            require_confirmation_on_move = false,
        })
        ts_utils.setup_client(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        buf_map(bufnr, "n", "grf", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspImportCurrent<CR>")
        on_attach(client, bufnr)
    end,
  -- for lsp-inlayhints
    settings = {
        typescript = {
          inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            }
        },
        javascript = {
          inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            }
        }
    }
})

lspconfig.cssls.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
  })

lspconfig.jsonls.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
  })

lspconfig.tailwindcss.setup{
    root_dir = lspconfig.util.root_pattern('tailwind.config.js', 'tailwind.config.ts'),
    flags = { debounce_text_changes = 150 }
}

-- C# LSP
local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/local/bin/omnisharp/run"

lspconfig.omnisharp.setup({
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    on_attach = on_attach
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- replace default lsp symbols
local function lspSymbol(name, icon)
  vim.fn.sign_define(
    'DiagnosticSign' .. name,
    { text = icon, numhl = 'DiagnosticDefault' .. name }
  )
end

lspSymbol('Error', '')
lspSymbol('Information', '')
lspSymbol('Hint', '')
lspSymbol('Info', '')
lspSymbol('Warn', '')
