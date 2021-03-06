function! vim2hs#haskell#syntax#operators() " {{{
  syntax match hsOperator
    \ '[([:blank:]]\@<=\%([[:upper:]]\k*\.\)*[-!#$%&\*\+/=\?@\\^|~.<>][-!#$%&\*\+/=\?@\\^|~:.<>]*\ze\_[[:blank:])]'
    \ display

  syntax match hsOperator
    \ "`\k\%(\k\|\.\)*`"
    \ display

  highlight! link hsOperator Operator
endfunction " }}}


function! vim2hs#haskell#syntax#delimiters() " {{{
  syntax match hsDelimiter
    \ '(\|)\|\[\|\]\|,\|;\|{\|}\||\|\k\@<!_\k\@!\|[[:punct:]]\@<!@[[:punct:]]\@!'
    \ display

  highlight! link hsDelimiter Delimiter
endfunction " }}}


function! vim2hs#haskell#syntax#keywords(conceal_wide, conceal_enumerations, conceal_bad) " {{{
  syntax case match

  syntax keyword hsStructure
    \ module let in where do deriving proc

  if a:conceal_enumerations
    syntax match hsDeriving
      \ '\%(deriving\s*(\)\@<=.*,.*)\@='
      \ conceal cchar=…
  endif

  syntax match hsTypedef
    \ '\<\%(type\|newtype\|data\|class\|instance\)\>'
    \ display

  syntax keyword hsStatement
    \ import infix infixl infixr

  syntax keyword hsConditional
    \ if then else case of

  syntax keyword hsKeyword
    \ qualified safe as hiding default family

  syntax match hsStructure
    \ "[[:punct:]]\@<!\%(=\)[[:punct:]]\@!"
    \ display

  if !a:conceal_wide
    syntax match hsStructure
      \ "[[:punct:]]\@<!\%(->\|→\|<-\|←\|::\|∷\)[[:punct:]]\@!"
      \ display
  endif

  if !a:conceal_bad
    syntax match hsStructure
      \ "[[:punct:]]\@<!\%(=>\|⇒\|-<<\?\)[[:punct:]]\@!"
      \ display
  endif

  highlight! link hsStructure Structure
  highlight! link hsTypedef Typedef
  highlight! link hsStatement Statement
  highlight! link hsConditional Conditional
  highlight! link hsKeyword Keyword
endfunction " }}}


function! vim2hs#haskell#syntax#numbers() " {{{
  syntax match hsNumber
    \ "\<[0-9]\+\>\|\<0[xX][0-9a-fA-F]\+\>\|\<0[oO][0-7]\+\>"
    \ display

  syntax match hsFloat
    \ "\<[0-9]\+\.[0-9]\+\([eE][-+]\=[0-9]\+\)\=\>"
    \ display

  highlight! link hsNumber Number
  highlight! link hsFloat Float
endfunction " }}}


