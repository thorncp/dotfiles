setlocal textwidth=80
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

let g:sql_type_default = 'pgsql'

setlocal syntax=pgsql
setlocal commentstring=--\ %s
setlocal spellcapcheck=

nnoremap <buffer> <leader>x :!clear; psql -d (cat .dbname) < '%'<cr>
