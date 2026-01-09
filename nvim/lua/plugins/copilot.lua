return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "VimEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<TAB>",
          next = "<A-]>",
          dismiss = "<A-[>",
        }
      },
      panel = {
        enabled = false
      },
      filetypes = {
        ["*"] = true
      },
      copilot_node_command = vim.fn.trim(vim.fn.system('fnm exec --using=24 which node')),
      server_opts_overrides = {
        settings = {
          telemetry = {
            telemetryLevel = "off",
          },
        },
      }
    })
  end,
}
