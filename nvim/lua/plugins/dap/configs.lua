-- Launch or attach to a running Javascript/Typescript process
local jsOrTs = {
  {
    type = 'node2';
    name = 'Launch',
    request = 'launch';
    program = '${file}';
    cwd = vim.fn.getcwd();
    sourceMaps = true;
    protocol = 'inspector';
    console = 'integratedTerminal';
  },
  {
    type = 'node2';
    name = 'Attach',
    request = 'attach';
    program = '${file}';
    cwd = vim.fn.getcwd();
    sourceMaps = true;
    protocol = 'inspector';
    console = 'integratedTerminal';
  },
}

local chrome_debugger = {
  type = "pwa-chrome",
  request = "launch",
  name = "Chrome",
  webRoot = "${workspaceFolder}",
}

return {
  setup = function(dap)
    dap.configurations = {
      javascript = jsOrTs,
      typescript = jsOrTs,
      javascriptreact = chrome_debugger,
    }
  end
}
