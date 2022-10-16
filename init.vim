scriptencoding utf-8
let g:vimrc_dir = expand("<sfile>:p:h")
execute 'set runtimepath^=' . g:vimrc_dir . '/runtime'

lua _G.My = {}


"----------------
"Maps
"----------------
"NOTE: プラグインでオーバーライドするかもしれないので先に実施
"QよりgQのほうがいい
nnoremap Q gQ
"Dがd$なので
nnoremap D dd
nnoremap C cc
nnoremap cx s
nnoremap s :s/
nnoremap S :s<CR>
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
"toggle <PASTE>
nnoremap <silent> cp :setl paste!<CR>
"相対行表示の切り替え
nnoremap <silent> cn :setl relativenumber!<CR>

"補完候補を<C-j><C-k>で移動
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

"JISキーボードでShiftなしで選択できるように
onoremap 2 i"
onoremap 7 i'
onoremap 8 i(
onoremap 9 i)
onoremap @ i`
onoremap , i<
onoremap . i>


"----------------
"System Settings
"----------------

"""Global Settings
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

"""Tab Settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"自動インデント
set autoindent
"高度な自動インデント
set smartindent

"""Input Settings
set include=^\s*#\s*include
set define=^\(#\s*define\|[a-z]*\s*const\s*[a-z]*\)
"文字表示の設定
set display=lastline,uhex
"折畳みの設定
set nofen
"行番号の表示
set number
"マーカー列の表示
set signcolumn=yes
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
"長い行を空白で折り返す
set linebreak
"折り返し先頭の表示文字
set showbreak=>\ 
"マルチバイト文字幅の設定
" SEE: https://twitter.com/otukaw/status/1367741425765412871
if !exists('g:vscode')
  set ambiwidth=double
endif
"ヘルプウィンドウの最小の高さ
set helpheight=0
set winminheight=0

"折り返しインデント
set breakindent
set breakindentopt=min:20,shift:0,sbr
"マウスの有効モード設定
set mouse=nv

"""その他
set writebackup
set confirm
set showcmd

" 大文字小文字曖昧一致
set ignorecase
set smartcase
set smarttab

"最後のカーソル位置を復元する
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | exe "normal! g `\"" | endif


"----------------
"Syntax Highlight
"----------------
if &t_Co > 2 || has("gui_running")
	syntax on
endif
filetype plugin indent on


"---------------
"User Defined Commands
"----------------

command! OpenBrowserCurrent execute "OpenBrowser" expand("%:p")

"--------
"Overwrite for Environment
"--------
let s:environment_vim_file_path = expand(g:vimrc_dir . '/environment.vim')
if filereadable(s:environment_vim_file_path)
	exec('source ' . s:environment_vim_file_path)
endif

source $VIMRUNTIME/macros/matchit.vim

"----------------
"Plugin
"----------------
" exec('source ' . g:vimrc_dir . '/dein.vim')
exec('source ' . g:vimrc_dir . '/plug.vim')
