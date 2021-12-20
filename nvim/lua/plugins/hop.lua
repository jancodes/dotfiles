local u = require("utils")
require('hop').setup ({
    keys = 'etovxqpdygfblzhckisuran'
})

u.nmap("h","<cmd>lua require'hop'.hint_char1()<cr>" )
u.nmap("l","<cmd>lua require'hop'.hint_lines()<cr>" )
