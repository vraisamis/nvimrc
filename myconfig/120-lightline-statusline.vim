UsePlugin 'ale'
UsePlugin 'lightline-ale'
UsePlugin 'lightline.vim'

set laststatus=2
let g:gina_status_str = get(g:, 'gina_status_str', '')
let g:lightline = {
	\ 'colorscheme' : 'iceberg',
	\ 'mode_map': { 'c': 'NORMAL' },
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ], [ 'gina', 'session', 'filename' ] , [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]]
	\ },
	\ 'component': {
	\   'gina': '%{g:gina_status_str}'
	\ },
	\ 'component_function': {
	\   'filename': 'LightlineFilename',
	\   'session': 'MySessionName',
	\ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'component_expand' : {
  \  'linter_checking': 'lightline#ale#checking',
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
  \ },
  \ 'component_type' : {
  \     'linter_checking': 'left',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'left',
  \ },
	\ }

function! LightlineModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '[RO]' : ''
endfunction

function! LightlineFilename()
	return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? vimshell#get_status_string() :
				\  &ft =~ '^gina' ? &ft :
				\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
				\ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! MySessionName() abort
  return ''
endfunction
