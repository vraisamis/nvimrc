UsePlugin 'coc.nvim'
UsePlugin 'lightline.vim'

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" TODO: mac以外対応
let s:error_sign = get(g:, 'coc_status_error_sign', has('mac') ? '❌ ' : 'E')
let s:warning_sign = get(g:, 'coc_status_warning_sign', has('mac') ? '⚠️ ' : 'W')
let s:info_sign = get(g:, 'coc_status_info_sign', has('mac') ? ' ' : 'W')
function! MyCocDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, s:error_sign . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, s:warning_sign . info['warning'])
  endif
  let hints = get(info, 'hint', 0) + get(info, 'information', 0)
  if hints
    call add(msgs, s:info_sign . hints)
  endif
  return join(msgs, ' ')
endfunction

function! MyCocStatus() abort
  return get(g:, 'coc_status', '')
endfunction


let g:lightline = get(g:, 'lightline', {})

" component_expand
let s:ll_cf = get(g:lightline, 'component_function', {})
let s:ll_cf['cocdiagnostic'] = 'MyCocDiagnostic'
let s:ll_cf['cocstatus'] = 'MyCocStatus'
let s:ll_cf['coc_currentfunction'] = 'CocCurrentFunction'

let g:lightline['component_function'] = s:ll_cf

" active"
let s:active = get(g:lightline, 'active', {})
let s:active_left = get(s:active, 'left', [[], [], []])
let s:active_left_2 = get(s:active_left, 2, [])

call add(s:active_left_2, 'cocdiagnostic')
call add(s:active_left_2, 'coc_currentfunction')
call add(s:active_left_2, 'cocstatus')

" let s:active_left[2] = s:active_left_2
let s:active['left'] = [
      \ get(s:active_left, 0, []),
      \ get(s:active_left, 1, []),
      \ s:active_left_2 ]
let g:lightline['active'] = s:active
