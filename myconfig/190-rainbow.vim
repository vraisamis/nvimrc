UsePlugin 'rainbow'

let g:rainbow_active = 1


" SEE: https://github.com/ryanoasis/vim-devicons/issues/327
" NERDTreeにdeviconsで表示したのと衝突する
let g:rainbow_conf = get(g:, 'rainbow_conf', {})
let s:separately = get(g:rainbow_conf, 'separately', {})

let s:separately['nerdtree'] = 0
let g:rainbow_conf['separately'] = s:separately
