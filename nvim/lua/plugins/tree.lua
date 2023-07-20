return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()

    require('nvim-treesitter.configs').setup {
      ensure_installed = { "javascript", "typescript", "tsx", "html", "css", "scss", "json", "yaml", "lua", "bash", "dockerfile", "vim", "python", "c", "c_sharp", "cmake", "git_config", "git_rebase", "gitcommit", "gitignore", "go", "graphql", "java", "jsdoc", "make", "vimdoc", "yaml" },
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
  end
}
