" === FUNCTIONS ==============================================================
" function! means in case of name collision overwrite the previous with this definition
function! EchoQuote()
  echo 'This is a quote from a poem!!'
endfunction

" === VARIABLES ==============================================================
function! EchoQuote2()
  let quote = 'Echo from variable'
  echo quote
endfunction

" === ARGUMENTS ==============================================================
" The a: before the variable name means this is a named argument 
function! EchoQuote3(quote)
  echo a:quote
endfunction

" Optional and named arguments
" :call OptionalAndNamedArguments('The quote', 'John Doe', '1999')                                                                                                                                          "
" The quote
" 2
" John Doe
" John Doe
" 1999
function! OptionalAndNamedArguments(quote, ...)
  echo a:quote
  echo a:0
  echo a:1
  echo a:000[0]
  echo a:000[1]
endfunction

" === STRING CONCATENATION ===================================================
" Concatenate two strings with . operator
function! ConcatStrings(s1, s2)
  echo a:s1 . a:s2
endfunction

" === VARIABLE SCOPES ========================================================
" Variables can be scoped at definition and usage
let g:own_var = 'Global variable'
function! ScopedVariable(own_var)
  let l:own_var = 'Local variable'
  echo 'Argument:   ' . a:own_var
  echo 'Local var:  ' . l:own_var
  echo 'Global var: ' . g:own_var
endfunction
"call Scopedvariable('Argument')

" === TYPES ==================================================================
" Numbers
" Strings
" Funcref (do we really need these in VimL?)
" Lists
let test_list = ['cat', 'dog', 'bird']
"echo test_list[0] " cat
"echo test_list[1] " dog

" Dictionary or map
let test_dict = {'key1': 'value1', 'key2': 'value2'}
let test_dict['key3'] = 'value3'
"echo test_dict['key1']
"echo test_dict " This prints out the whole dict with all keys and values

" === LOOPES =================================================================
let animales = ['cat', 'dog', 'bird', 'giraffe']

"while len(animales) > 0
"  echo animales[0] . ' is an animal.'
"  call remove(animales, 0)
"endwhile

let scientists = ['Einstein', 'Newton', 'Schrodinger', 'Leibniz']

"for scientist in scientists
"  echo scientist . ' is a scientist'
"endfor

" === EQUALITY OPERATORS =====================================================
" in VimL the equality operators value depends on the user setting of
" ignorecase. This can be avoided by using the explicitly case sensitive and
" explicitly case insensitive operators
set ignorecase
"echo 'THIS' == 'this'

set noignorecase
"echo 'THIS' == 'this'

set ignorecase
" ==# case sensitive
" ==? case INsensitive
"echo 'THIS' ==# 'this' 
"echo 'THIS' ==? 'this'

set noignorecase
"echo 'THIS' ==# 'this'
"echo 'THIS' ==? 'this'








