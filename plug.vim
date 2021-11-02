""" https://zoshigayan.net/install-vim-plug/
" vim-plug なかったら落としてくる
let s:vim_plug_path = g:vimrc_dir . '/runtime/autoload/plug.vim'
if empty(glob(s:vim_plug_path))
  let s:installer = '!curl -fLo '
        \ . s:vim_plug_path
        \ . ' --create-dirs'
        \ . ' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echo s:installer
  execute s:installer
  autocmd VimEnter * PlugInstall --sync | exec 'source ' . expand(g:vimrc_dir . '/init.vim')
endif

" 足りないプラグインがあれば :PlugInstall を実行
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \ | PlugInstall --sync | exec 'source ' . expand(g:vimrc_dir . '/init.vim')
      \ | endif
"""

let s:vim_plug_dir = expand(g:vimrc_dir . '/plugged')
call plug#begin(s:vim_plug_dir)
Plug 'vim-jp/vimdoc-ja'
Plug 'xolox/vim-misc'
" colorscheme
Plug 'cocopon/iceberg.vim'

" Syntax
" api blueprint
Plug 'kylef/apiblueprint.vim'
" jinja2
Plug 'glench/vim-jinja2-syntax'
call plug#end()


" https://zenn.dev/mattn/articles/565c4ec71f461cbbf5c9
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

runtime! myconfig/*.vim
