let g:phpunit_cmd           = "unit-tests"

if !exists("g:vivo_project_path")
    let g:vivo_project_path     = "/www/vhosts/backend.vivo2.com/"
endif

let g:phpunit_callback      = "VivoTestsCallback"

function! VivoTestsCallback(args)
    " Trim white space
    let l:args  = a:args
    " let l:args = substitute(a:args, '^\s*\(.\{-}\)\s*$' '\1', '');

    if len(l:args) is 0
        let l:file = expand('%')
        let l:file = substitute(expand('%'), '^' . g:vivo_project_path . '\(.*\)$', "\\1", '')
        if l:file =~ '^tests/.*'
            return expand('%')
        else
            return g:vivo_project_path . "tests/" . l:file
        endif
    endif
endfunction

" print expand('%')
" print substitute(expand('%'), '^/www/vhosts/backend.vivo2.com/\(.*\)$', '\1', '');
