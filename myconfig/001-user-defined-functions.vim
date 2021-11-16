function! s:lineNumberWithSeparator(line1, line2)
  if a:line1 != a:line2
    return ": " . a:line1 . "-" . a:line2
  endif
  return ""
endfunction
"""現在のファイルの絶対パスを取得
function! FullFilePath(line1, line2)
    return expand("%:p"). s:lineNumberWithSeparator(a:line1, a:line2)
endfunction

"""現在のファイルの相対パスを取得
function! RelativeFilePath(line1, line2)
    return expand("%"). s:lineNumberWithSeparator(a:line1, a:line2)
endfunction

command -range CopyFilePath let @+ = call('RelativeFilePath', [<line1>, <line2>])

