require("lsp_lines").setup()

vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false
})

-- toggle for virtual lines
vim.keymap.set('n', '<leader>vl', function() local virtual_lines_enabled = not vim.diagnostic.config().virtual_lines vim.diagnostic.config({ virtual_lines = virtual_lines_enabled, virtual_text = not virtual_lines_enabled }) end)
