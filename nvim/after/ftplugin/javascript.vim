" make omnifunc auto complete html tags in javascript
setlocal omnifunc=htmlcomplete#CompleteTags

" make Vim recognize ES6 import statements
let &l:include='\<from\s\(["'']\)\zs[^\1]\+\ze\1'

" make Vim use ES6 export statements as define statements
let &l:define='\v(export\s+(default\s+)?)?(var|let|const|function|class)|export\s+'

setlocal suffixesadd=.js,.jsx
