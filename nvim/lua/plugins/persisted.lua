return {
  "jancodes/persisted.nvim",
  branch = "feat/disable-autoloading-default-branch",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("persisted").setup({
      autoload = true,
      on_autoload_no_session = function()
        vim.notify("No existing session to load.")
      end,
      use_git_branch = true,
      use_fallback_branch = false,
    })
    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "PersistedSavePre",
      callback = function()
        vim.cmd("doautocmd User SessionSavePre")
      end
    })
    require("telescope").load_extension("persisted") -- To load the telescope extension
  end
}
