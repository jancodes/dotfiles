local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require('packer')

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    local config = function(name)
        return string.format("require('plugins.%s')", name)
    end

    local use_with_config = function(path, name)
        use({ path, config = config(name) })
    end
    -- load impatient first after packer
    use_with_config('lewis6991/impatient.nvim', 'impatient')
    -- leave first to allow global mapping
    use_with_config ("b0o/mapx.nvim", "mapx")
    -- no config nvim plugins
    use "lukas-reineke/indent-blankline.nvim"
    use "David-Kunz/jester"
    use "sudormrfbin/cheatsheet.nvim"
    -- brew install gnu-sed
    use "windwp/nvim-spectre"
    -- telescope
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use {
        "nvim-telescope/telescope.nvim",
        requires = 'nvim-telescope/telescope-live-grep-args.nvim',
        config = config('telescope')
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        config = config('fzf')
    }

    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'windwp/nvim-ts-autotag'

    -- no config vim plugins
    use "mbbill/undotree"
    use "tpope/vim-fugitive"
    use "justinmk/vim-dirvish"
    use "tpope/vim-eunuch"
    use "stefandtw/quickfix-reflector.vim"
    use "tpope/vim-commentary"
    use "tpope/vim-sleuth"
    use "rhysd/conflict-marker.vim"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "camspiers/lens.vim"
    use "machakann/vim-highlightedyank"
    use "andymass/vim-matchup"

    -- config nvim plugins
    use_with_config("monsonjeremy/onedark.nvim", "onedark")
    use_with_config("jose-elias-alvarez/null-ls.nvim", "null")
    use {
        'phaazon/hop.nvim',
        -- branch = 'v1', -- optional but strongly recommended
        config = config("hop")
    }

    -- lsp
    use("neovim/nvim-lspconfig")
    use("jose-elias-alvarez/nvim-lsp-ts-utils")

    -- cmp
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    -- tabnine
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp', config = config("tabnine")}
    use "onsails/lspkind-nvim"
    -- cmp snippet
    -- use "hrsh7th/cmp-vsnip"
    -- use "hrsh7th/vim-vsnip"
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    -- snippets
    use { "rafamadriz/friendly-snippets", branch = 'main' }
    -- local cmp config
    require("plugins/cmp")
    -- treesitter
    use ({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = config("tree")
    })
    -- gitsigns
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = config("gitsigns")
    }
    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = config("lualine")
    }
    -- autopairs
    use_with_config("windwp/nvim-autopairs", "autopairs")
    use_with_config("jancodes/nvim-bufbar", "bufbar")
    use_with_config("folke/which-key.nvim", "whichkey")
    use_with_config("beauwilliams/focus.nvim", "focus")
    use_with_config('ggandor/lightspeed.nvim', 'lightspeed')
    use_with_config('ahmedkhalf/project.nvim', 'rooter')
    use_with_config('norcalli/nvim-colorizer.lua', 'colorizer')
    use_with_config('Maan2003/lsp_lines.nvim', 'lsplines')
    use_with_config('napmn/react-extract.nvim', 'reactextract')
    use_with_config("olimorris/persisted.nvim", "persisted")
    use_with_config('lvimuser/lsp-inlayhints.nvim', 'lspinlayhints')
    use_with_config('RRethy/vim-illuminate', 'illuminate')
    use_with_config('akinsho/toggleterm.nvim', 'toggleterm')
    -- c#
    use 'Issafalcon/lsp-overloads.nvim'

    use {
        'ruifm/gitlinker.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = config("gitlinker")
    }
    use({
        "jancodes/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" }, 
    })

    use("nathom/filetype.nvim")
    use_with_config("williamboman/mason.nvim", "mason")

    if packer_bootstrap then
        require('packer').sync()
    end
end)
