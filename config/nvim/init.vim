call plug#begin('~/.config/nvim/plugged')

Plug 'benekastah/neomake'
Plug 'cespare/vim-toml'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'exu/pgsql.vim'
Plug 'janko-m/vim-test'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/ctags.vim'
Plug 'vim-scripts/forth.vim'
Plug 'vim-scripts/haskell.vim'
Plug 'wting/rust.vim'

call plug#end()

set relativenumber
set number
set numberwidth=5
set nobackup
set nowritebackup
set noswapfile
set ruler

set ignorecase
set smartcase

" set cursorline only for the current buffer
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

syntax on

" Better grammatical error styling
highlight SpellBad ctermbg=NONE cterm=underline
highlight SpellRare ctermbg=NONE cterm=underline
highlight SpellCap ctermbg=NONE cterm=underline

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set scrolloff=2 " keep some context above and below after a jump
set noesckeys " remove delay when using ctrl + [
set hlsearch " highlight search results
set incsearch " highlight search results while typing

" disable search highlight on enter
:nnoremap <CR> :nohlsearch<cr><cr>

runtime! macros/matchit.vim

" Semantically execute files
nnoremap <leader>x :echo "Don't know how to execute ." . expand("%:e")<cr>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

autocmd! BufWritePost * Neomake

" set up undo file in home directory
if isdirectory($HOME . '/.config/nvim/undo') == 0
  :silent !mkdir -p ~/.config/nvim/undo > /dev/null 2>&1
endif
set undofile
set undodir=~/.config/nvim/undo/

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  let g:ctrlp_max_height = 25

  " keeps working dir the same as when vim launched.
  " changing dirs from underneath me is confusing as hell.
  let g:ctrlp_working_path_mode = 0

  " start searching from your project root instead of the cwd
  let g:ag_working_path_mode="r"
endif

function! RunTerminalCommandInTab(command)
  tabnew
  execute 'terminal' a:command
endfunction

augroup AutoSwap
  autocmd!
  autocmd SwapExists *  call AS_HandleSwapfile(expand('<afile>:p'), v:swapname)
augroup END

function! AS_HandleSwapfile (filename, swapname)
  " if swapfile is older than file itself, just get rid of it
  if getftime(v:swapname) < getftime(a:filename)
    call delete(v:swapname)
    let v:swapchoice = 'e'
  endif
endfunction
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
      \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

augroup checktime
  au!
  if !has("gui_running")
    "silent! necessary otherwise throws errors when using command
    "line window.
    autocmd BufEnter,CursorHold,CursorHoldI,CursorMoved,CursorMovedI,FocusGained,BufEnter,FocusLost,WinLeave * checktime
  endif
augroup END

nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>

let test#strategy = "neovim"
