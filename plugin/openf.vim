if !exists('g:BasePath')
    let g:BasePath = expand("%:p:h")
endif
let g:testai=1
function! ChangeBasePath()
    echohl PmenuThumb
        echo "Base    Path:" . g:BasePath
        echo "Current Path:" . expand("%:p:h")
    echohl None
    echohl Question
        let l:new_base_path=input("New Base Path:")
    echohl None

    if empty(l:new_base_path)
        return 0
    endif

    let g:BasePath = l:new_base_path
endfunction

function FindGitRootDir()
    let l:gitDir=finddir(".git", ".;")
    if !empty(l:gitDir)
        let l:pathList=split(l:gitDir, "/")
        call remove(l:pathList, -1)
        let g:BasePath="/".join(l:pathList, "/")."/"
    endif
endfunction

function! OpenF()
    call FindGitRootDir()

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

    let l:fnList=split(l:filename, ":")
    let l:fnLine=0
    if(len(l:fnList)>=2)
        let l:filename = l:fnList[0]
        let l:fnLine = l:fnList[1]
    endif

    let l:file1 = l:current_path . "/" . l:filename
    let l:file2 = g:BasePath . "/" . l:filename
    let l:file3 = "/" . l:filename

    exec 'lcd /'

    if filereadable(l:file1)
        exec 'lcd ' . l:current_path
        exec 'badd ' . l:filename
        exec 'buffer ' . l:filename
        if l:fnLine!=0
            exec printf("%d", l:fnLine)
        endif
    elseif filereadable(l:file2)
        exec 'lcd ' . g:BasePath
        exec 'badd ' . l:filename
        exec 'buffer ' . l:filename
        if l:fnLine!=0
            exec printf("%d", l:fnLine)
        endif
    elseif filereadable(l:file3)
        exec 'badd ' . l:filename
        exec 'buffer ' . l:filename
        if l:fnLine!=0
            exec printf("%d", l:fnLine)
        endif
    else
        echohl WarningMsg
            echo "No Such File!!!"
        echohl None
    endif

    exec 'lcd ' . expand("%:p:h")
endfunction
