setlocal textwidth=80
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

nnoremap <buffer> <leader>x :!clear; ruby %<cr>

setlocal re=1

let test#ruby#rspec#options = {
  \ 'nearest': '--format documentation',
  \ 'file':    '--format documentation',
\}
