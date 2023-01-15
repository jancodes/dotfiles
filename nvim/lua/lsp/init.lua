local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
local mason_status_ok, mason = pcall(require, "mason")

mason.setup()

if not (mason_status_ok and mason_lspconfig_ok) then
  print("Mason, Mason LSP Config, or Completion not installed!")
  return
end

local servers = {
  "sumneko_lua",
  "tailwindcss",
  "tsserver",
  "jsonls",
  "cssls",
}

mason_lspconfig.setup({ ensure_installed = servers, automatic_installation = true })

require('lsp/lsp')
require('lsp/lua')

