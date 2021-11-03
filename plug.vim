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
" document
Plug 'vim-jp/vimdoc-ja'

" colorscheme
Plug 'cocopon/iceberg.vim'

" syntax
Plug 'kylef/apiblueprint.vim'
Plug 'glench/vim-jinja2-syntax'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" status line
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" filer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" show indents
Plug 'nathanaelkane/vim-indent-guides'

" interactive replace
Plug 'osyo-manga/vim-over'

Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" word style change
Plug 'tpope/vim-abolish'

Plug 'tomtom/tcomment_vim'

" auto complete endtag
Plug 'tpope/vim-endwise'

Plug 'tyru/open-browser.vim'
Plug 'thinca/vim-quickrun'

" snippets
Plug 'reconquest/vim-pythonx'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" color brackets
Plug 'luochen1990/rainbow'

" session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" diagnostic
Plug 'w0rp/ale'

" text object
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-anyblock'
Plug 'sgur/vim-textobj-parameter'

" git
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'

Plug 'mechatroner/rainbow_csv', {'for': ['csv', 'tsv']}
Plug 'fatih/vim-go', {'for': ['go', 'gotexttmpl', 'gohtmltmpl' ]}
Plug 'kana/vim-filetype-haskell', {'for': ['haskell']}
Plug 'itchyny/vim-haskell-indent', {'for': ['haskell']}
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'othree/yajs.vim', {'for': ['javascript', 'javascript.jsx']}
Plug 'othree/es.next.syntax.vim', {'for': ['javascript', 'javascript.jsx']}
Plug 'othree/javascript-libraries-syntax.vim', {'for': ['javascript', 'javascript.jsx']}
Plug 'galooshi/vim-import-js', {'for': ['javascript', 'javascript.jsx']}
Plug 'iamcco/markdown-preview.nvim', {'for': ['markdown', 'pandoc.markdown', 'rmd']}
Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'pandoc.markdown', 'rmd']}
Plug 'tpope/vim-rails', {'for': ['ruby', 'erb']}
Plug 'rust-lang/rust.vim', {'for': ['rust']}
Plug 'cespare/vim-toml', {'for': ['toml']}
Plug 'osyo-manga/vim-precious', {'for': ['toml', 'markdown', 'jsp']}
Plug 'Shougo/context_filetype.vim', {'for': ['toml', 'markdown', 'jsp']}

" TODO: completion
" Plug 'Shougo/deoplete.nvim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'liuchengxu/vista.vim', {'for': []}
Plug 'easymotion/vim-easymotion', {'on': ['<Plug>(easymotion-']}
call plug#end()


" https://zenn.dev/mattn/articles/565c4ec71f461cbbf5c9
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
  return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

" NOTE: runtimepathを仮定しないのでglobでファイルを拾う
let s:files = sort(glob(g:vimrc_dir . '/myconfig/*.vim', v:true, v:true))
call map(s:files, {->[execute('exec "so" . v:val')]})
