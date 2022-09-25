local m = require("mapx")

vim.g.mapleader = " "

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

-- navigation remapping leader + h same as ctrl w h
-- using focus.nvim instead now
-- m.nmap ("<leader>h", ":wincmd h<CR>")
-- m.nmap ("<leader>j", ":wincmd j<CR>")
-- m.nmap ("<leader>k", ":wincmd k<CR>")
-- m.nmap ("<leader>l", ":wincmd l<CR>")

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

-- jester
m.nmap("<leader>tn", "<cmd>lua require('jester').run({cmd = 'npm run test -- $file --coverage=False', path_to_jest = 'npm run test'})<cr>", "test nearest")
m.nmap("<leader>tf", "<cmd>lua require('jester').run_file({cmd = 'npm run test -- $file -t $result --coverage=False', path_to_jest = 'npm run test' })<cr>", "test file")

-- persisted nvim
m.nmap("<leader>st", ":SessionToggle<cr>")

-- spectre
m.nnoremap("<leader>S", "<cmd>lua require('spectre').open()<CR>")

-- disable q:
m.nnoremap("q:", "<Nop>")
m.nnoremap("Q", "<Nop>")

-- Touch file & Mkdir folder 
vim.api.nvim_create_user_command('touch', function(opts)
    local fileName = string.format('%s', opts.args)
    vim.api.nvim_command(':e %/'..fileName)
end, { nargs = 1 })

vim.api.nvim_create_user_command('mkdir', function(opts)
    local folder = string.format('%s', opts.args)
    vim.api.nvim_command('!mkdir %/'..folder)
end, { nargs = 1 })
