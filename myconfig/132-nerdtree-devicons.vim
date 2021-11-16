UsePlugin 'vim-devicons'
UsePlugin 'nerdtree'

" let g:webdevicons_enable = 0
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

