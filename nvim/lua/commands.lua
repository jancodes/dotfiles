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
m.nmap ("<leader>h", ":wincmd h<CR>")
m.nmap ("<leader>j", ":wincmd j<CR>")
m.nmap ("<leader>k", ":wincmd k<CR>")
m.nmap ("<leader>l", ":wincmd l<CR>")
m.nmap ("<leader>cw", ":wincmd w<CR>")

m.cnoremap ( "<C-p>", "<Up>")
m.cnoremap ( "<C-n>", "<Down>")

-- buffers
m.nmap("[b", ":bprevious<CR>", "silent")
m.nmap("]b", ":bnext<CR>", "silent")
m.nmap("[B", ":bfirst<CR>", "silent")
m.nmap("]B", ":blast<CR>", "silent")

m.nmap ( "<leader>ut", ":UndotreeShow<CR>")

-- telescope mappings
m.nmap ("<C-f>", "<cmd>Telescope find_files<cr>")

m.nmap ("<C-g>", "<cmd>Telescope live_grep<cr>")

m.nmap ("<C-b>", "<cmd>Telescope buffers<cr>")

-- Cheatsheet
m.nmap ("<leader>cs", ":Cheatsheet<CR>")

-- insert line without taking formatting from current line
m.nnoremap("<Leader>o", "o<Esc>^Da")
m.nnoremap("<Leader>O", "OEsc>^Da")
