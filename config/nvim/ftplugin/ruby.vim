setlocal textwidth=80
set tabstop=2

nnoremap <buffer> <leader>x
      \ :call RunTerminalCommandInTab("ruby " . expand("%"))<cr>
