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
function! s:generate_vimspector_conf()
  if empty(glob( '.vimspector.json' ))
    if &filetype == 'c' || 'cpp'
      !cp ~/.config/nvim/conf_vimspector/c.json ./.vimspector.json
    elseif &filetype == 'python'
      !cp ~/.config/nvim/conf_vimspector/python.json ./.vimspector.json
    endif
  endif
  e .vimspector.json
endfunction

"--------------------------------------
" coc-clangd
"--------------------------------------
" 生成C/C++文件索引符号
" .vscode==>coc-settings.json中的clangd.compilationDatabasePath
" compile_commands.json
function! s:generate_compile_commands()
    if empty(glob( 'CMakeLists.txt'))
        echo "Can't find CMakeLists.txt"
        return
    endif
    if empty(glob('.vscode'))
        execute 'silent !mkdir .vscode'
    endif
    execute '!cmake -DCMAKE_BUILD_TYPE=debug -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B .vscode'
endfunction

"==============================================================================
" 快捷键
"==============================================================================

" CTRL-]   直接在当前窗口里跳转到定义
" CTRL-W ] 用新窗口打开并查看光标下符号的定义
" CTRL-T   Jump to older entry in the tag stack
" CTRL-O   Go to Older cursor position in jump list
" CTRL-I   Go to Newer cursor position in jump list
nnoremap <silent> <leader>u :Mru<cr>
nnoremap <silent> <leader>p :call fzf#Open()<cr>
nnoremap <silent> <leader>f :Ack!<Space>
nnoremap <silent> <leader>t :TagbarToggle<cr>
nnoremap <silent> <leader>e :NERDTreeToggle<cr>
nnoremap <silent> <leader>n :NERDTreeFind<cr>
nnoremap <silent> <leader>s :call SyntasticToggle()<cr>     " 打开/关闭语法检查
nnoremap <silent> <leader>l :IndentLinesToggle<cr>          " 打开/关闭缩进线条
nnoremap <silent> <leader>gt :GitGutterToggle<cr>           " git显示
nnoremap <silent> <leader>gf :GitGutterFold<cr>             " 折叠没有改变的行,zr展开3行
nnoremap <silent> <leader>gb :<C-u>call gitblame#echo()<CR> " git-blame.vim
" <vim-gitgutter> git区块之间跳转
" nmap ]c <Plug>GitGutterNextHunk
" nmap [c <Plug>GitGutterPrevHunk

" <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
" <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
" <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
" <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)

" AsyncRun
" AsyncTask
noremap <leader>0 :AsyncTask<space>
noremap <leader>1 :AsyncTask fjp-build<cr>               " 自定义编译
noremap <leader>2 :AsyncTask fjp-run<cr>                 " 自定义运行
noremap <leader>3 :AsyncTask project-init<cr>            " cmake
noremap <leader>4 :AsyncTask project-build<cr>           " 构建项目make
noremap <leader>5 :AsyncTask project-run<cr>             " 运行项目make run
noremap <leader>6 :AsyncTask project-test<cr>            " 项目测试make test
noremap <leader>7 :AsyncTask file-build<cr>              " 编译单个文件
noremap <leader>8 :AsyncTask file-run<cr>                " 运行单个文件
noremap <leader>9 :call asyncrun#quickfix_toggle(6)<cr>  " 打开Quickfix窗口
" change-colorscheme
nnoremap <silent> <F1> :RandomColorScheme<cr>
inoremap <silent> <F1> <esc> :RandomColorScheme<cr>
nnoremap <silent> <F2> :ShowColorScheme<cr>
inoremap <silent> <F2> <esc> :ShowColorScheme<cr>
" puremourning/vimspector
" F3  停止调试
" F4  使用相同的选项重新开始
" F5  开始/继续调试
" F6  暂停调试
" F8  增加断点
" F9  断点开关
" F10 步过
" F11 步入
" F12 步出
nmap <Leader>v <Plug>VimspectorBalloonEval
xmap <Leader>v <Plug>vimspectorBalloonEval
command! -nargs=0 Gvimspector :call s:generate_vimspector_conf()
nnoremap <leader>d :call s:generate_vimspector_conf()

" coc-clangd
command! -nargs=0 Gcmake :call s:generate_compile_commands()
nnoremap <leader>g :call s:generate_compile_commands()


