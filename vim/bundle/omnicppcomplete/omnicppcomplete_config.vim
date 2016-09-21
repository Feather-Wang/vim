" 全局查找控制：0:(禁止),1:(允许，默认值)
let OmniCpp_GlobalScopeSearch = 1
" 命名空间查找控制：0:(禁止查找命名空间),1:(查找当前文件缓冲区内的命名空间，默认选项),2:(查找当前文件缓冲区和包含文件中的命名空间)
let OmniCpp_NamespaceSearch = 2
" 类成员显示控制(是否显示全部公有、私有、保护成员)：0:(自动),1:(显示所有成员)
let OmniCpp_DisplayMode = 1
" 控制匹配项所在域的显示位置，缺省情况下，总是将匹配项所在域信息显示在缩略信息最后一列：0:(信息缩略中不显示匹配项所在域，默认值),1:(显示匹配项所在域，并移除缩略信息中最后一列)
let OmniCpp_ShowScopeInAbbr = 0
" 是否是补全提示缩略信息中显示函数原型：0:(不显示，默认值),1:(显示原型)
let OmniCpp_ShowPrototypeInAbbr = 1
" 是否显示访问控制信息('+','-','#')。0:(显示，默认值),1:(不显示)
let OmniCpp_ShowAccess = 1
" 在'.'号后是否自动运行OmniCppComplete给出提示信息：0:,1:(默认值)
let OmniCPP_MayCompleteDot = 1
" 在'->'号后是否自动运行OmniCppComplete给出提示信息：0:,1:(默认值)
let OmniCpp_MayCompleteArray = 1
" 在域标识符"::"后是否自动运行OmniAppComplete给出提示信息。0:(默认值),1()
let OmniCpp_MayCompleteScope = 1    " 输入 :: 后自动补全
" 默认命名空间列表，项目间使用','隔开
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 是否自动选择第一个匹配项。仅当"completeopt"不为"longest"时有效：0:(不选择第一项，默认值),1:(选择第一项并插入到光标位置),2:(选择第一项但不插入光标位置)
let OmniCpp_SelectFirstItem = 2
" 使用Vim标准查找函数/本地查找函数。Vim内部用来在函数中查找变量定义的函数需要函数括号括起来位于文本的第一列，而本地查找函数不需要
let OmniCpp_LocalSearchDecl = 1

