setlocal textwidth=80

setlocal syntax=pgsql
setlocal commentstring=--\ %s

nnoremap <buffer> <leader>x
      \ :call RunTerminalCommandInTab("rails db < " . expand("%"))<cr>
