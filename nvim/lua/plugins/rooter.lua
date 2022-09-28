require('project_nvim').setup {
  detection_methods = { "lsp", "pattern" },
  patterns = { '.git', 'package.json', 'node_modules', 'init.lua', 'turbo.json' },
  manual = false,
}
