UsePlugin 'vim-session'
UsePlugin 'vim-misc'

" gitリポジトリ配下ならgitのrootを返す。そうでないなら空を返す
function! s:GetGitDir()
  " Set 'gitdir' to be the folder containing .git
  let gitdir = system("git rev-parse --show-toplevel")
  " See if the command output starts with 'fatal' (if it does, not in a git repo)
  let isnotgitdir=matchstr(gitdir, '^fatal:.*')
  " If it empty, there was no error. Let's cd
  if empty(isnotgitdir)
    return substitute(gitdir, '\n', '', 'g')
  else
    return ""
  endif
endfunction

function! s:GetGitCurrentBranch()
  " Set 'gitdir' to be the folder containing .git
  let branch = system("git rev-parse --abbrev-ref HEAD")
  " See if the command output starts with 'fatal' (if it does, not in a git repo)
  let isnotgitdir=matchstr(branch, '^fatal:.*')
  " If it empty, there was no error. Let's cd
  if empty(isnotgitdir)
    return substitute(branch, '\n', '', 'g')
  else
    return ""
  endif
endfunction

"""" 以下の順番でsessionディレクトリを探索
"""" 1. 現在のディレクトリ直下の .vimsessions フォルダ
"""" 2. gitリポジトリ配下ならリポジトリroot直下の .vimsessionsフォルダ
"""" 3.  ~/.config/nvim/default-sessions　（共通）

" https://www.g104robo.com/entry/vim-session
" 現在のディレクトリ直下の .vimsessions/ を取得
let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')
if isdirectory(s:local_session_directory)
  " 存在すれば
  " session保存ディレクトリをそのディレクトリの設定
  let g:session_directory = s:local_session_directory
  " vimを辞める時に自動保存
  let g:session_autosave = 'yes'
  " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開かない
  let g:session_autoload = 'no'
  " 1分間に1回自動保存
  let g:session_autosave_periodic = 1
  let g:session_autosave_silent = 1
else
  " 存在しなければ
  " 現在のリポジトリroot配下の .vimsessions/ を取得
  let s:git_dir = s:GetGitDir()
  if strlen(s:git_dir) > 0
    " gitリポジトリ配下なら
    let s:local_session_directory = xolox#misc#path#merge(s:git_dir, '.vimsessions')
    " 存在しなければディレクトリ作成する
    if !isdirectory(s:local_session_directory)
      call mkdir(s:local_session_directory)
    endif
    " session保存ディレクトリをそのディレクトリの設定
    let g:session_directory = s:local_session_directory
    " vimを辞める時に自動保存
    let g:session_autosave = 'yes'
    " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開かない
    let g:session_autoload = 'no'
    " 1分間に1回自動保存
    let g:session_autosave_periodic = 1
    let g:session_autosave_silent = 1
  else
    " neovimのディレクトリにsession作成
    let s:local_session_directory = expand("~/.config/nvim/default-sessions")
    " 存在しなければディレクトリ作成する
    if !isdirectory(s:local_session_directory)
      call mkdir(s:local_session_directory)
    endif
    " デフォルトの保存ディレクトリを変更する
    let g:session_directory = s:local_session_directory
    " vimを辞める時に自動保存しない
    let g:session_autosave = 'no'
    " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開かない
    let g:session_autoload = 'no'
  endif
  unlet s:git_dir
endif
unlet s:local_session_directory

" セッション保存と復帰のコマンド
" https://qiita.com/ToruIwashita/items/8c5039655ab73ea9261e
function! s:save_session(...)
  if a:0
    let session_name = a:1
  else
    let session_name = s:GetGitCurrentBranch()
  end

  if strlen(session_name)
    execute 'SaveSession ' . session_name . '.branch'
  else
    echo 'not a git repository'
  endif
endfunction

function! s:load_session(...)
  if a:0
    let session_name = a:1
  else
    let session_name = s:GetGitCurrentBranch()
  end

  if strlen(session_name)
    execute 'OpenSession ' . session_name . '.branch'
  else
    echo 'no target session found'
  endif
endfunction

command! -nargs=? SaveBranchSession call s:save_session(<f-args>)
command! -nargs=? LoadBranchSession call s:load_session(<f-args>)


" for ale
function! MySessionName() abort
  let l:session_name = xolox#session#find_current_session()
  if empty(l:session_name)
    return ''
  else
    if strridx(l:session_name, '.branch')
      let l:session_display_name = ''
    else
      let l:session_display_name = l:session_name
    endif
    return '' . l:session_display_name
  endif
endfunction
