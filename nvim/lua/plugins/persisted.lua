require("persisted").setup({
    autoload = true,
    autosave = true,
})
require("telescope").load_extension("persisted") -- To load the telescope extension
