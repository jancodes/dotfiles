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

        -- Eslint if eslint config exist or use prettier
        function()
            local utils = require("null-ls.utils").make_conditional_utils()

            local has_eslint = utils.root_has_file(".eslintrc.js") or utils.root_has_file(".eslintrc.json")

            if has_eslint then
                -- returns a prettier that only affects those file types
                return formatter.prettier.with({
                    filetypes = {
                        "css",
                        "html",
                        "yaml",
                        "markdown",
                        "json",
                    },
                    args = {
                        "--stdin-filepath",
                        "$FILENAME",
                    },
                })
            else
                return formatter.prettier.with({
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
                    },
                })
            end
        end
    },
    on_attach = function(client)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
        end
    end,
})
