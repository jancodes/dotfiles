local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
local mason_status_ok, mason = pcall(require, "mason")

mason.setup()

if not (mason_status_ok and mason_lspconfig_ok) then
  print("Mason, Mason LSP Config, or Completion not installed!")
  return
end

local servers = {
  "lua_ls",
  "tailwindcss",
  "tsserver",
  "jsonls",
  "cssls",
  -- not all servers here since mason lspconfig does not support all
}

mason_lspconfig.setup({ ensure_installed = servers, automatic_installation = true })

require('lsp/lsp')
require('lsp/lua')
