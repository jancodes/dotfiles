return {
    'NiklasV1/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup {
            css = {
                rgb_fn = true,
            },
            'typescriptreact',
            'javascript',
            'javascriptreact',
            html = {
                mode = 'foreground',
                names = false,
            },
            sh = {
                mode = 'foreground',
            },
        }
    end
}
