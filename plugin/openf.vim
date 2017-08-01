function! OpenF()
    echohl Normal
        let l:path=expand("%:p:h")
        echo l:path
    echohl None
endfunction
