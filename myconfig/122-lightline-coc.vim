UsePlugin 'coc.nvim'
UsePlugin 'lightline.vim'

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction


let g:lightline = get(g:, 'lightline', {})

" component_expand
let s:ll_cf = get(g:lightline, 'component_function', {})
let s:ll_cf['cocstatus'] = 'coc#status'
let s:ll_cf['coc_currentfunction'] = 'CocCurrentFunction'

let g:lightline['component_function'] = s:ll_cf

" active"
let s:active = get(g:lightline, 'active', {})
let s:active_left = get(s:active, 'left', [[], [], []])
let s:active_left_2 = get(s:active_left, 2, [])

call add(s:active_left_2, 'cocstatus')
call add(s:active_left_2, 'coc_currentfunction')

" let s:active_left[2] = s:active_left_2
let s:active['left'] = [
      \ get(s:active_left, 0, []),
      \ get(s:active_left, 1, []),
      \ s:active_left_2 ]
let g:lightline['active'] = s:active
