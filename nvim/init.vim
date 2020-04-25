" Font: Fira Nerd Complete Medium
" Get onedark theme for iterm2
" Escape+ options key in iterm for mac

call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
" onedark uses vim-polygot
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug '907th/vim-auto-save'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" powerline statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" quickfix-reflector adds allows you to make files modifiable in the results
" list - you can also remove files lines from the result before VG
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/rainbow_parentheses.vim'
" This is for Coc extensions, but coc has bad proxy support
Plug 'dsznajder/vscode-es7-javascript-react-snippets'
Plug 'rhysd/conflict-marker.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
": THIS MUST BE LAST PLUGIN
Plug 'ryanoasis/vim-devicons'

call plug#end()

" jsconfig.json needed for js files to work with tsserver - use global
" .gitignore
" vscode snippet extensions - remove main field in package.json
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-css',
      \]

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

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
let g:airline#extensions#coc#enabled = 1
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

" auto save config
let g:auto_save = 0
let g:auto_save_events = ["InsertLeave", "CursorHold"]

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif
let g:NERDTreeWinPos = "left"
nmap <leader>kb :NERDTreeToggle<CR> 
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeQuitOnOpen = 1
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" s opens verictal panel in nerdtree
" t opens the file in new tab in nerdtree

" no highlight
nmap <leader>nh :noh<CR>

" close panel hotkey
nmap <leader>wq <C-w>q

" easymotion mappings
"let g:EasyMotion_do_mapping = 1
"" Move to line
"map <Leader>el <Plug>(easymotion-bd-jk)
"nmap <Leader>el <Plug>(easymotion-overwin-line)
"" Move to word
"map  <Leader>ew <Plug>(easymotion-bd-w)
"nmap <Leader>ew <Plug>(easymotion-overwin-w)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

" Formatting selected code.
xmap <leader>fc <Plug>(coc-format-selected)
nmap <leader>fc <Plug>(coc-format-selected)

" vim sneak
map s <Plug>Sneak_s
map S <Plug>Sneak_S

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

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

nmap <leader>ut :UndotreeShow<CR>

" fzf mappings
let $FZF_DEFAULT_COMMAND='rg --files --smart-case'
nmap <C-f> :Files<CR>

nmap <C-g> :Rg

nmap <C-l> :Lines<CR>

" fzf notes for editing fzf results
" alt+a to select all, alt+d to deselect
" tab to select one at a time
" pressggENTER to transfer to quickfix
" in quickfix mode, you can select the files and do :%s/oldterm/newterm/g

" Snippets hotkey - not needed to do coc autocomplete
"let g:UltiSnipsExpandTrigger="<C-l>"

" RainbowParentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
nmap <leader>rp :RainbowParentheses!!<CR>

" vim settings
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set backspace=indent,eol,start
set number
set clipboard+=unnamedplus " use system clipboard

"  disable vim macros
map q <Nop>

" veritical split open files
let g:netrw_browse_split=2
" hides dir  banner
let g:netrw_banner = 0
" Set the width of the directory explorer
let g:netrw_winsize = 50

" split config
set splitbelow
set splitright

" coc settings 
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

let g:coc_node_path = "/usr/local/bin/node"
