function! g:Include(file)
  if filereadable(expand(a:file))
    execute 'source' a:file
  endif
endfunction

" Stolen wholesale from gfontenot, who stole it wholesale from gabebw, who stole
" it wholesale from christoomey, whose dotfiles you really should check out:
" https://github.com/christoomey/dotfiles
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.config/nvim/' . a:directory . '/*.vim'
  for config_file in split(glob(directory_splat), '\n')
    call Include(config_file)
  endfor
endfunction

call plug#begin('~/.config/nvim/plugged')
call s:SourceConfigFilesIn('plugins')
call plug#end()

call s:SourceConfigFilesIn('config')

set mouse=

set ignorecase
set smartcase

syntax on

set spell spellcapcheck=

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-p> :FZF<CR>

nnoremap K :Ag! "\b<C-R>=expand("<cword>")<CR>\b"<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set scrolloff=2 " keep some context above and below after a jump
set hlsearch " highlight search results
set incsearch " highlight search results while typing

" disable search highlight on enter
:nnoremap <CR> :nohlsearch<cr><cr>

runtime! macros/matchit.vim

" Semantically execute files
nnoremap <leader>x :echo "Don't know how to execute ." . expand("%:e")<cr>

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

  " start searching from your project root instead of the cwd
  let g:ag_working_path_mode="r"
endif

function! RunTerminalCommandInTab(command)
  -tabnew
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

function! NeovimTabStrategy(cmd)
  call RunTerminalCommandInTab(a:cmd)
endfunction

let g:test#custom_strategies = {'neovim-tab': function('NeovimTabStrategy')}
let g:test#strategy = 'neovim-tab'

colorscheme default

let g:jsx_ext_required = 0