function! vim2hs#haskell#syntax#types() " {{{
  syntax match hsType
    \ "^\(\s*\)\%(default\s\+\)\?\%(\k\+\|([^[:alnum:]]\+)\)\_s*\(::\|∷\).*\%(\n\1\s.*\)*"
    \ contains=TOP,@Spell

  " Types from the standard prelude.
  syn match hsType        "\<\(Bool\|Maybe\|Either\|Ordering\)\>"
  syn match hsType        "\<\(Char\|String\|Int\|Integer\|Float\|Double\|Rational\|IO\)\>"
  syn match hsType        "\<\(ReadS\|ShowS\)\>"
  syn match hsType        "\<\(FilePath\|IOError\)\>"

  " Classes from the standard prelude
  syn match hsType        "\<\(Eq\|Ord\|Enum\|Bounded\|Num\|Real\|Integral\|Fractional\|Floating\|RealFrac\|RealFloat\|Monad\|Functor\)\>"
  syn match hsType        "\<\(Show\|Read\)\>"


  " Constants from the standard prelude.
  syn match hsBoolean     "\<\(True\|False\)\>"
  syn match hsMaybe       "\<\(Nothing\|Just\)\>"
  syn match hsConstant    "\<\(Left\|Right\)\>"
  syn match hsOrdering    "\<\(LT\|EQ\|GT\)\>"


  " Functions from the standard prelude.
  syn match hsFunction    "\<\(compare\|max\|min\)\>"
  syn match hsFunction    "\<\(succ\|pred\|toEnum\|fromEnum\|enumFrom\|enumFromThen\|enumFromTo\|enumFromThenTo\)\>"
  syn match hsFunction    "\<\(minBound\|maxBound\)\>"
  syn match hsFunction    "\<\(negate\|abs\|signum\|fromInteger\)\>"
  syn match hsFunction    "\<toRational\>"
  syn match hsFunction    "\<\(quot\|rem\|div\|mod\|quotRem\|divMod\|toInteger\)\>"
  syn match hsFunction    "\<\(recip\|fromRational\)\>"
  syn match hsFunction    "\<\(pi\|exp\|log\|sqrt\|logBase\|sin\|cos\|tan\|asin\|acos\|atan\|sinh\|cosh\|tanh\|asinh\|acosh\|atanh\)\>"
  syn match hsFunction    "\<\(properFraction\|truncate\|round\|ceiling\|floor\)\>"
  syn match hsFunction    "\<\(floatRadix\|floatDigits\|floatRange\|decodeFloat\|encodeFloat\|exponent\|significand\|scaleFloat\|isNaN\|isInfinite\|isDenormalized\|isIEEE\|isNegativeZero\|atan2\)\>"
  syn match hsFunction    "\<\(return\|fail\)\>"
  syn match hsFunction    "\<\(fmap\)\>"
  syn match hsFunction    "\<\(mapM\|mapM_\|sequence\|sequence_\)\>"
  syn match hsFunction    "\<\(maybe\|either\)\>"
  syn match hsFunction    "\<\(not\|otherwise\)\>"
  syn match hsFunction    "\<\(subtract\|even\|odd\|gcd\|lcm\)\>"
  syn match hsFunction    "\<\(fromIntegral\|realToFrac\)\>"
  syn match hsFunction    "\<\(fst\|snd\|curry\|uncurry\|id\|const\|flip\|until\)\>"
  syn match hsFunction    "\<\(asTypeOf\|error\|undefined\)\>"
  syn match hsFunction    "\<\(seq\)\>"
  syn match hsFunction    "\<\(map\|filter\|concat\|concatMap\)\>"
  syn match hsFunction    "\<\(head\|last\|tail\|init\|null\|length\)\>"
  syn match hsFunction    "\<\(foldl\|foldl1\|scanl\|scanl1\|foldr\|foldr1\|scanr\|scanr1\)\>"
  syn match hsFunction    "\<\(iterate\|repeat\|replicate\|cycle\)\>"
  syn match hsFunction    "\<\(take\|drop\|splitAt\|takeWhile\|dropWhile\|span\|break\)\>"
  syn match hsFunction    "\<\(lines\|words\|unlines\|unwords\|reverse\|and\|or\)\>"
  syn match hsFunction    "\<\(any\|all\|elem\|notElem\|lookup\)\>"
  syn match hsFunction    "\<\(sum\|product\|maximum\|minimum\)\>"
  syn match hsFunction    "\<\(zip\|zip3\|zipWith\|zipWith3\|unzip\|unzip3\)\>"
  syn match hsFunction    "\<\(readsPrec\|readList\)\>"
  syn match hsFunction    "\<\(showsPrec\|show\|showList\)\>"
  syn match hsFunction    "\<\(reads\|shows\|read\|lex\)\>"
  syn match hsFunction    "\<\(showChar\|showString\|readParen\|showParen\)\>"
  syn match hsFunction    "\<\(ioError\|userError\|catch\)\>"
  syn match hsFunction    "\<\(putChar\|putStr\|putStrLn\|print\)\>"
  syn match hsFunction    "\<\(getChar\|getLine\|getContents\|interact\)\>"
  syn match hsFunction    "\<\(readFile\|writeFile\|appendFile\|readIO\|readLn\)\>"

  hi link hsFunction Function
  hi link hsBoolean Boolean
  hi link hsMaybe hsEnumConst
  hi link hsConstant Constant
  hi link hsOrdering hsEnumConst
  
  highlight! link hsType Type
endfunction " }}}


function! vim2hs#haskell#syntax#bindings() " {{{
  syntax match hsIdentifier
    \ "^\k\+\ze.*\%(\n\s.*\|\n\)*[[:punct:]]\@<!=[[:punct:]]\@!"

  highlight! link hsIdentifier Identifier
endfunction " }}}


