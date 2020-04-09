setlocal textwidth=0
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

let g:sql_type_default = 'pgsql'

let b:ale_fixers = {
\   'sql': ['pgformatter'],
\}

let b:ale_sql_pgformatter_options = '-s 2'

let b:ale_fix_on_save = 1

setlocal syntax=pgsql
setlocal commentstring=--\ %s

if filereadable(".git/safe/../../.dbname")
  nnoremap <buffer> <leader>x :!clear; psql -d (cat .dbname) < '%'<cr>
else
  nnoremap <buffer> <leader>x :echo "Can't find .git/safe/../../.dbname"<cr>
endif
