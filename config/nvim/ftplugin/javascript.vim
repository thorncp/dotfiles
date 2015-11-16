setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal textwidth=80

nnoremap <buffer> <leader>x
      \ :call RunTerminalCommandInTab("node " . expand("%"))<cr>
