return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {
      detection_methods = { "pattern" },
      patterns = { 'package.json', 'node_modules', 'init.lua', 'turbo.json', '.git' },
      silent_chdir = false,
      manual = false,
    }
  end
}
