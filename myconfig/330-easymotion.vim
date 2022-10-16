UsePlugin 'vim-easymotion'

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_keys = 'ASDFGHJKL;QWERTYUIOPZXCVBNM'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_jp = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
" 日本語も検索できるように
" require: `brew install cmigemo`
let g:EasyMotion_use_migemo = 1

function! SetEasyMotionMapping()
	nmap s <Plug>(easymotion-s2)
	xmap s <Plug>(easymotion-s2)
	" surround.vimと被らないように
	omap z <Plug>(easymotion-s2)

	map f <Plug>(easymotion-fl)
	map t <Plug>(easymotion-tl)
	map F <Plug>(easymotion-Fl)
	map T <Plug>(easymotion-Tl)
endfunction
call SetEasyMotionMapping()
