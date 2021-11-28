UsePlugin 'fern.vim'




function! s:init_fern() abort
  " Define NERDTree like mappings
  nmap <buffer> o <Plug>(fern-action-open:edit)
  nmap <buffer> go <Plug>(fern-action-open:edit)<C-w>p
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> gi <Plug>(fern-action-open:split)<C-w>p
  nmap <buffer> s <Plug>(fern-action-open:vsplit)
  nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p
  " nmap <buffer> ma <Plug>(fern-action-new-path)
  nmap <buffer> P gg

  nmap <buffer> x <Plug>(fern-action-collapse)
  nmap <buffer> C <Plug>(fern-action-enter)
  nmap <buffer> u <Plug>(fern-action-leave)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> R gg<Plug>(fern-action-reload)<C-o>
  nmap <buffer> cd <Plug>(fern-action-cd)
  nmap <buffer> CD gg<Plug>(fern-action-cd)<C-o>

  nmap <buffer> I <Plug>(fern-action-hidden:toggle)


  nmap <buffer> N <Plug>(fern-action-new-path)

	nmap <buffer><expr>
	      \ <Plug>(fern-my-open-or-expand-or-collapse)
	      \ fern#smart#leaf(
	      \   "<Plug>(fern-action-open)",
	      \   "<Plug>(fern-action-expand)",
	      \   "<Plug>(fern-action-collapse)",
	      \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-or-expand-or-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-or-expand-or-collapse)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END


command! FERNTree       Fern . -drawer
command! FERNTreeToggle Fern . -drawer -toggle
command! FERNTreeFind   Fern . -drawer -reveal=%
command! FEF            FERNTreeFind
