return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null = require('null-ls')
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null.setup({
      sources = {
        -- Formatters
        null.builtins.formatting.prettierd.with {
          extra_filetypes = {
            'handlebars',
          },
          condition = function(utils)
            return utils.root_has_file { '.prettierrc', '.prettierignore' }
          end,
        },
        require("none-ls.formatting.eslint_d"),
        null.builtins.formatting.stylua,

        -- Diagnostics
        require("none-ls.diagnostics.eslint_d"),

        -- Code Actions
        require("none-ls.code_actions.eslint"),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format({
                async = false,
                filter = function(client)
                  return client.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })
  end,
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
}
