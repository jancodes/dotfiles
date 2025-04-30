return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },                   -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",                          -- Only on MacOS or Linux
    opts = {
      model = "gpt-4.1",
      sticky = '#buffers',
      -- mappings = {
      --   complete = {
      --     normal = "<Tab>",
      --   }
      -- },
    },
  },
}
