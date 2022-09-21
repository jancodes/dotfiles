require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "phpdoc", "php" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
  },
  context_commentstring = {
    enable = true
  },
  autotag = {
    enable = true
  },
  matchup = {
    enable = true
  }
}

