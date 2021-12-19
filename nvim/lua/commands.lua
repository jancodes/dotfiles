local u = require("utils")

u.nmap("<CR>", "(&buftype is# '' ? ':w<CR>' : '<CR>')", { expr = true })

