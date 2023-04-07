local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
return {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
        local null_ls = require("null-ls")

        local formatter = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local actions = null_ls.builtins.code_actions

        null_ls.setup({
            sources = {
                -- Formatters
                formatter.eslint_d,

                -- Diagnostics
                diagnostics.eslint_d,

                -- Code actions
                actions.eslint_d,

                formatter.prettierd.with({
                    filetypes = {
                        "css",
                        "html",
                        "yaml",
                        "markdown",
                        "json",
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                    },
                    args = {
                        "--stdin-filepath",
                        "$FILENAME",
                    }
                })
            },
            -- on_attach = function(client, bufnr)
            --     if client.supports_method("textDocument/formatting") then
            --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr, })
            --         vim.api.nvim_create_autocmd("BufWritePre", {
            --             group = augroup,
            --             buffer = bufnr,
            --             callback = function()
            --                 vim.lsp.buf.format({
            --                     bufnr = bufnr,
            --                     filter = function(client)
            --                         return client.name == 'null-ls'
            --                     end
            --             })
            --             end,
            --         })
            --     end
            -- end,
        })
    end
}
