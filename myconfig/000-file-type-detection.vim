"markdown
autocmd BufRead,BufNewFile *.md setl filetype=markdown tabstop=4 shiftwidth=4 softtabstop=4

" jinja
autocmd BufRead,BufEnter *.html.j2 set filetype=html.jinja
autocmd BufRead,BufEnter *.sql.j2 set filetype=sql.jinja
autocmd BufRead,BufEnter *.json.j2 set filetype=json.jinja

" csv, tsv
autocmd BufRead,BufEnter *.csv set filetype=csv
autocmd BufRead,BufEnter *.tsv set filetype=tsv

" mustache
au BufNewFile,BufRead *.scala.mustache set filetype=scala.mustache
