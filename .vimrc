" Disable Vi compatibility. From the docs:
" > you should probably put it at the very start.
set nocompatible

" Don't highlight matching parenthesis
let loaded_matchparen = 1

" Set this early so any bindings defined will use it
let mapleader = " "

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'aklt/plantuml-syntax'
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'dense-analysis/ale'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'exu/pgsql.vim', { 'for': 'sql' }
Plug 'farmergreg/vim-lastplace'
Plug 'github/copilot.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'nicholaides/words-to-avoid.vim'
Plug 'othree/html5.vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'psliwka/vim-dirtytalk', { 'do': ':DirtytalkUpdate' }
Plug 'rhysd/conflict-marker.vim'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'vim-utils/vim-troll-stopper'

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

set background=light

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

" When spell checking, support programming terms
set spelllang=en,programming

" Open new split panes to right and bottom, which feels more natural
set splitbelow splitright

" Make it obvious where 80 characters is
set textwidth=80 colorcolumn=+1

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
nnoremap <LEADER>x :echo "Don't know how to execute " . &filetype . " files"<CR>

" Set up semantic debugging. Inserts a line with the language's debugging
" mechanism. File types can set their commands in vim/ftplugin/*.vim
nnoremap <LEADER>d :echo "Don't know how to debug " . &filetype . " files"<CR>

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

" Let CoC handle LSP things
let g:ale_disable_lsp = 1

nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Don't style ALE markup. The async nature of ALE means sometimes it finishes
" while a :! command is currently executing, which turns the entire background
" yellow. This doesn't actually solve the problem, but will leave the background
" the default color
highlight clear ALEErrorSign
highlight clear ALEWarningSign

highlight SpellBad term=bold ctermbg=darkred
highlight SpellCap term=bold ctermbg=darkblue

let g:ale_echo_msg_format = '[%linter%] %s - %...code...% [%severity%]'

" Rebuild spell file when entries are added externally
for d in glob('~/.vim/spell/*.add', 1, 1)
  if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
    silent exec 'mkspell! ' . fnameescape(d)
  endif
endfor

if filereadable(".git/safe/../../.vimrc.local")
  source .git/safe/../../.vimrc.local
endif

" CoC things

set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=number
