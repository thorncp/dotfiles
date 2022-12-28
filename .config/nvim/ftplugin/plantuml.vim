setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2
setlocal textwidth=100

nnoremap <buffer> <leader>x :silent :make<cr>:!open %:r.png<cr>:redraw!<cr>
