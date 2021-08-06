syntax on
setlocal nojoinspaces
setlocal spell
setlocal textwidth=72

syn match gitcommitComment  "^;.*"

autocmd FileType <buffer> call MatchTechWordsToAvoid()
autocmd BufWinEnter <buffer> call MatchTechWordsToAvoid()
autocmd InsertEnter <buffer> call MatchTechWordsToAvoid()
autocmd InsertLeave <buffer> call MatchTechWordsToAvoid()
autocmd BufWinLeave <buffer> call clearmatches()
