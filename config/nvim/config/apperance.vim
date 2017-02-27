" `relativenumber` followed by `number` will show the absolute number at the
" cursor location's line, and relative numbers for all other lines
set relativenumber
set number

" Give the number gutter plenty of room so the width is consistent when crossing
" numbers with more digits, e.g. 99->100, 999->1000
set numberwidth=5

" Don't make a file backup when overwriting a file
set nobackup
set nowritebackup

" Don't keep a swap file. Previous file versions can be recovered from Git. If
" the file isn't tracked by Git, it's either not important or I will be sad.
set noswapfile

" Show line and column number of cursor position
set ruler

" Tabs and trailing whitespace are visible
set list listchars=tab:»\ ,trail:·,nbsp:·

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Start scrolling when the cursor is 2 lines from the bottom/top of screen.
" Think of it like context in Grep or Ag.
set scrolloff=2

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Highlight the current line, only for the buffer with focus
augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END
