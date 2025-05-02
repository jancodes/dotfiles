return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    vim.o.formatexpr = "vim:lua.require'conform'.formatexpr()"
    require("conform").setup({
      format_after_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match("/node_modules/") then
          return
        end

        return { timeout_ms = 500, lsp_fallback = true, async = true }
      end,
      formatters_by_ft = {
        ["javascript"] = { "prettierd", "eslint_d" },
        ["javascriptreact"] = { "prettierd", "eslint_d" },
        ["typescript"] = { "prettierd", "eslint_d" },
        ["typescriptreact"] = { "prettierd", "eslint_d" },
        ["css"] = { "prettierd" },
        ["scss"] = { "prettierd" },
        ["less"] = { "prettierd" },
        ["html"] = { "prettierd" },
        ["json"] = { "prettierd" },
        ["jsonc"] = { "prettierd" },
        ["yaml"] = { "prettierd" },
        ["markdown"] = { "prettierd" },
        ["markdown.mdx"] = { "prettierd" },
      },

    })
    require("conform.formatters.prettierd").args = function(ctx)
      local args = { "--stdin-filepath", "$FILENAME" }
      local found = vim.fs.find("~/.config/nvim/utils/linter-config/prettier.config.js",
        { upward = true, path = ctx.dirname })[1]

      if found then
        vim.list_extend(args, { "--config", found })
      end
      return args
    end
  end
}
