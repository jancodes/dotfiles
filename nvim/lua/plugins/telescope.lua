local telescope = require('telescope')

telescope.load_extension('live_grep_raw')

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules" }
    }
})
