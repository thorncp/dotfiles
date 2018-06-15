setlocal textwidth=80
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

nnoremap <buffer> <leader>x :!clear; ruby '%'<cr>

setlocal re=1

let ruby_spellcheck_strings=1

let test#ruby#rspec#options = {
  \ 'nearest': '--format documentation',
  \ 'file':    '--format documentation',
\}

let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_trailing_comma = 1
