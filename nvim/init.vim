" Get onedark theme for iterm2
" Escape+ options key in iterm for mac
" Change OS key repeat

" vim-polyglot has vim-jsx-pretty
let g:polyglot_disabled = ['jsx']

call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
" onedark uses vim-polygot
Plug 'mhinz/vim-signify'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-eunuch'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
" powerline statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" quickfix-reflector adds allows you to make files modifiable in the results
" list - you can also remove files lines from the result before VG
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/rainbow_parentheses.vim'
" This is for Coc extensions, but coc has bad proxy support
Plug 'dsznajder/vscode-es7-javascript-react-snippets'
Plug 'rhysd/conflict-marker.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'camspiers/lens.vim'
Plug 'tpope/vim-obsession'
" lsp plugins
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
" completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" other lsp stuff
Plug 'nvim-lua/plenary.nvim'
" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" THIS MUST BE LAST PLUGIN
Plug 'ryanoasis/vim-devicons'

call plug#end()

lua require("lua-config")

let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_highlight_close_tag = 1

" jsconfig.json needed for js files to work with tsserver - use global
" .gitignore
" vscode snippet extensions - remove main field in package.json

"onedark theme
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark

" airline status bar config
"let g:airline_theme='dark_minimal'
let g:airline_section_b = ""
let g:airline_section_c = '%f%m'
let g:airline_section_z = airline#section#create(['maxlinenr'])  

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" airline tabline at top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse=0
let g:airline#extensions#tabline#fnametruncate=0

let mapleader = " "

"signify config
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" Jump though hunks
nmap ]g <plug>(signify-next-hunk)
nmap [g <plug>(signify-prev-hunk)

" no highlight
nmap <leader>nh :noh<CR>

" close panel hotkey
nmap <leader>wq <C-w>q

"remaps paste to delete then paste first
xnoremap <silent> p p:let @+=@0<CR>:let @"=@0<CR>

" vim sneak
" use cl (change letter) and cc (change line) instead
" overwritten by sneak

" this allows you to press s again to search next (if you don't move cursor)
let g:sneak#use_ic_scs = 1
let g:sneak#s_next = 1

let g:sneak#prompt = '🕵'
let g:sneak#prompt = '🔎'

highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

map s <Plug>Sneak_s
map S <Plug>Sneak_S

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

map J <Nop>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

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
