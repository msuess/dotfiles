if exists("b:did_ftplugin")
    finish
endif

if &cp || exists( 'g:clojurescript_ftplugin_loaded' )
    finish
endif

let g:clojurescript_ftplugin_loaded = 1

function! CljsEval (text)
    call s:CljsSend(a:text)
endfunction

function! s:CljsSend (text)
    call Send_to_Tmux(a:text)
endfunction

function! s:GetSelection ()
    return getreg('"s')
endfunction

function! CljsEvalForm ()
    let oldpos  = getpos('.')
    let oldmode = mode()

    silent normal! [("cy%

    let form = getreg('"c')

    call CljsEval(form . "\n")

    call setpos('.', oldpos)
    call mode(oldmode)
endfunction

function! CljsEvalSelection ()
    call CljsEval(call s:GetSelection())
endfunction


" mappings -------------------------------------------------------

map <buffer> <leader>e :call CljsEvalForm()<cr>
vmap <buffer> <leader>e :call CljsEvalSelection()<cr>
