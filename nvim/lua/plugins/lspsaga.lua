return {
  "nvimdev/lspsaga.nvim",
  event = "BufRead",
  config = function()
    require("lspsaga").setup({
      symbol_in_winbar = {
        enable = false
      }
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } }
}

