setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

nnoremap <buffer> <leader>x :!clear; Rscript --slave --vanilla '%'<cr>
