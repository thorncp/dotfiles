setlocal tabstop=4

nnoremap <buffer> <leader>x :!clear; go run '%'<cr>

setlocal list listchars=tab:\ \ ,trail:·,nbsp:·

let g:go_fmt_command = "goimports"
