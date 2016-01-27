" Vim syntax file
" Language:	CPSC 411 IR EBNF
" Maintainer:	Norman Sue <normful@gmail.com>
" URL:		http://www.fleiner.com/vim/syntax/gdb.vim
" Last Change:	2016 Jan 26

syn keyword cpsc411irebnf Temp Label

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_ebnf_syn_inits")
  if version < 508
    let did_ebnf_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cpsc411irebnf Function
  delcommand HiLink
endif

let b:current_syntax = "ebnf"

" vim: ts=8
