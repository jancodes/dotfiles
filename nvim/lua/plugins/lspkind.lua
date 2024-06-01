return {
    "onsails/lspkind-nvim",
    config = function()
        require('lspkind').init({
            symbol_map = {
                Copilot = "",
            },
        })
    end
}