function! vim2hs#haskell#syntax#folds() " {{{
  syntax region hsFold
    \ start="^\%(type\|newtype\|class\|instance\|data\)\@!
            \\k\+.*\%(\n\s.*\|\n\)*[[:punct:]]\@<!=[[:punct:]]\@!"
    \ skip='\n#\|\n--'
    \ end='\ze\%(\s*\n\)\+\S'
    \ transparent fold

  syntax region hsFold
    \ start='^\%(type\|newtype\|class\|instance\|data\)\>'
    \ end='\ze\%(\s*\n\)\+\S'
    \ transparent fold
endfunction " }}}


function! vim2hs#haskell#syntax#strings(multiline_strings) " {{{
  syntax match hsSpecialChar
    \ contained
    \ "\\\%([0-9]\+\|o[0-7]\+\|
        \x[0-9a-fA-F]\+\|[\"\\'&\\abfnrtv]\|
        \^[A-Z^_\[\\\]]\)"

  syntax match hsSpecialChar
    \ contained
    \ "\\\%(NUL\|SOH\|STX\|ETX\|EOT\|ENQ\|ACK\|
        \BEL\|BS\|HT\|LF\|VT\|FF\|CR\|SO\|SI\|
        \DLE\|DC1\|DC2\|DC3\|DC4\|NAK\|SYN\|
        \ETB\|CAN\|EM\|SUB\|ESC\|FS\|GS\|
        \RS\|US\|SP\|DEL\)"

  syntax match hsSpecialCharError
    \ contained
    \ "\\&\|'''\+"

  syntax match hsCharacter
    \ "[^a-zA-Z0-9_']'\%([^\\]\|\\[^']\+\|\\'\)'"lc=1
    \ contains=hsSpecialChar,hsSpecialCharError

  syntax match hsCharacter
    \ "^'\%([^\\]\|\\[^']\+\|\\'\)'"
    \ contains=hsSpecialChar,hsSpecialCharError

  if a:multiline_strings
    syntax match hsLineContinuation
      \ "\%(\\$\|^\s*\\\)"
      \ contained

    syntax region hsString
      \ start=+"+ skip=+\\\\\|\\"+ end=+"+
      \ contains=hsSpecialChar,@Spell,hsLineContinuation

  else
    syntax region hsStringError
      \ start=+"+ skip=+\\\\\|\\"+ end=+"\@!$+
      \ contains=hsSpecialChar,@Spell

    syntax region hsString
      \ start=+"+ skip=+\\\\\|\\"+ end=+"+
      \ oneline contains=hsSpecialChar,@Spell

  endif

  highlight! link hsSpecialChar SpecialChar
  highlight! link hsLineContinuation SpecialChar
  highlight! link hsSpecialCharError Error
  highlight! link hsCharacter Character
  highlight! link hsStringError Error
  highlight! link hsString String
endfunction " }}}


function! vim2hs#haskell#syntax#comments(conceal_comments, conceal_enumerations) " {{{
  syntax case match

  syntax keyword hsTodo
    \ TODO FIXME XXX
    \ contained

  if a:conceal_comments
    syntax match hsComment
      \ '---*\%([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$'
      \ contains=hsTodo,@Spell
      \ conceal cchar=ℹ

    syntax match hsComment
      \ '^\s*---*\%([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$'
      \ contains=hsTodo,@Spell
  else
    syntax match hsComment
      \ '---*\%([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$'
      \ contains=hsTodo,@Spell
  endif

  syntax region hsBlockComment
    \ start="{-" end="-}"
    \ contains=hsBlockComment,hsTodo,@Spell

  if a:conceal_enumerations
    syntax match hsLANGUAGEPragma
      \ 'LANGUAGE\s\+\zs.*,.*\ze\s\+#-}'
      \ contained conceal cchar=…

    syntax region hsPragma
      \ start="{-#" end="#-}"
      \ contains=hsLANGUAGEPragma
  else
    syntax region hsPragma
      \ start="{-#" end="#-}"
  endif

  highlight! link hsTodo Todo
  highlight! link hsComment Comment
  highlight! link hsBlockComment Comment
  highlight! link hsLANGUAGEPragma PreProc
  highlight! link hsPragma PreProc
endfunction " }}}


