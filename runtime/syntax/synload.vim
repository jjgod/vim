" Vim syntax support file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2004 Aug 28

" This file sets up for syntax highlighting.
" It is loaded from "syntax.vim" and "manual.vim".
" 1. Set the default highlight groups.
" 2. Install Syntax autocommands for all the available syntax files.

if !has("syntax")
  finish
endif

" let others know that syntax has been switched on
let syntax_on = 1

" Set the default highlighting colors.  Use a color scheme if specified.
if exists("colors_name")
  exe "colors " . colors_name
else
  runtime! syntax/syncolor.vim
endif

" Line continuation is used here, remove 'C' from 'cpoptions'
let s:cpo_save = &cpo
set cpo&vim

" First remove all old syntax autocommands.
au! Syntax

au Syntax *		call s:SynSet()

fun! s:SynSet()
  " clear syntax for :set syntax=OFF  and any syntax name that doesn't exist
  syn clear
  if exists("b:current_syntax")
    unlet b:current_syntax
  endif

  let s = expand("<amatch>")
  if s == "ON"
    " :set syntax=ON
    if &filetype == ""
      echohl ErrorMsg
      echo "filetype unknown"
      echohl None
    endif
    let s = &filetype
  endif

  if s != ""
    " Load the syntax file(s)
    exe "runtime! syntax/" . s . ".vim"
  endif
endfun


" Handle adding doxygen to other languages (C, C++, IDL)
au Syntax cpp,c,idl 
	\ if (exists('b:load_doxygen_syntax') && b:load_doxygen_syntax)
	\	|| (exists('g:load_doxygen_syntax') && g:load_doxygen_syntax)
	\   | runtime syntax/doxygen.vim 
	\ | endif

au Syntax *doxygen
	\ if exists("b:current_syntax") | finish | endif
	\ | let syn = substitute(expand("<amatch>"), 'doxygen$', '', '')
	\ | if syn != '' | exe 'runtime syntax/'.syn.'.vim' | endif
	\ | if b:current_syntax !~ 'doxygen' | runtime syntax/doxygen.vim | endif


" Source the user-specified syntax highlighting file
if exists("mysyntaxfile") && filereadable(expand(mysyntaxfile))
  execute "source " . mysyntaxfile
endif

" Restore 'cpoptions'
let &cpo = s:cpo_save
unlet s:cpo_save
