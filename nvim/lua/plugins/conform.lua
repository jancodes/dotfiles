return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    vim.o.formatexpr = "vim:lua.require'conform'.formatexpr()"
    require("conform").setup({
      format_on_save = function(bufnr)
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match("/node_modules/") then
          return
        end

        return { timeout_ms = 500, lsp_fallback = true, async = true }
      end,
      formatters_by_ft = {
        -- ["javascript"] = { { "eslint_d", "prettierd" } },
        -- ["javascriptreact"] = { { "eslint_d", "prettierd" } },
        -- ["typescript"] = { { "eslint_d", "prettierd" } },
        -- ["typescriptreact"] = { { "eslint_d", "prettierd" } },
        ["javascript"] = { { "prettierd" } },
        ["javascriptreact"] = { { "prettierd" } },
        ["typescript"] = { { "prettierd" } },
        ["typescriptreact"] = { { "prettierd" } },
        ["css"] = { { "prettierd" } },
        ["scss"] = { { "prettierd" } },
        ["less"] = { { "prettierd" } },
        ["html"] = { { "prettierd" } },
        ["json"] = { { "prettierd" } },
        ["jsonc"] = { { "prettierd" } },
        ["yaml"] = { { "prettierd" } },
        ["markdown"] = { { "prettierd" } },
        ["markdown.mdx"] = { { "prettierd" } },
      },

    })
    require("conform.formatters.prettier").args = function(ctx)
      local args = { "--stdin-filepath", "$FILENAME" }
      local found = vim.fs.find("~/.config/nvim/utils/linter-config/prettier.config.js",
        { upward = true, path = ctx.dirname })[1]

      print(found)
      print(args)
      if found then
        vim.list_extend(args, { "--config", found })
      end
      return args
    end
  end
}
