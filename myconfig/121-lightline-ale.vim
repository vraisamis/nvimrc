UsePlugin 'ale'
UsePlugin 'lightline-ale'
UsePlugin 'lightline.vim'



let g:lightline = get(g:, 'lightline', {})

" component_expand
let s:ll_ce = get(g:lightline, 'component_expand', {})
let s:ll_ce['linter_checking'] = 'lightline#ale#checking'
let s:ll_ce['linter_warnings'] = 'lightline#ale#warnings'
let s:ll_ce['linter_errors'] = 'lightline#ale#errors'
let s:ll_ce['linter_ok'] = 'lightline#ale#ok'

let g:lightline['component_expand'] = s:ll_ce

" component_type
let s:ll_ct = get(g:lightline, 'component_type', {})
let s:ll_ct['linter_checking'] = 'left'
let s:ll_ct['linter_warnings'] = 'warning'
let s:ll_ct['linter_errors'] = 'error'
let s:ll_ct['linter_ok'] = 'left'

let g:lightline['component_type'] = s:ll_ct

" active"
let s:active = get(g:lightline, 'active', {})
let s:active_left = get(s:active, 'left', [[], [], []])
let s:active_left_2 = get(s:active_left, 2, [])

call add(s:active_left_2, 'linter_checking')
call add(s:active_left_2, 'linter_errors')
call add(s:active_left_2, 'linter_warnings')
call add(s:active_left_2, 'linter_ok')

let s:active_left[2] = s:active_left_2
let s:active['left'] = s:active_left
let g:lightline['active'] = s:active
