setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal textwidth=80

setlocal syntax=pgsql
setlocal commentstring=--\ %s

nnoremap <buffer> <leader>x
      \ :call RunTerminalCommandInTab("rails db < " . expand("%"))<cr>
