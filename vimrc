if &compatible
  set nocompatible
end

filetype off

call plug#begin('~/.vim/plugged')

Plug 'cespare/vim-toml'
Plug 'chankaward/vim-railscasts-theme'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'exu/pgsql.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim'
Plug 'slim-template/vim-slim'
Plug 'thoughtbot/vim-rspec'
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
Plug 'wting/rust.vim'

call plug#end()

filetype on

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set foldmethod=indent " Fold based on syntax definitions
set foldlevelstart=99 " Don't fold anything in new buffers
set mouse=n " allow mouse in normal mode

" set cursorline only for the current buffer
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

colorscheme railscasts

" Better grammatical error styling
highlight SpellBad ctermbg=NONE cterm=underline
highlight SpellRare ctermbg=NONE cterm=underline
highlight SpellCap ctermbg=NONE cterm=underline

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " more stuff
  let g:ctrlp_max_height = 25

  " keeps working dir the same as when vim launched.
  " changing dirs from underneath me is confusing as hell.
  let g:ctrlp_working_path_mode = 0
endif

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set relativenumber
set number
set numberwidth=5

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R --exclude=.git --exclude=node_modules --exclude=bower_components --exclude=tmp .<CR>

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
let g:rspec_command = 'execute "enew" | execute "call termopen(\"bundle exec rspec --format documentation {spec}\")"'

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Spell check ALL THE THINGS
set spell

" Always use vertical diffs
set diffopt+=vertical

set scrolloff=2 " keep some context above and below after a jump
set noesckeys " remove delay when using ctrl + [
set hlsearch " highlight search results
set incsearch " highlight search results while typing

" disable search highlight on enter
:nnoremap <CR> :nohlsearch<cr>

" I have never executed this on purpose. perhaps I should learn about it
nnoremap Q <nop>

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Semantically execute files
nnoremap <leader>x :echo "Don't know how to execute ." . expand("%:e")<cr>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
