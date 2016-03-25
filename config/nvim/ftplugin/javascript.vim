setlocal textwidth=80

nnoremap <buffer> <leader>x
      \ :call RunTerminalCommandInTab("node " . expand("%"))<cr>
