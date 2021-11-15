UsePlugin 'markdown-preview.nvim'

autocmd! User markdown-preview.nvim call mkdp#util#install()
let g:mkdp_auto_close = 0
