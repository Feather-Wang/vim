" 关闭文件类型检测
filetype off

" 执行pathogen插件加载
execute pathogen#infect()

" 打开文件类型检测
filetype plugin indent on
"set ofu=syntaxcomplete#Complete

" 通用配置项
" 去掉vi一致性模式
set nocompatible
" 语法高亮
syntax on
" 设置配色方案
color evening

highlight Pmenu     ctermbg=white  ctermfg=black
highlight PmenuSel  ctermbg=lightgreen  ctermfg=black

" 设置打开文件时进行解码的猜测列表，文件编码没有百分百正确的判断方法，所以vim只能猜测文件编码
set fileencodings=utf-8,gb2312,gb18030,big5
" 当前文件的编码，也就是说，一个在vim里面已经正确显示了得文件(前提是你的系统环境跟你的enc设置匹配)，你可以通过改变fenc后再w来将此文件存成fenc指定的编码格式
set fenc=utf-8
" 用来显示的编码格式，不管最后的文件是什么编码格式的，vim都会将其转换为当前系统编码来进行处理，这样才能在当前系统里面正确地显示。
set enc=utf-8

" 突出显示当前行
set cursorline
"set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" 开启备份文件功能
set nobackup

" 设置背景颜色
"set background=dark
" 设置退格键可用
set backspace=indent,eol,start
" 设置命令缓存条数
set history=1000
" 总是显示状态行
set laststatus=2
" 设置状态行显示的信息
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
" 设置命令行的行数
set cmdheight=1
" 设置鼠标可用
set mouse=a
" 显示行号
set number
" 右下角显示光标坐标
set ruler
" 设置<<和>>的长度，<<和>>是左尖括号和右尖括号按两次
set shiftwidth=4
" 设置tab键的长度
set tabstop=4
" 设置tab键与空格的混合长度，前提是需要设置tabstop，当设置了该选项后，tab键的实际表现将为softtabstop的长度，实际是tab键的长度+(softtabstop-tabstop)个空格的长度，验证方法很简单，只需要修改tabstop的值，按下tab键的地方的长度也会跟着变化
set softtabstop=4
" 将制表符替换成空格，当设置了该选项后，tab键输出的将不会是制表符，而是同等长度的空格，这样就算用不同tabstop设置的vim打开，格式也不会乱
set expandtab
" 自动缩进
set autoindent

" 当输入右括号时，会查找匹配的左括号，并短暂的跳到左括号处，再回来
" set showmatch

" 语法折叠
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" 搜索
" 跟踪匹配到的第一个可匹配行
set incsearch
" 设置查找内容高亮
set hlsearch
" 查找匹配忽略大小写
set ignorecase


" 映射快捷键
function! RunShell(Msg, Shell)
    echo a:Msg . '...'
    call system(a:Shell)
    echon 'done'
endfunction
function! RunRelease()
    exec "w" 
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunction

function! RunDebug()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
    endi
    exec "!gdb ./%<"
endfunction
nmap <F2>   :TlistToggle<cr>
nmap <F3>   :NERDTreeToggle<cr>
nmap <F6>   :call RunRelease()<CR>
nmap <F7>   :call RunDebug()<CR>
nmap <F12>  :call RunShell("Generate tags", "ctags -R --sort=yes --fields=+iaS --extra=+q --language-force=C .")<cr>


""""""""""""""""""""""""""""" omnicppcomplete 配置
set completeopt=longest,menu
if !exists("$HOME/.vim/bundle/omnicppcomplete/omnicppcomplete_config.vim")
    source $HOME/.vim/bundle/omnicppcomplete/omnicppcomplete_config.vim
endif
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""" lookupfile 配置
if !exists("$HOME/.vim/bundle/lookupfile-master/lookupfile_config.vim")
    source $HOME/.vim/bundle/lookupfile-master/lookupfile_config.vim
endif


"""""""""""""""""""""""""""""" Buffer-Hint 配置
if !exists("$HOME/.vim/bundle/Buffer-Hint/Buffer_Hint_config.vim")
    source $HOME/.vim/bundle/Buffer-Hint/Buffer_Hint_config.vim
endif

"""""""""""""""""""""""""""""" indent_guides 配置
if !exists("$HOME/.vim/bundle/indentLine-master/indentLine_config.vim")
    source $HOME/.vim/bundle/indentLine-master/indentLine_config.vim
endif
