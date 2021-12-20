" Get onedark theme for iterm2
" Escape+ options key in iterm for mac
" Change OS key repeat
" WSL2 init setup - https://jade.fyi/blog/development-in-wsl/

lua require("plugins")
lua require("lsp")
lua require("commands")

let mapleader = " "

" no highlight
nmap <leader>nh :noh<CR>

" close panel hotkey
nmap <leader>wq <C-w>q

"remaps paste to delete then paste first
xnoremap <silent> p p:let @+=@0<CR>:let @"=@0<CR>

map J <Nop>

" navigation remapping leader + h same as ctrl w h
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader>cw :wincmd w<CR>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" buffers
nmap <silent> [b :bprevious<CR>
nmap <silent> ]b :bnext<CR>
nmap <silent> [B :bfirst<CR>
nmap <silent> ]B :blast<CR>

nmap <leader>ut :UndotreeShow<CR>

" telescope mappings
nmap <C-f> <cmd>Telescope find_files<cr>

nmap <C-g> <cmd>Telescope live_grep<cr>

nmap <C-b> <cmd>Telescope buffers<cr>

" Cheatsheet
nmap <leader>cs :Cheatsheet<CR>

" RainbowParentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
nmap <leader>rp :RainbowParentheses!!<CR>

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" vim settings
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set backspace=indent,eol,start
set clipboard=unnamedplus " use system clipboard
set history=200
" added for signify
set updatetime=300
au FocusGained,BufEnter * checktime

"line number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" split config
set splitbelow
set splitright
