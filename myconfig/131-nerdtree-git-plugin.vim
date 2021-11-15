UsePlugin 'nerdtree'
UsePlugin 'nerdtree-git-plugin'

let g:NERDTreeGitStatusUseNerdFonts = 1
" let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeGitStatusShowClean = 1

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "",
    \ "Staged"    : "",
    \ "Untracked" : "",
    \ "Renamed"   : "",
    \ "Unmerged"  : "",
    \ "Deleted"   : "",
    \ "Dirty"     : "",
    \ "Clean"     : "　",
    \ 'Ignored'   : "",
    \ "Unknown"   : ""
    \ }
