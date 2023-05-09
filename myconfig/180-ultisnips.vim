UsePlugin 'vim-pythonx'
UsePlugin 'ultisnips'

let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'local_snippets']
let g:UltiSnipsSnippetsDir = expand(g:vimrc_dir . "/UltiSnips")
let g:UltiSnipEditSplit = "tabdo"

command! -nargs=0 UltiSnipsReload :call UltiSnips#RefreshSnippets()
