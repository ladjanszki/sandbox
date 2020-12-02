" This file has my experimental vimL code
" The sole purpose is to not mess up my init.vim while practicing
" Most of the material here is from Steve Losh: Learn Vimscript the hard way

" Echo a cat on every startup
augroup initGroup
  autocmd!
  autocmd VimEnter * echo '>^.^<' 
augroup END

" Autocommands                        
" Indenting html files correctly on writing
"autocmd BufWritePre *.html :normal gg=G

" Don't wrap long lines in html files (if created or readed)
"autocmd BufNewFile,BufRead *.html setlocal nowrap
"
" VARIABLES
" Basics
let foo = 'bar'
let hehe = '42'

" Options as variables
" Options are the one we setted at the beginning of the vimrc

 
 
