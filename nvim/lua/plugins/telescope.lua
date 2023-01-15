return {
    "nvim-telescope/telescope.nvim",
    dependencies = 'nvim-telescope/telescope-live-grep-args.nvim',
    config = function()
        local telescope = require('telescope')

        telescope.load_extension('live_grep_args')

        telescope.setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    "__snapshots__",
                    "storybook-static",
                    "package-lock.json",
                    "yarn.lock"
                }
            }
        })
    end
}
