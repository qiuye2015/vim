```bash
<F1>       # RandomColorScheme
<F2>       # ShowColorScheme

# base.vim  C-x|S-x|x
## noremap # :h Ctrl-b
<C-+>      # 当前行折叠打卡
<C-_>      # 递归折叠展开所有
<CTRL-]>   # 跳到定义
<C-A>      # 将数字加 1
<C-B>      # 上翻
<C-C>      # 复制/中断
<C-D>      # 下翻半屏（scroll）
<C-E>      # 目录树 Lexplore
<C-F>      # 下翻 （startofline）
<C-G>      # 显示整个目录下文件所有类型和函数声明 vim-go GoDeclsDir
<C-H>      # <C-W>h 选择vim窗口
<C-I>      # 跳转到新光标位置；
<C-J>      # <C-W>j 选择vim窗口
<C-K>      # <C-W>k 选择vim窗口
<C-L>      # <C-W>l 选择vim窗口
<C-M>
<C-N>      # :cnext
<C-O>      # 跳转到旧光标位置
<C-P>      # :cprevious
<C-Q>      # :cclose
<C-R>      # 重做 u撤回
<C-S>      # 替换当前单词
<C-T>      # 跳转到旧tag位置
<C-U>      # 上翻半屏
<C-V>      # 粘贴
<C-W>      # 轮询选择vim窗口
<C-X>      # 将数字减 1
<C-Y>
<C-Z>      # 挂起，退出vim; fg %num重新进入

<C-Up>     # 选择vim窗口
<C-Down>   # 选择vim窗口
<C-Left>   # 选择vim窗口
<C-Right>  # 选择vim窗口

<S-B>      # dark/light切换
<S-C>      # CocConfig
<S-L>      # list开关
<S-M>      # number关
<S-P>      # 复制模式开关
<S-R>      # CompileRun

## inoremap
<C-J>      # copilot#Accept
# <c-x><c-f> # 补全路径
# <c-x><c-k> # 单词补全
# <c-x><c-j> # 文件补全？
# <c-x><c-l> # 行补全？

## cnoremap
<C-a> <Home>
<C-e> <End>
<C-p> <Up>
<C-n> <Down>

## xnoremap
<
>

# plugins.vim leader-x|xx
## nnoremap
<leader>0             # AsyncTask
<leader>1             # AsyncTask 自定义编译
<leader>2             # AsyncTask 自定义运行
<leader>3             # AsyncTask cmake
<leader>4             # AsyncTask 构建项目make
<leader>5             # AsyncTask 运行项目make run
<leader>6             # AsyncTask 项目测试make test
<leader>7             # AsyncTask 编译单个文件
<leader>8             # AsyncTask 运行单个文件
<leader>9             # AsyncTask 打开Quickfix窗口

<leader>a             # ale触发/关闭语法检查
<leader>b             # GoBuild|GoTestCompile
<leader>c             # coc-clangd generate_compile_commands 同Gcmake
<leader>d             # vimspector 生成调试配置文件
<leader>di            # VimspectorBalloonEval
<leader>e             # NERDTreeToggle 目录树
<leader>f             # :Ag <C-R><C-W><CR> 搜索当前单词
<leader>fw            # :Ag <C-R><C-A><CR> 搜索当前单词 单独数字不可以
<leader>fa            # 同上
<leader>fb            # BLines
<leader>fc            # Commits
<leader>ff            # Files 同 <leader>p
<leader>fg            # GFiles
<leader>f?            # GFiles? git Untracked files
<leader>fh:           # 命令历史查询
<leader>fh/           # 搜索历史查询
<leader>fl            # Lines
<leader>ft            # Tags
<leader>g             # NERDTreeFind
<leader>gb            # git-blame
<leader>gc            # GoCoverageToggle
<leader>gd            # GoDoc
<leader>gf            # 折叠没有改变的行
<leader>gt            # git显示
<leader>gi            # GoInfo
<leader>gm            # GoMetaLinter
<leader>gr            # GoRun
<leader>gs            # GoDef horizontal
<leader>gt            # GoTest
<leader>gv            # GoDef vertical
<leader>h             # [fzf] Open files in horizontal
<leader>i
<leader>j
<leader>k
<leader>l             # 缩进线条
<leader>m             # mru 最近使用文件
<leader>n
<leader>o
<leader>p             # fzf 文件模糊搜索
<leader>q
<leader>r             # Choose color scheme
<leader>s             # 查看错误或警告的详细信息
<leader>t             # TagbarToggle
<leader>u             #
<leader>v             # [fzf] Open files in vertical
<leader>w             #
<leader>x             #
<leader>y             #
<leader>z             #

## inoremap
<c-x><c-f> fzf#vim#complete#path('fd')
<c-x><c-f> fzf#vim#complete#path('rg --files')
<c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
<c-x><c-k> <plug>(fzf-complete-word)
<c-x><c-f> <plug>(fzf-complete-path)
<c-x><c-j> <plug>(fzf-complete-file-ag)
<c-x><c-l> <plug>(fzf-complete-line)

# coc.vim      space-x
```

# registers

```bash
CTRL-F  the Filename under the cursor
CTRL-P  the Filename under the cursor, expanded with  'path' as in gf
CTRL-W  the Word under the cursor
CTRL-A  the WORD under the cursor;
CTRL-L  the line under the cursor
```
