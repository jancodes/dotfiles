return {
  'chrisgrieser/nvim-various-textobjs',
  lazy = false,
  config = function()
    -- https://github.com/chrisgrieser/nvim-various-textobjs#list-of-text-objects
    require('various-textobjs').setup({
      useDefaultKeymaps = false,
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup('markdown_keymaps', { clear = true }),
      pattern = { "copilot-chat" },
      callback = function()
        -- vim.keymap.set({ "o", "x" }, "aC", '<cmd>lua require("various-textobjs").mdFencedCodeBlock(false)<CR>',
        --   { desc = "Around Fenced Code Block" })
        vim.keymap.set({ "o", "x" }, "yic", '<cmd>lua require("various-textobjs").mdFencedCodeBlock(true)<CR>',
          { desc = "Inside Fenced Code Block" })
      end,
    })
  end,
}
