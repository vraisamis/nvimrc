UsePlugin 'fzf'
UsePlugin 'fzf.vim'

" Ag コマンドがあるが、typoが多いのでalias
command! -nargs=* -bang AG Ag<bang> <args>
command! -nargs=* -bang RG Rg<bang> <args>

function! s:getAbsoluteCursorPos() abort
  let pos = getpos(".")
  let origin = win_screenpos(".")
  let abs_cursor_line = (origin[0] - 1) + pos[1] - line('w0')
  let abs_cursor_col = (origin[1] - 1) + wincol() - col('w0')
  return [abs_cursor_line, abs_cursor_col]
endfunction

" use floating window
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let abs_pos = s:getAbsoluteCursorPos()
  let width = float2nr(&columns - (&columns * 2 / 10))
  let tmp_col = float2nr((&columns - width) / 2)
  let col = max([min([tmp_col, abs_pos[1]]), abs_pos[1] - width])

  let toplines = abs_pos[0]
  let bottomlines = &lines - 1 - abs_pos[0]

  let row = 1
  " 下が広い
  if bottomlines > toplines
    let $FZF_DEFAULT_OPTS='--layout=reverse'
    " -2: statusline
    let height = bottomlines - 2
    let row = abs_pos[0] + 1
    let opts = {
          \ 'relative': 'editor',
          \ 'row': row,
          \ 'col': col,
          \ 'width': width,
          \ 'height': height
          \ }
  else
    let $FZF_DEFAULT_OPTS=''
    " -1: tabline
    let height = toplines - 1
    let row = 1
    let opts = {
          \ 'relative': 'editor',
          \ 'row': row,
          \ 'col': col,
          \ 'width': width,
          \ 'height': height
          \ }
  endif

  call nvim_open_win(buf, v:true, opts)
endfunction

if has("nvim-0.4.0")
  " g:fzf_layout だとbangのときにfloating windowにできない……
  " コマンドrenameが必要になりそう
  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif



" """ menu
" let s:menu = {}
"
" let s:menu['LanguageClient TextDocument CodeAction'] = {
"       \ 'type': 'funccall',
"       \ 'body': 'LanguageClient#textDocument_codeAction'
"       \ }
"
" let s:menu['Rg test'] = {
"       \ 'type': 'command',
"       \ 'body': 'Rg test'
"       \ }
"
" " echo s:menu
" " echo items(s:menu)
"
" " echo map(items(s:menu), {key, val -> key})
"
" let s:menu_list = map(sort(keys(s:menu)), {key, val -> key . "\t" . val})
" echo s:menu_list
"
" function! s:test(selected)
"   " echo できていない
"   " echo a:selected . " is selected"
"   let g:my_my_selected = a:selected
"   echo g:my_my_selected
" endfunction
"
" function! s:my_menu()
"   call fzf#run(fzf#wrap('menu_test', {
"         \ 'source': s:menu_list,
"         \ 'sink': funcref('s:test')
"         \ }))
" endfunction
"
" command! Test call s:my_menu()
"
"
"
"
" """ autocmdイベントの作成
" augroup fzf_menuing
"   au!
"   au User fzf_menu_setup silent
" augroup END
"
" " ロード済みのメニューの名前を入れておく
" let s:menu_loded = []
"
" " register関数
" function! fzf#register(name, other) abort
"   " FIXME
"   if s:menu_loded.contains(a:name)
"     " do nothing
"     return
"   endif
"   " register
"   " TODO
" endfunction
"
" " カスタムPrefixを押したときに実行する関数
" function! fzf#menu#execute() abort
"   " TODO
" endfunction
