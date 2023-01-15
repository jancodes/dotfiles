return {
  "olimorris/persisted.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("persisted").setup({
      autoload = true,
    })
    require("telescope").load_extension("persisted") -- To load the telescope extension
  end
}
