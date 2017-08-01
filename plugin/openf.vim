function! OpenF()
    echohl WarningMsg
        echo "PATH:" . expand("%:p:h")
    echohl None
    echohl Question
        let l:filename=input("File Name:")
    echohl None

    if empty(l:filename)
        return 0
    endif

    if filereadable(l:filename)
        exec 'badd ' . l:filename
        exec 'buffer ' . l:filename
    endif
endfunction
