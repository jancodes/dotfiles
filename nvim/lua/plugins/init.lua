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
    -- leave first to allow global mapping
    use_with_config ("b0o/mapx.nvim", "mapx")
    -- no config nvim plugins
    use "sudormrfbin/cheatsheet.nvim"
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
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
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

    -- autopairs
    use_with_config("windwp/nvim-autopairs", "autopairs")

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = config("lualine")
    }
    use_with_config("jancodes/nvim-bufbar", "bufbar")

    use_with_config("folke/which-key.nvim", "whichkey")
    use_with_config("beauwilliams/focus.nvim", "focus")
    use_with_config('ggandor/lightspeed.nvim', 'lightspeed')
    use_with_config('jedi2610/nvim-rooter.lua', 'rooter')
    use_with_config('norcalli/nvim-colorizer.lua', 'colorizer')
    use_with_config('Maan2003/lsp_lines.nvim', 'lsplines')
    use_with_config('napmn/react-extract.nvim', 'reactextract')

    -- use_with_config("glepnir/dashboard-nvim", "dashboard")
    use_with_config("olimorris/persisted.nvim", "persisted")
    use_with_config("lukas-reineke/indent-blankline.nvim", "indentblank")

    if packer_bootstrap then
        require('packer').sync()
    end
end)
