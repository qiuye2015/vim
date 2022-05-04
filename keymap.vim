"--------------------------------------
" flazz/vim-colorschemes 颜色主题集合
" chxuan/change-colorscheme 随心所欲切换主题
" norcalli/nvim-colorizer.lua 颜色着色器
" Yggdroot/indentLine 代码缩进线条
"--------------------------------------
"  colorscheme solarized8_dark
" :PreviousColorScheme    加载上一个主题
" :NextColorScheme        加载下一个主题
" :RandomColorScheme      随机加载主题
" :ShowColorScheme        显示当前主题
" :ColorizerToggle        打开关闭颜色着色器
" :IndentLinesToggle

"--------------------------------------
" vim-scripts/vim-gitgutter 显示git diff
" zivyangll/git-blame.vim 查看历史修改记录
"--------------------------------------
" GitGutterToggle
" GitGutterSignsToggle
" GitGutterLineHighlightsToggle

"--------------------------------------
" preservim/tagbar  显示文件标签
"--------------------------------------
" :NERDTree                 打开目录树
" :NERDTreeClose            关闭目录树
" :NERDTreeToggle           打开/关闭目录树
" :NERDTreeFind             打开目录树并定位到当前文件
" shift-i                   显示/关闭隐藏文件
"
"--------------------------------------
" vim-commentary Map
"--------------------------------------
" <普通模式>
" {count}gcc: 注释,或取消注释光标所在行. count 默认为1
" gcap: 注释整个段落
" <可视模式>
" gc: 注释,或取消注释选中行
"
"--------------------------------------
" syntastic Key Map
"--------------------------------------
" :SyntasticInfo [python]        查看是否有配置完成
" :SyntasticToggleMode           将Syntastic切换到被动模式,将禁用自动检查
" :SyntasticCheck                手动语法检查
" :lclose

let g:syntastic_is_open = 0
function! SyntasticToggle()
    if g:syntastic_is_open == 1
        lclose
        let g:syntastic_is_open = 0
    else
        Errors
        let g:syntastic_is_open = 1
    endif
endfunction

"--------------------------------------
" a.vim Key Map
"--------------------------------------
" :A        在新Buffer中切换到c/h文件
" :AS       横向分割窗口并打开c/h文件
" :AV       纵向分割窗口并打开c/h文件
" :AT       新建一个标签页并打开c/h文件
"
"--------------------------------------
" vim-markdown Key Map
"--------------------------------------
" :Toc      创建导航垂直窗口
" :Toch     创建导航水平窗口
" ]]        转到下一个标题
" [[        转到上一个标题
" zM        折叠所有内容
" zR        打开所有折叠
"
"--------------------------------------
" asyncrun.vim
"--------------------------------------
" :AsyncRun[!] [options] {cmd} ... 在后台执行你的命令(和传统的!命令类似)
" 当命令后跟随一个 ! 时，quickfix 将不会自动滚动

" :AsyncStop[!] 停止正在运行的任务
" 没有叹号时，使用 TERM 信号尝试终止后台任务，有叹号时会使用 KILL 信号来终止

"--------------------------------------
" asynctasks.vim
"--------------------------------------
" :AsyncTaskList    可用任务查询
" :AsyncTaskList!   查看所有任务(含.开头隐藏的任务名)
" :AsyncTaskMacro   查看宏展开
" :AsyncTaskEdit    编辑当前项目或者当前目录的.tasks 配置文件
" # run with interactive mode
" $ asynctask -i
" # use fzf to select tasks
" $ asynctask -f

"--------------------------------------
" vim-terminal-help
"--------------------------------------
" ALT-=                打开/关闭终端窗口(:terminal)
" ALT+SHIFT+hjkl       窗口切换
" ALT-q                终端中切换到normal模式，i/a进入insert模式
" drop xxx             通知到外层vim打开文件xxx
" tnoremap <m-q> <c-\><c-n>

"--------------------------------------
" puremourning/vimspector
"--------------------------------------
" VimspectorInstall

" F3  停止调试
" F4  使用相同的选项重新开始
" F5  开始/继续调试
" F6  暂停调试
" F8  增加断点
" F9  断点开关
" F10 步过
" F11 步入
" F12 步出

"==============================================================================
" 快捷键
"==============================================================================

nnoremap <silent> <c-u> :Mru<cr>
nnoremap <silent> <c-p> :call fzf#Open()<cr>
nnoremap <silent> <Leader>f :Ack!<Space>
" CTRL-]   直接在当前窗口里跳转到定义
" CTRL-W ] 用新窗口打开并查看光标下符号的定义
" CTRL-o   跳回之前位置
nnoremap <silent> <leader>t :TagbarToggle<cr>
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
nnoremap <silent> <leader>nf :NERDTreeFind<cr>
nnoremap <silent> <leader>l :IndentLinesToggle<cr>  " 打开关闭缩进线条
nnoremap <silent> <leader>g :GitGutterToggle<cr>
nnoremap <silent> <leader>gf :GitGutterFold<cr> "折叠没有改变的行,zr展开3行
nnoremap <silent> <leader>gb :<C-u>call gitblame#echo()<CR> " git-blame.vim
"" <vim-gitgutter> git区块之间跳转
" nmap ]c <Plug>GitGutterNextHunk
" nmap [c <Plug>GitGutterPrevHunk

" <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
" <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
" <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
" <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)

noremap <silent><F1> :call SyntasticToggle()<cr>            " F1：语法检查
" AsyncRun
" AsyncTask
noremap <silent><F2> :AsyncTask fjp-build<cr>               " F2：自定义编译
noremap <silent><F3> :AsyncTask fjp-run<cr>                 " F3：自定义运行
noremap <silent><F4> :AsyncTask file-build<cr>              " F4：编译单个文件
noremap <silent><F5> :AsyncTask file-run<cr>                " F5：运行单个文件
noremap <silent><F6> :AsyncTask project-init<cr>
noremap <silent><F7> :AsyncTask project-build<cr>           " F7：构建项目
noremap <silent><F8> :AsyncTask project-run<cr>             " F8：运行项目
noremap <silent><F9> :AsyncTask project-test<cr>            " F9：运行项目测试
noremap <silent><F10> :call asyncrun#quickfix_toggle(6)<cr> " F10:打开Quickfix窗口
" change-colorscheme
nnoremap <silent> <F11> :RandomColorScheme<cr>
inoremap <silent> <F11> <esc> :RandomColorScheme<cr>
nnoremap <silent> <F12> :ShowColorScheme<cr>
inoremap <silent> <F12> <esc> :ShowColorScheme<cr>

