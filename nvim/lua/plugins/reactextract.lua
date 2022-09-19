local m = require('mapx')

require('react-extract').setup()

m.vmap("<Leader>ec", "<cmd>lua require('react-extract').extract_to_new_file()<cr>")
