function! OpenF()
    echohl PmenuThumb
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
    else
        echohl WarningMsg
            echo "No Such File!!!"
        echohl None
    endif
endfunction
