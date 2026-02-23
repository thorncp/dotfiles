setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2
setlocal textwidth=100
setlocal spell

nnoremap <buffer> <leader>d Obinding.pry<esc>

function! ExecRuby(path)
  " Opt-in to using rails runner, which often has spring setup, for faster runs
  if getline(1) == "# rails runner"
    exec ":!clear; rails runner " . a:path
  " else if a Gemfile is present, use bundle exec
  elseif filereadable("Gemfile")
    exec ":!clear; asdf exec bundle exec ruby " . a:path
  else
    exec ":!clear; asdf exec ruby " . a:path
  endif
endfunction

nnoremap <buffer> <leader>x :call ExecRuby('%')<cr>

setlocal re=1

let test#ruby#rspec#options = {
  \ 'nearest': '--format documentation',
  \ 'file':    '--format documentation',
\}

let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_trailing_comma = 0
let g:splitjoin_ruby_options_as_arguments = 1
