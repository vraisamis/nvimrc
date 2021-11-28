UsePlugin 'gina.vim'

" デフォルト実装
function! MyGinaRepoStatus() abort
  return gina#component#repo#preset()
endfunction

" リッチにする
function! MyGinaRepoStatus() abort
  let l:repo_name = gina#component#repo#name()
  if empty(l:repo_name)
    return ''
  endif

  let l:branch = gina#component#repo#branch()
  let l:track = gina#component#repo#track()

  if empty(l:track)
    let repo = printf('%s%s', l:repo_name, l:branch)
  else
    let l:ridx = strridx(l:track, l:branch)
    if ridx >= 0
      let l:track_remote = strpart(l:track, 0, l:ridx - 1)
    " リモートトラッキングブランチ名とlocalのブランチ名が一致していたら
    " <repo_name><remote_name><branch_name>
      let repo = printf('%s%s%s', l:repo_name, l:track_remote, l:branch)
    else
      let repo = printf('%s%s->%s', l:repo_name, l:branch, l:track)
    endif
  endif

  let status = gina#component#status#preset('fancy')
  let traffic = gina#component#traffic#preset('fancy')
  return join(filter([repo, status, traffic], '!empty(v:val)'))
endfunction

augroup gina-status-lazy
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:f_gina_status('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:f_gina_status('CursorHold')
  autocmd WinEnter * call s:f_gina_status('WinEnter')
  autocmd WinLeave * call s:f_gina_status('WinLeave')

  let s:gina_status = 0
  let g:gina_status_str = MyGinaRepoStatus()
  function! s:f_gina_status(event)
    if a:event ==# 'WinEnter'
      let g:gina_status_str = MyGinaRepoStatus()
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
      let g:gina_status_str = MyGinaRepoStatus()
      let s:gina_status = 1
    endif
  endfunction
augroup END
