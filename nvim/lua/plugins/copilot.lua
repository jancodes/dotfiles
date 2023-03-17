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
          -- accept_word = false,
          -- accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        }
      }
    })
  end,
}
