" Markdown fix
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
" DTL for erlydtl
au BufRead,BufNewFile *.{dtl,tmpl} set filetype=django
au BufRead,BufNewFile *{relx,rebar,sys}.config* set filetype=erlang
au BufRead,BufNewFile *.{appup,app} set filetype=erlang
au BufRead,BufNewFile *.{appup.src,app.src} set filetype=erlang
