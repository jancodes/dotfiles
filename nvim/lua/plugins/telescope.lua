local telescope = require('telescope')

telescope.load_extension('live_grep_args')

telescope.setup({
    defaults = {
        file_ignore_patterns = { "node_modules", "__snapshots__", "storybook-static" }
    }
})
