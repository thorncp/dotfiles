setlocal textwidth=80
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

nnoremap <buffer> <leader>x :!clear; ruby %<cr>

setlocal re=1

" ruby path if you are using rbenv
let g:ruby_path = system('echo $HOME/.rbenv/shims')
