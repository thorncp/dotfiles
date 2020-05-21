setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2
setlocal textwidth=80

nnoremap <buffer> <leader>d Obinding.pry<esc>

" Opt-in to using rails runner, which often has spring setup, for faster runs
if getline(1) == "# rails runner"
  nnoremap <buffer> <leader>x :!clear; rails runner '%'<cr>
else
  nnoremap <buffer> <leader>x :!clear; ruby '%'<cr>
endif

setlocal re=1

let test#ruby#rspec#options = {
  \ 'nearest': '--format documentation',
  \ 'file':    '--format documentation',
\}

let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_trailing_comma = 1
let g:splitjoin_ruby_options_as_arguments = 1
