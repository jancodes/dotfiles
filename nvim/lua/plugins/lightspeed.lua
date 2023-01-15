return {
  'ggandor/lightspeed.nvim',
  config = function()
    require('lightspeed').setup {
      repeat_ft_with_target_char = true,
    }
  end
}
