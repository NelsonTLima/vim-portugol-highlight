" Vim syntax file
" Language: Portugol
" Maintainer: Nelson Lima <nelsontlima@gmail.com>
" URL: https://github.com/NelsonTLima/vim-portugol-highlight.git

if !exists("main_syntax")
    if exists("b:current_syntax")
        finish
    endif
    let main_syntax = 'portugol'
elseif exists("b:current_syntax") && b:current_syntax == "portugol"
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match   portugolRegexOperator  "[\+\*\.\-/=?%!<>]"
syn match   portugolIdentifier      "\w*"
syn match   portugolLineComment     "\/\/.*"
syn match   portugolCommentSkip     "^[ \t]*\*\($\|[ \t]\+\)"
syn region  portugolComment         start="/\*"  end="\*/"
syn match   portugolSpecial         "\\\d\d\d\|\\."
syn region  portugolStringD         start=+"+  skip=+\\\\\|\\"+  end=+"\|$+
syn region  portugolStringS         start=+'+  skip=+\\\\\|\\'+  end=+'\|$+
syn region  portugolStringT         start=+`+  skip=+\\\\\|\\`+  end=+`+
syn match   portugolSpecialCharacter "'\\.'"
syn match   portugolNumber          "\<0[bB][0-1]\+\(_[0-1]\+\)*\>"
syn match   portugolNumber          "\<0[oO][0-7]\+\(_[0-7]\+\)*\>"
syn match   portugolNumber          "\<0\([0-7]\+\(_[0-7]\+\)*\)\?\>"
syn match   portugolNumber          "\<0[xX][0-9a-fA-F]\+\(_[0-9a-fA-F]\+\)*\>"
syn match   portugolNumber          "\<\d\+\(_\d\+\)*[eE][+-]\?\d\+\>"
syn match   portugolNumber          "\<[1-9]\d*\(_\d\+\)*\(\.\(\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\)\?\)\?\>"
syn match   portugolNumber          "\<\(\d\+\(_\d\+\)*\)\?\.\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\>"
syn match   portugolNumber          "\<\d\+\(_\d\+\)*\.\(\d\+\(_\d\+\)*\([eE][+-]\?\d\+\)\?\)\?\>"
syn region  portugolRegexpString    start=+[,(=+]\s*/[^/*]+ms=e-1,me=e-1 skip=+\\\\\|\\/+ end=+/[gimuys]\{0,2\}\s*$+ end=+/[gimuys]\{0,2\}\s*[+;.,)\]}]+me=e-1 end=+/[gimuys]\{0,2\}\s\+\/+me=e-1
syn match   portugolFunction        "\w*\ze(.*)"

syn keyword portugolConditional     se senao
syn keyword portugolRepeat          enquanto para
syn keyword portugolBranch          pare continue
syn keyword portugolOperator        ou e nao
syn keyword portugolType            real inteiro logico caracter cadeia
syn keyword portugolTypeDef         funcao classe programa
syn keyword portugolStatement       retorne faca
syn keyword portugolBoolean         verdadeiro falso
syn keyword portugolInclude         inclua biblioteca
syn keyword portugolLabel           caso

if main_syntax == "portugol"
    syn sync fromstart
    syn sync maxlines=100
    syn sync ccomment portugolComment
endif

"REGEXES

hi def link portugolRegexOperator       Operator
hi def link portugolIdentifier          Identifier
hi def link portugolComment             Comment
hi def link portugolLineComment         Comment
hi def link portugolSpecial             Special
hi def link portugolStringS             String
hi def link portugolStringD             String
hi def link portugolStringT             String
hi def link portugolCharacter           Character
hi def link portugolSpecialCharacter    portugolSpecial
hi def link portugolNumber              Number
hi def link portugolRegexpString        String
hi def link portugolFunction            Function

"KEYWORDS
hi def link portugolConditional         Conditional
hi def link portugolRepeat              Repeat
hi def link portugolBranch              Conditional
hi def link portugolOperator            Operator
hi def link portugolType                Type
hi def link portugolTypedef             Typedef
hi def link portugolStatement           Statement
hi def link portugolBoolean             Boolean
hi def link portugolInclude             Include
hi def link portugolLabel               Label

let b:current_syntax = "portugol"
if main_syntax == 'portugol'
    unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save
