if exists('g:loaded_dwall') || &compatible
    finish
endif

let g:loaded_dwall=1
let s:dwall=expand(expand('<sfile>:p:h:h')).'/dwall'

function! Dwall(line1, line2, ...) range
    let buffer=join(getline(a:line1, a:line2), '\n')
    let args=join(a:000, ' ')
    let url=system('echo '.shellescape(buffer).' | '.shellescape(s:dwall).' '.args)
    echo substitute(url, '\n$', '', '')
endfunction

command! -nargs=? -range=% Dwall :call Dwall(<line1>, <line2>, <f-args>)
