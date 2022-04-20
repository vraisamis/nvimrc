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
