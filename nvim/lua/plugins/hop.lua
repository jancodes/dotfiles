return {
        'phaazon/hop.nvim',
        -- branch = 'v1', -- optional but strongly recommended
        config = function()
                local m = require 'mapx'

                require('hop').setup({
                        keys = 'etovxqpdygfblzhckisuran'
                })

                m.nmap("h", "<cmd>lua require'hop'.hint_char1()<cr>")
                m.nmap("l", "<cmd>lua require'hop'.hint_lines()<cr>")
                m.vmap("h", "<cmd>lua require'hop'.hint_char1()<cr>")
                m.vmap("l", "<cmd>lua require'hop'.hint_lines()<cr>")
        end
}
