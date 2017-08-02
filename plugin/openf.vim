if !exists('g:BasePath')
    let g:BasePath = expand("%:p:h")
endif

function! OpenF()
    let l:current_path=expand("%:p:h")
    echohl PmenuThumb
        echo "Base    Path:" . g:BasePath
        echo "Current Path:" . l:current_path
    echohl None
    echohl Question
        let l:filename=input("File Name:")
    echohl None

    if empty(l:filename)
        return 0
    endif

    let l:file1 = l:current_path . "/" . l:filename
    let l:file2 = g:BasePath . "/" . l:filename
    let l:file3 = "/" . l:filename

    exec 'lcd /'

    if filereadable(l:file1)
        exec 'lcd ' . l:current_path
        exec 'badd ' . l:filename
        exec 'buffer ' . l:filename
    elseif filereadable(l:file2)
        exec 'lcd ' . g:BasePath
        exec 'badd ' . l:filename
        exec 'buffer ' . l:filename
    elseif filereadable(l:file3)
        exec 'badd ' . l:filename
        exec 'buffer ' . l:filename
    else
        echohl WarningMsg
            echo "No Such File!!!"
        echohl None
    endif

    exec 'lcd ' . expand("%:p:h")
endfunction
