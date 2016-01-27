" Vim syntax file
" Language:	CPSC 411 IR Language EBNF
" Maintainer:	Norman Sue <normful@gmail.com>
" URL:		https://github.com/normful/vim-cpsc411
" Last Change:	2016 Jan 26

" Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  " we define it here so that included files can test for it
  let main_syntax='ebnf411ir'
endif

" don't use standard HiLink, it will not work with included syntax files
if version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif

syn keyword ebnf411irNonTerminal          Exp Stm Data
syn keyword ebnf411irNonTerminalContained Exp Stm Data contained
syn match   ebnf411irNonTerminalContained "\(Exp\|Stm\|Data\),*" contained
syn keyword ebnf411irTerminal             BINOP CALL CJUMP CMOVE CONST DATA ESEQ EXP JUMP LABEL MEM MOVE NAME SEQ TEMP 

syn keyword ebnf411irConstant             int                 contained
syn match   ebnf411irIdentifier           "\(Label\|Temp\),*" contained
syn match   ebnf411irOperator             "\(Op\|RelOp\),*"   contained

syn region  ebnf411irProductionArgs start="("   end=")" contains=ebnf411irNonTerminalContained,ebnf411irIdentifier,ebnf411irOperator,ebnf411irConstant
syn region  ebnf411irComment        start="(\*" keepend end="\*)"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_ebnf_syn_inits")
  if version < 508
    let did_ebnf_syn_inits = 1
    command! -nargs=+ HiLink hi link <args>
  else
    command! -nargs=+ HiLink hi def link <args>
  endif
  HiLink ebnf411irNonTerminal          Function
  HiLink ebnf411irNonTerminalContained Function
  HiLink ebnf411irTerminal             Typedef
  HiLink ebnf411irConstant             Constant
  HiLink ebnf411irIdentifier           Identifier
  HiLink ebnf411irOperator             Operator
  HiLink ebnf411irComment              Comment
  delcommand HiLink
endif

let b:current_syntax = "ebnf411ir"

" vim: ts=8
