" lookupfile setting
""""""""""""""""""""""""""""""
" 最少输入2个字符才开始查找
let g:LookupFile_MinPatLength = 2               
" 不保存上次查找的字符串
let g:LookupFile_PreserveLastPattern = 0        
" 保存查找历史
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
" 回车打开第一个匹配项目
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
" 不允许创建不存在的文件
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
" 设置tag文件的名称
if filereadable("./filenametags")                "设置tag文件的名字
    let g:LookupFile_TagExpr = string('./filenametags')
endif
"映射LookupFile为,lk
nmap <silent> <leader>lk :LUTags<cr>
""映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '\c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo
        "Exception: " . v:exception |
        echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry

    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc' 

function! RunShell(Msg, Shell)
    echo a:Msg . '...'
    call system(a:Shell)
    echon 'done'
endfunction
nmap <F11>  :call RunShell("LookUpFile Tags", "/root/.vim/bundle/lookupfile-master/lookupfile_tags.sh .")<cr>
