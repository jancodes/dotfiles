require('nvim-rooter').setup {
  rooter_patterns = { '.git', 'package.json', 'node_modules', '=src' },
  trigger_patterns = { '*' },
  manual = false,
}
