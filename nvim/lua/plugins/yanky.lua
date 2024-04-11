return {
  "gbprod/yanky.nvim",
  config = function()
    require("yanky").setup({
      ring = {
        history_length = 5
      },
      picker = {
        select = {
          action = require("yanky.picker").actions.set_register(require("yanky.utils").get_default_register())
        },
        telescope = {
          mappings = nil, -- nil to use default mappings
        },
      },
    })
  end
}
