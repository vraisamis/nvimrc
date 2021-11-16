UsePlugin 'gina.vim'

augroup gina-status-lazy
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:f_gina_status('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:f_gina_status('CursorHold')
  autocmd WinEnter * call s:f_gina_status('WinEnter')
  autocmd WinLeave * call s:f_gina_status('WinLeave')

  let s:gina_status = 0
  let g:gina_status_str = gina#component#repo#preset()
  function! s:f_gina_status(event)
    if a:event ==# 'WinEnter'
      let g:gina_status_str = gina#component#repo#preset()
      let s:gina_status = 2
    elseif a:event ==# 'WinLeave'
      " Do nothing
    elseif a:event ==# 'CursorMoved'
      if s:gina_status
        if 1 < s:gina_status
          let s:gina_status = 1
        else
          " Do nothing
          let s:gina_status = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      let g:gina_status_str = gina#component#repo#preset()
      let s:gina_status = 1
    endif
  endfunction
augroup END
