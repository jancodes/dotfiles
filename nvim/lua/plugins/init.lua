return {
    -- leave first to allow global mapping
    {
        "b0o/mapx.nvim",
        config = function()
            require('mapx').setup {
                global = true
            }
        end,
    },
    -- no config nvim plugins
    "joechrisellis/lsp-format-modifications.nvim",
    "sudormrfbin/cheatsheet.nvim",
    -- brew install gnu-sed for spectre
    "windwp/nvim-spectre",
    -- telescope
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",

    'JoosepAlviste/nvim-ts-context-commentstring',
    'windwp/nvim-ts-autotag',

    -- no config vim plugins
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "tpope/vim-eunuch",
    "stefandtw/quickfix-reflector.vim",
    "tpope/vim-commentary",
    "tpope/vim-sleuth",
    "rhysd/conflict-marker.vim",
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "jancodes/lens.vim",
    "machakann/vim-highlightedyank",
    "andymass/vim-matchup",

    -- config nvim plugins

    -- lsp
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/nvim-lsp-ts-utils",

    -- cmp
    'hrsh7th/cmp-nvim-lsp',
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    -- cmp snippet
    -- "hrsh7th/cmp-vsnip",
    -- "hrsh7th/vim-vsnip",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- snippets
    { "rafamadriz/friendly-snippets", branch = 'main' },
    {
        "jancodes/markdown-preview.nvim",
        build = "cd app && npm install",
        init = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    },

    -- plugin have issues with Oil.nvim when repo has Make files
    -- "nathom/filetype.nvim",
}
