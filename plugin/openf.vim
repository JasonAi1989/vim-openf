function! OpenF()
    echohl WarningMsg
        echo "PATH:" . expand("%:p:h")
    echohl None
    echohl Question
        let l:filename=input("File Name:")
    echohl None

    if empty(l:filename)
        echohl WarningMsg
            echo "No Such File!!!"
            return 0
        echohl None
    endif

    exec 'badd ' . l:filename
    exec 'buffer ' . l:filename
endfunction
