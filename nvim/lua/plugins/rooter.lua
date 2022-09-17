require('nvim-rooter').setup {
  rooter_patterns = { '.git', 'package.json', 'node_modules', 'init.lua' },
  trigger_patterns = { '*' },
  manual = false,
}
