let s:confhome = $XDG_CONFIG_HOME == '' ? $HOME . '/.config' : $XDG_CONFIG_HOME
exec ( 'source ' . s:confhome . '/nvim/dein.vim')
"----------------
"System Settings
"----------------
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

"BSで消去できる文字の設定
set backspace=indent,eol,start
"ウィンドウの大きさを自動で同じにする
set equalalways
"自動整形の設定
set formatoptions+=roqmM
"ハイライトサーチ
set hlsearch
"インクリメンタルサーチ
set incsearch
"
"
"
"""Global Settings
colorscheme molokai

"""Tab Settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
"自動インデント
set autoindent
"高度な自動インデント
set smartindent
""Indents
"set preserveindent

"""Input Settings

set include=^\s*#\s*include
set define=^\(#\s*define\|[a-z]*\s*const\s*[a-z]*\)
"文字表示の設定
set display=lastline,uhex
"折畳みの設定
set foldlevelstart=1
set foldmethod=indent
set foldignore+=/*
set foldignore+=<Space>
set nofen
"IMを切り替えるキーの提示
"set imactivatekey=S-C-space
"行番号の表示
set number
"モードを表示
set showmode
"未完成コマンドをステータス行に表示
set showcmd
"メニューの拡張表示
set wildmenu
"閉じ括弧入力で対括弧強調
set showmatch
"対括弧を強調表示する時間
set matchtime=3
"スクロール設定
set scrolloff=2
"set sidescroll=1
"set sidescrolloff=2
"長い行を空白で折り返す
set linebreak
"折り返し先頭の表示文字
set showbreak=>\ 
"マルチバイト文字幅の設定
set ambiwidth=double
"ヘルプウィンドウの最小の高さ
set helpheight=0
set winminheight=0
set writebackup
set confirm

"折り返しインデント
set breakindent
"マウスの有効モード設定
set mouse=nv
"""mappings
"----------------
"Syntax Highlight
"----------------
if &t_Co > 2 || has("gui_running")
	syntax on
endif
filetype plugin indent on
set smartcase
set smarttab

"set clipboard+=unnamed

"set paste

"最後のカーソル位置を復元する
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | exe "normal! g `\"" | endif

"----------------
"import
"----------------
"source ~/.vim/plugin.vimrc
set showcmd
" add tag filepath

"---------------
"language settings
"----------------
""C++
function! s:cpp()
	setl path+=/usr/include/c++/4.8.4
endfunction

augroup vimrc-cpp
	autocmd!
	autocmd FileType cpp call s:cpp()
augroup END

""markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
"----------------
"Omni Completion
"----------------
"setl tags+=~/.vim/tags/C/c.tags
"setl tags+=~/.vim/tags/C/cpp.tags
"setl tags+=~/.vim/tags/C/gl.tags
"setl tags+=~/.vim/tags/CPP/c.tags
"setl tags+=~/.vim/tags/CPP/cpp.tags
"setl tags+=~/.vim/tags/CPP/gl.tags
"set omnifunc=syntaxcomplete#Complete
"----------------
"Maps
"----------------
"QよりgQのほうがいい
nnoremap Q gQ
"Dがd$なので
nnoremap D dd
nnoremap C cc
nnoremap cx s
"nnoremap s :s/
"nnoremap S :s<CR>
"インデント調整用マッピング
vnoremap < <gv
vnoremap > >gv


"tabpage and buffers
nnoremap <Left> :tabp<CR>
nnoremap <Right> :tabn<CR>
nnoremap <Up> :bp<CR>
nnoremap <Down> :bn<CR>

"不要なマップを破棄します
nnoremap ch <silent>
nnoremap cj <silent>
nnoremap ck <silent>
nnoremap cl <silent>
nnoremap s <silent>
nnoremap S <silent>

"hlsearchの切り替えを簡単にする
nnoremap ch :setl hlsearch!<CR><C-L>

"簡易コンパイル
"nnoremap [action] <nop>
"nmap ; [action]
"nnoremap [action]c :make %:r<CR>
"nnoremap [action]e :!./%:r<CR>

"補完候補を<C-j><C-k>で移動
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
"----------------
"File Encoding Select
"----------------
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    if has('mac')
      let &fileencodings = s:enc_jis .','. s:enc_euc
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    else
      let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
      let &fileencodings = &fileencodings .','. s:fileencodings_default
    endif
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  unlet s:enc_euc
  unlet s:enc_jis
endif


"--------
"Overwrite for Environment
"--------
if filereadable(expand(s:confhome . '/nvim/environment.vim'))
	exec('source ' . s:confhome . '/nvim/environment.vim')
endif
