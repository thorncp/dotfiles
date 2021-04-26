setlocal textwidth=0
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

let g:sql_type_default = 'pgsql'

let b:ale_fixers = {
\   'sql': ['pgformatter'],
\}

let b:ale_sql_pgformatter_options = '--function-case 1 --keyword-case 2 --no-extra-line --spaces 2 --wrap-limit 100'

let b:ale_fix_on_save = 1

setlocal syntax=pgsql
setlocal commentstring=--\ %s

if filereadable(".git/safe/../../.dblocal")
  nnoremap <buffer> <leader>x :!clear; ./.dblocal < '%'<cr>
else
  nnoremap <buffer> <leader>x :echo "Can't find .git/safe/../../.dblocal"<cr>
endif

if filereadable(".git/safe/../../.dbremote")
  nnoremap <buffer> <leader>X :!clear; ./.dbremote < '%'<cr>
else
  nnoremap <buffer> <leader>X :echo "Can't find .git/safe/../../.dbremote"<cr>
endif
