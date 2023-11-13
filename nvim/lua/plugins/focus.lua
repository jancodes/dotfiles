return {
    "nvim-focus/focus.nvim",
    version = '*',
    config = function()
        require("focus").setup({
            autoresize = {
                enable = true,        -- Enable or disable auto-resizing of splits
                width = 0,            -- Force width for the focused window
                height = 0,           -- Force height for the focused window
                minwidth = 0,         -- Force minimum width for the unfocused window
                minheight = 0,        -- Force minimum height for the unfocused window
                height_quickfix = 10, -- Set the height of quickfix panel
            },
        })
        local ignore_buftypes = {
            -- "toggleterm",
            -- "dirvish",
            -- "fugitive",
            -- "packer",
            -- "spectre_panel",
            -- "TelescopePrompt",
            -- "vim",
            "onfile",
            "prompt",
            "popup",
            "quickfix"
        }
        local ignore_filetypes = {
            "help"
        }

        local augroup =
            vim.api.nvim_create_augroup('FocusDisable', { clear = true })

        vim.api.nvim_create_autocmd('WinEnter', {
            group = augroup,
            callback = function(_)
                if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
                    vim.b.focus_disable = true
                end
            end,
            desc = 'Disable focus autoresize for BufType',
        })

        vim.api.nvim_create_autocmd('FileType', {
            group = augroup,
            callback = function(_)
                if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
                    vim.b.focus_disable = true
                end
            end,
            desc = 'Disable focus autoresize for FileType',
        })

        local m = require 'mapx'

        m.nmap('<leader>h', ':FocusSplitLeft<cr>', 'silent')
        m.nmap('<leader>j', ':FocusSplitDown<cr>', 'silent')
        m.nmap('<leader>k', ':FocusSplitUp<cr>', 'silent')
        m.nmap('<leader>l', ':FocusSplitRight<cr>', 'silent')
    end
}
