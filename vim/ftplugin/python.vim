setlocal autoindent
setlocal expandtab
setlocal fileformat=unix
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal textwidth=79

let test#python#djangotest#executable = 'pipenv run python manage.py test'

let g:splitjoin_trailing_comma = 1

setlocal formatoptions+=r
