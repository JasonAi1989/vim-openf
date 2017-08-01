function! OpenF()
    echohl WarningMsg
        echo "PATH:" . expand("%:p:h")
    echohl None
    echohl Question
        let l:filename=input("File Name:")
    echohl None
endfunction
