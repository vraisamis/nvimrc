UsePlugin 'tcomment_vim'

let g:tcomment_maps = v:false
" macでのみ効果あり
map  <silent> <C-/><C-/> <Plug>TComment_<c-_><c-_>
vmap <silent> <C-/><C-/> <Plug>TComment_<c-_><c-_>
imap <silent> <C-/><C-/> <Plug>TComment_<c-_><c-_>

" 他OS用（実態はCTRL-/）
map  <silent> <C-_><C-_> <Plug>TComment_<c-_><c-_>
vmap <silent> <C-_><C-_> <Plug>TComment_<c-_><c-_>
imap <silent> <C-_><C-_> <Plug>TComment_<c-_><c-_>
