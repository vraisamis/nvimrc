UsePlugin 'coc.nvim'

let g:coc_config_home = g:vimrc_dir

let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-git',
      \ 'coc-metals',
      \ 'coc-rust-analyzer',
      \ ]

" <CR> で候補決定
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nnoremap [coc] <silent> <nop>
nmap <Space>c [coc]
xnoremap [coc] <silent> <nop>
xmap <Space>c [coc]


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nnoremap <silent> [coc]g <Plug>(coc-diagnostic-prev)
" nnoremap <silent> [coc]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nnoremap <silent> [coc]d <Plug>(coc-definition)
nnoremap <silent> [coc]t <Plug>(coc-type-definition)
nnoremap <silent> [coc]i <Plug>(coc-implementation)
nnoremap <silent> [coc]r <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nnoremap [coc]rn <Plug>(coc-rename)

" Formatting selected code.
xnoremap [coc]f  <Plug>(coc-format-selected)
nnoremap [coc]f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap [coc]a  <Plug>(coc-codeaction-selected)
nmap [coc]a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap [coc]ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap [coc]qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:CocFormat` command to format current buffer.
command! -nargs=0 CocFormat :call CocAction('format')

" Add `:CocFold` command to fold current buffer.
command! -nargs=? CocFold :call CocAction('fold', <f-args>)

" Add `:CocOrganizeImport` command for organize imports of the current buffer.
command! -nargs=0 CocOrganizeImport :call CocAction('runCommand', 'editor.action.organizeImport')

nnoremap [coc-list] <silent> <nop>
nmap <Space>l [coc-list]

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> [coc-list]d  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> [coc-list]e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> [coc-list]c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> [coc-list]o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> [coc-list]s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> [coc-list]n  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> [coc-list]p  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> [coc-list]r  :<C-u>CocListResume<CR>
