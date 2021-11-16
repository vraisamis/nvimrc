UsePlugin 'ale'

" 常にサイン列を表示
let g:ale_sign_column_always = 1
" ファイル保存時に実行
let g:ale_fix_on_save = 1
let g:ale_set_loclist = 1

" 言語ごとの設定
"" 初期化
if !exists("g:ale_linters")
	let g:ale_linters = {}
endif
if !exists("g:ale_linters_ignore")
	let g:ale_linters_ignore = {}
endif
if !exists("g:ale_fixers")
  let g:ale_fixers = {}
endif

""" Go
let g:ale_linters['go'] = ['gofmt', 'golint', 'govet', 'golangserver']
""" Java
let g:ale_linters['java'] = []
""" Javascript
let g:ale_linters_ignore['javascript'] = ['tsserver', 'flow-language-server']
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_javascript_prettier_options = '--print-width 140 --single-quote --jsx-bracket-same-line'
"""" ローカルの設定ファイルを考慮する
let g:ale_javascript_prettier_use_local_config = 1
""" Ruby
let g:ale_linters_ignore['ruby'] = ['solargraph', 'rubocop']
""" Rust
if executable('rust-analyzer')
  let g:ale_linters['rust'] = ['analyzer']
else
  let g:ale_linters['rust'] = ['rls']
endif
let g:ale_fixers['rust'] = ['rustfmt']
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_rust_rustfmt_options = '+stable'
""" Python
let g:ale_linters['python'] = ['flake8']
let g:ale_fixers['python'] = ['black']
