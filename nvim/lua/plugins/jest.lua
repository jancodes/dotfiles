return {
  'mattkubej/jest.nvim',
  config = function()
    require 'nvim-jest'.setup {
      jest_cmd = 'npm run test --',
      silent = false,
    }
  end
}
