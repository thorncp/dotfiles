setlocal textwidth=80

let g:sql_type_default = 'pgsql'

setlocal syntax=pgsql
setlocal commentstring=--\ %s

nnoremap <buffer> <leader>x
      \ :call RunTerminalCommandInTab("rails db < " . expand("%"))<cr>
