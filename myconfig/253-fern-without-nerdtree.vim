UsePlugin 'fern.vim'
UsePlugin! 'nerdtree'

function! s:init_fern_nerd() abort
  " noop
endfunction

augroup fern-custom-without-nerdtree
  autocmd! *
  autocmd FileType fern call s:init_fern_nerd()
augroup END

" 絶対打ってしまうと思うのでmapping
command! NERDTree       FERNTree
command! NERDTreeToggle FERNTreeToggle
command! NERDTreeFind   FERNTreeFind
command! NEF            FERNTreeFind
