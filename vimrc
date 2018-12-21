" Disable Vi compatibility. From the docs:
" > you should probably put it at the very start.
set nocompatible

" Don't highlight matching parenthesis
let loaded_matchparen = 1

" Set this early so any bindings defined will use it
let mapleader = " "

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'ElmCast/elm-vim'
Plug 'cespare/vim-toml'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dag/vim-fish'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'exu/pgsql.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'fatih/vim-go'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'matze/vim-lilypond'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mxw/vim-jsx'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'nicholaides/words-to-avoid.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/ctags.vim'
Plug 'vim-scripts/haskell.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'w0rp/ale'
Plug 'wting/rust.vim'

call plug#end()

" Enable syntax highlighting
syntax on

" Detect file types
filetype plugin indent on

" Use the default color scheme to avoid maintaining one
colorscheme default

" Automatically read files modified outside of Vim
set autoread

" Automatically save files before many actions
set autowrite

" Allow backspacing through indentation, eol, and through previous insertions
set backspace=2

" Highlight search results, while the pattern is being typed
set hlsearch incsearch

" Searches are case insensitive by default. If the search pattern includes a
" capital letter, it becomes case sensitive
set ignorecase smartcase

" Always show the status line
set laststatus=2

" Tabs and trailing whitespace are visible
set list listchars=tab:»\ ,trail:·,nbsp:·

" Disable the mouse entirely
set mouse=

" Don't make a file backup when overwriting a file
set nobackup nowritebackup

" Remove delay when using <C-[>
set noesckeys

" http://www.techrepublic.com/blog/it-security/turn-off-modeline-support-in-vim/
set nomodeline modelines=0

" Don't keep a swap file. Previous file versions can be recovered from Git. If
" the file isn't tracked by Git, it's either not important or I will be sad.
set noswapfile

" Give the number gutter plenty of room so the width is consistent when crossing
" numbers with more digits, e.g. 99->100, 999->1000
set numberwidth=5

" `relativenumber` followed by `number` will show the absolute number at the
" cursor location's line, and relative numbers for all other lines
set relativenumber number

" Show line and column number of cursor position
set ruler

" Start scrolling when the cursor is 2 lines from the bottom/top of screen.
" Think of it like context in Grep or Ag.
set scrolloff=2

" Enable spell checking
set spell

" Open new split panes to right and bottom, which feels more natural
set splitbelow splitright

" Make it obvious where 80 characters is
set textwidth=80 colorcolumn=+1

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Quicker window movement
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" Map ctrl+p to FZF because muscle memory is hard to break
nnoremap <C-P> :FZF<CR>

" Disable search highlight on return and perform default behavior
nnoremap <CR> :nohlsearch<CR><CR>

" Set up semantic execution of files. Prints a message by default. File types
" can set their commands in vim/ftplugin/*.vim
nnoremap <LEADER>x :echo "Don't know how to execute ." . expand("%:e")<CR>

" Mappings for vim-test
nnoremap <LEADER>t :TestNearest<CR>
nnoremap <LEADER>T :TestFile<CR>
nnoremap <LEADER>a :TestSuite<CR>
nnoremap <LEADER>l :TestLast<CR>
nnoremap <LEADER>g :TestVisit<CR>

" Quickly search for the word under the cursor
nnoremap <LEADER>k :Ag <C-R><C-W><CR>

" Extended matching with "%"
runtime! macros/matchit.vim

" Highlight the current line, only for the buffer with focus
augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" Automatically rebalance windows on Vim resize
autocmd VimResized * :wincmd =

" Set up undo file in home directory
if isdirectory($HOME . '/.vim/undo') == 0
  :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
endif
set undofile undodir=~/.vim/undo/

" Enable JSX syntax for .js files
let g:jsx_ext_required = 0

" When the type of shell script is /bin/sh, assume a POSIX-compatible shell for
" syntax highlighting purposes.
let g:is_posix = 1

" Change cursor to vertical line in insert and replace modes
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Use ag with ack.vim
let g:ackprg = 'ag --vimgrep'

" Increase delay before ALE runs linters
" let g:ale_lint_delay = 500

" ALE linting events
" set updatetime=1000
" let g:ale_lint_on_text_changed = 0
" autocmd CursorHold * call ale#Lint()
" autocmd CursorHoldI * call ale#Lint()
" autocmd InsertEnter * call ale#Lint()
" autocmd InsertLeave * call ale#Lint()

nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Don't style ALE markup. The async nature of ALE means sometimes it finishes
" while a :! command is current executing, which turns the entire background
" yellow. This doesn't actually solve the problem, but will leave the background
" the default color
highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
\   'ruby': ['ruby', 'rubocop'],
\}

let g:elm_format_autosave = 1
