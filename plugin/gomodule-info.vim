function! GoModuleName()
    let l:dir = fnamemodify(expand("%"), ":p:h")
    let l:c = 0
    while c<=1000
        let l:c += 1
        let l:go_mod = globpath(l:dir, "go.mod")
        if strlen(l:go_mod) == 0
            let l:dir =fnamemodify(l:dir, ":h")
        else
            let l:go_mod_path = l:dir . "/go.mod"
            for line in readfile(l:go_mod_path, '', 1)
                let l:arr = split(line, " ")
                if len(l:arr) == 2
                    return l:arr[1]
                end
            endfor
        end

        if l:dir == "/"
            break
        end
    endwhile
    return ""
endfunction
