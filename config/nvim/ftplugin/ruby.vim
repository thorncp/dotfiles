setlocal textwidth=80

nnoremap <buffer> <leader>x
      \ :call RunTerminalCommandInTab("ruby " . expand("%"))<cr>
