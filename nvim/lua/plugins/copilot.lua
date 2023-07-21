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
          accept = false,
          next = "<A-]>",
          dismiss = "<A-[>",
        }
      },
      filetypes = {
        ["*"] = true
      }
    })
  end,
}
