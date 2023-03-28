local m = require("mapx")


-- save on enter in normal mode
m.nmap("<CR>", "(&buftype is# '' ? ':w<CR>' : '<CR>')", "expr")

-- no highlight
m.nmap("<leader>nh", ":noh<CR>")

-- close panel hotkey
m.nmap("<leader>wq", "<C-w>q" )

-- remaps paste to delete then paste first
m.xnoremap ("p", 'p:let @+=@0<CR>:let @"=@0<CR>', "silent")

-- remove J mapping
m.map("J","<Nop>")

-- buffers
m.nmap("[b", ":bprevious<CR>", "silent")
m.nmap("]b", ":bnext<CR>", "silent")
m.nmap("[B", ":bfirst<CR>", "silent")
m.nmap("]B", ":blast<CR>", "silent")

m.nmap ( "<leader>ut", ":UndotreeShow<CR>")

-- telescope mappings
m.nmap ("<C-f>", "<cmd>Telescope find_files<cr>")

m.nmap ("<C-g>", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_raw()<cr>")

m.nmap ("<C-b>", "<cmd>Telescope buffers<cr>")

-- Cheatsheet
m.nmap ("<leader>cs", ":Cheatsheet<CR>")

-- insert line without taking formatting from current line
m.nnoremap("<Leader>o", "o<Esc>^Da")
m.nnoremap("<Leader>O", "O<Esc>^Da")

-- Fugitive
m.nmap("<leader>gs", ":G<CR>")
-- dd to resolve conflict on file in gs
m.nmap("<leader>gh", ":diffget //3<CR>")
m.nmap("<leader>gu", ":diffget //2<CR>")

-- Node run file
m.nmap ("<leader>sr", ":!node %<CR>")

-- Jest
m.nmap("<leader>tf", ":JestFile<CR>", "silent")
m.nmap("<leader>ts", ":JestSingle<CR>", "silent")
m.nmap("<leader>ts", ":JestSingle<CR>", "silent")

-- persisted nvim
m.nmap("<leader>st", ":SessionToggle<cr>")

-- spectre
m.nnoremap("<leader>S", "<cmd>lua require('spectre').open()<CR>")

-- disable q:
m.map("q:", "<Nop>")
m.map("Q", "<Nop>")

-- Touch file & Mkdir folder 
vim.api.nvim_create_user_command('Touch', function(opts)
    local fileName = string.format('%s', opts.args)
    vim.api.nvim_command(':e %/'..fileName)
end, { nargs = 1 })

vim.api.nvim_create_user_command('Mkdir', function(opts)
    local folder = string.format('%s', opts.args)
    vim.api.nvim_command('!mkdir %/'..folder)
end, { nargs = 1 })

-- Format file using built in lsp
vim.api.nvim_create_user_command('Format', function()
    vim.api.nvim_command(':lua vim.lsp.buf.format { async = true }')
end, { nargs = 0 })


local keymap = vim.keymap.set

keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>")
keymap({"n","v"}, "<leader>ga", "<cmd>Lspsaga code_action<CR>")
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
keymap("n", "grp", "<cmd>Lspsaga rename ++project<CR>")
-- <C-t> to go back to previous
keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")

keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

keymap("n", "[g", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]g", "<cmd>Lspsaga diagnostic_jump_next<CR>")
-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[G", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]G", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")

keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
