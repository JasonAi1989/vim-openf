function! OpenF()
    echohl Normal
        let l:path=expand("%:p:h")
        echo l:path
    echohl None
    echohl Question
        let l:filename=input("file name")
    echohl None
endfunction
