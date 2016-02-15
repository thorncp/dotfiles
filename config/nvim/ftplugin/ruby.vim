setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal textwidth=80

nnoremap <buffer> <leader>x
      \ :call RunTerminalCommandInTab("ruby " . expand("%"))<cr>

let g:neomake_ruby_enabled_makers = ['mri']
