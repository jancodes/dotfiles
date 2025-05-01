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
