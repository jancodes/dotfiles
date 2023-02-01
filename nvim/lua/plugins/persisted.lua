return {
  "olimorris/persisted.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("persisted").setup({
      autoload = true,
      on_autoload_no_session = function()
        vim.notify("No existing session to load.")
      end
    })
    require("telescope").load_extension("persisted") -- To load the telescope extension
  end
}
