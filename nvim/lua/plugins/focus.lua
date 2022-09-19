require("focus").setup({
    autoresize = false,
    excluded_filetypes = {
        -- "toggleterm",
        "dirvish",
        "fugitive",
        "packer",
        "spectre_panel",
        "TelescopePrompt",
        "vim"
    },
    excluded_buftypes = {
        "help"
    }
})

local m = require'mapx'

m.nmap('<leader>h', ':FocusSplitLeft<cr>', 'silent')
m.nmap('<leader>j', ':FocusSplitDown<cr>', 'silent')
m.nmap('<leader>k', ':FocusSplitUp<cr>', 'silent')
m.nmap('<leader>l', ':FocusSplitRight<cr>', 'silent')
