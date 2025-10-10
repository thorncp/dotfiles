setlocal textwidth=0
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2
setlocal nospell

let g:sql_type_default = 'pgsql'

let b:ale_fixers = {
\   'sql': ['pgformatter'],
\}

" let b:ale_sql_pgformatter_options = '--function-case 1 --keyword-case 2 --no-extra-line --spaces 2 --wrap-limit 100'

let b:ale_fix_on_save = 0

setlocal syntax=pgsql
setlocal commentstring=--\ %s

if filereadable(".git/safe/../../bin/db")
  nnoremap <buffer> <leader>x :!clear; bin/db < '%'<cr>
else
  nnoremap <buffer> <leader>x :echo "Can't find .git/safe/../../bin/db"<cr>
endif

if filereadable(".git/safe/../../bin/dbr")
  nnoremap <buffer> <leader>X :!clear; bin/dbr < '%'<cr>
else
  nnoremap <buffer> <leader>X :echo "Can't find .git/safe/../../bin/dbr"<cr>
endif
