" ============================================================================
" File:        syntax_checkers/dafny/dafny.vim
" Description: default dafny syntax checker for syntastic.
" Maintainer:  Michael Lowell Roberts <mirobert at microsoft dot com>
" Version:     0.0.0
" License:     Microsoft Public License (Ms-PL)
" ============================================================================

if exists('g:loaded_syntastic_dafny_checker')
    finish
endif
let g:loaded_syntastic_dafny_checker = 1

if !exists('g:syntastic_dafny_sort')
    let g:syntastic_dafny_sort = 1
endif

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_dafny_dafny_IsAvailable() dict
"    Decho "self.getExec() => " . self.getExec()
    return executable(self.getExec())
endfunction

"function! SyntaxCheckers_dafny_dafny_GetHighlightRegex(item)
    "if match(a:item['text'], 'assigned but unused variable') > -1
        "let term = split(a:item['text'], ' - ')[1]
        "return '\V\\<'.term.'\\>'
    "endif

    "return ''
"endfunction

function! SyntaxCheckers_dafny_dafny_GetLocList() dict
    let makeprg = self.makeprgBuild({'args_before' : '-timeLimit:10 -compile:0'})
    let errorformat = '\ %#%f(%l\\\,%c):\ %m'
    let env = {}
    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat, 'env': env })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
            \ 'filetype': 'dafny',
            \ 'name': 'dafny',
            \ 'exec': 'Dafny' })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
