function! s:lineNumberWithSeparator(range, line1, line2)
  if !a:range
    return ""
  endif
  if a:line1 == a:line2
    return ": " . a:line1
  endif
  return ": " . a:line1 . "-" . a:line2
endfunction
"""現在のファイルの絶対パスを取得
function! FullFilePath(range, line1, line2)
    return expand("%:p"). s:lineNumberWithSeparator(a:range, a:line1, a:line2)
endfunction

"""現在のファイルの相対パスを取得
function! RelativeFilePath(range, line1, line2)
    return expand("%") . s:lineNumberWithSeparator(a:range, a:line1, a:line2)
endfunction

command -bang -range CopyFilePath let @+ = call(<bang>0 ? 'FullFilePath' : 'RelativeFilePath', [<range>, <line1>, <line2>])

""" if true, returns "!"
""" if false, returns ""
function! ToBang(bang) abort
  return a:bang ? "!" : ""
endfunction

""" for colorscheme
function! UseColorScheme(name, with_lightline) abort
  if a:with_lightline
    let g:lightline = get(g:, 'lightline', {})
    let g:lightline.colorscheme = a:name
  endif

  exe 'colorscheme' a:name
endfunction
command -nargs=1 -bang -bar UseColorScheme call UseColorScheme(<args>, <bang>v:true)

""" {{{
" SEE: https://rcmdnk.com/blog/2013/12/01/computer-vim/
function ShowHighlight(bang) abort
  let hi = synID(line("."), col("."), 1)
  " bangなら大本を表示、そうでなければハイライトアイテム名を表示
  if a:bang
    let hi = synIDtrans(hi)
  endif
  return synIDattr(hi, "name") 
endfunction

" カーソル下のハイライトを表示するコマンド
command! -bang ShowHighlight echo ShowHighlight(<bang>0)
""" }}}
