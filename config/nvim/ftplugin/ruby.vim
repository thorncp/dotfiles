setlocal textwidth=80
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

nnoremap <buffer> <leader>x
      \ :call RunTerminalCommandInTab("ruby " . expand("%"))<cr>