function! vim2hs#haskell#syntax#haddock() " {{{
  syntax match haddockHeading
    \ "\*\+.*\%(-}\)\@=\|\*\+.*$"
    \ contained containedin=hsComment

  syntax match haddockChunk
    \ "\$[[:alnum:]]\+"
    \ contained containedin=hsComment

  syntax match haddockAnnotation
    \ "[|^].*\%(-}\)\@=\|[|^].*$"
    \ contained containedin=hsComment

  syntax match haddockIdentifier
    \ "'\%(\k\|\.\)\+'"ms=s+1,me=e-1
    \ contained containedin=hsComment

  syntax match haddockModule
    \ /"[A-Z]\%(\k\|\.\)\+"/ms=s+1,me=e-1
    \ contained containedin=hsComment

  syntax match haddockEmphasis
    \ "\/.\+/"ms=s+1,me=e-1
    \ contained containedin=hsComment

  syntax match haddockURL
    \ "<\S\+>"ms=s+1,me=e-1
    \ contained containedin=hsComment

  syntax region haddockExample matchgroup=haddockREPL
    \ start="\%(<\S\+\)\@<!>\%(>>\)\?" end="$"
    \ contained contains=TOP containedin=hsComment

  syntax match haddockLabel
    \ /#\S\+#/
    \ contained containedin=hsComment

  syntax match haddockAnchor
    \ "[A-Z]\%(\k\|\.\)\+#\S\+"
    \ contained containedin=hsComment

  highlight! link haddockHeading Title
  highlight! link haddockChunk PreProc
  highlight! link haddockAnnotation Title
  highlight! link haddockIdentifier Underlined
  highlight! link haddockModule Underlined
  highlight! link haddockEmphasis Todo
  highlight! link haddockURL Underlined
  highlight! link haddockREPL Delimiter
  highlight! link haddockLabel Label
  highlight! link haddockAnchor Underlined
endfunction " }}}


function! vim2hs#haskell#syntax#ffi() " {{{
  syntax case match
  syntax keyword hsFFI foreign export stdcall ccall unsafe
  highlight! link hsFFI Keyword
endfunction " }}}


function! vim2hs#haskell#syntax#cpp() " {{{
  syntax match cppPreCondit "^#\s*\%(else\|endif\)$"

  syntax region cppPreCondit
    \ start="^#\s*\%(if\|ifdef\|ifndef\|elif\)\>"
    \ skip="\\$"
    \ end="$"

  syntax region cppDefine
    \ start='^#\s*\%(define\)\>'
    \ end='$'

  syntax region cppInclude
    \ start='^#\s*\%(include\)\>\s*\%("\f\+"\|<\f\+>\)$'
    \ end='$'

  highlight! link cppPreCondit PreCondit
  highlight! link cppDefine Define
  highlight! link cppInclude Include
endfunction "}}}


function! vim2hs#haskell#syntax#th() " {{{
  syntax region hsTHContent matchgroup=hsTHSplice
    \ start="\$(" end=")"
    \ contains=TOP

  syntax region hsTHContent matchgroup=hsTHQuote
    \ start="\[\$\?[edtp]\?|" end="|\]"
    \ contains=TOP

  highlight! link hsTHSplice Macro
  highlight! link hsTHQuote Delimiter
endfunction " }}}


function! vim2hs#haskell#syntax#hsp() " {{{
  syntax match hspContain
    \ "<%>\|</%>"
    \ display

  syntax match hspTag
    \ "<\w\+/>\|</\w\+>"
    \ display

  syntax match hspAttrValue
    \ ""
    \ display contained contains=TOP

  syntax match hspAttrName
    \ "\w\+="
    \ display contained

  syntax region hspText matchgroup=hspTag
    \ start="<\z(\w\+\)>" end="</\z1>"
    \ contains=hspHaskell,hspTag,hspText,hspAttr

  syntax region hspAttr matchgroup=hspTag
    \ start="<\w\+\_s" end="/\?>"
    \ contains=hspAttrName,hspAttrValue

  syntax region hspHaskell matchgroup=hspSplice
    \ start="<%>\@!" end="\%(</\)\@!%>"
    \ contains=TOP

  syntax region hspQQContent matchgroup=hspQQuote
    \ start="\[\$\?hsx|" end="|\]"
    \ contains=TOP

  highlight! link hspContain Delimiter
  highlight! link hspTag PreProc
  highlight! link hspAttrName Constant
  highlight! link hspSplice Macro
  highlight! link hspQQuote Delimiter
  highlight! link hspQQContent String
  highlight! link hspText String
endfunction " }}}
