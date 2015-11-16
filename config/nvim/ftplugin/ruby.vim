setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal textwidth=80

nnoremap <buffer> <leader>x
      \ :call RunTerminalCommandInTab("ruby " . expand("%"))<cr>

nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
" don't forget bundle exec
let g:rspec_command = 
      \ 'call RunTerminalCommandInTab("rspec --format documentation {spec}")'
