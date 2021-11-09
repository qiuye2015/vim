
" -----------------------------------------------------------------------------
"  ________      _____   _______      ____   ____   _____   ____    ____
" |_   __  |    |_   _| |_   __ \    |_  _| |_  _| |_   _| |_   \  /   _|
"   | |_ \_|      | |     | |__) |     \ \   / /     | |     |   \/   |
"   |  _|     _   | |     |  ___/       \ \ / /      | |     | |\  /| |
"  _| |_     | |__' |    _| |_           \ ' /      _| |_   _| |_\/_| |_
" |_____|    `.____.'   |_____|           \_/      |_____| |_____||_____|
"
" -----------------------------------------------------------------------------
"
" 最近使用文件          <lvht/mru> Most Recently Used
" 模糊搜索              <epii1/fzf>是<junegunn/fzf>的精简版,同ctrlp
" 全局搜索文件          <mileszs/ack.vim>
" 快速文件切换.c ->.h   <vim-scripts/a.vim>
" 显示文件标签          <preservim/tagbar> eg:类|结构体|函数|变量等
" 显示树形目录          <preservim/nerdtree>
" 显示git状态在nerdtree <Xuyuanp/nerdtree-git-plugin>
" git diff显示          <vim-scripts/vim-gitgutter>
" 文本对齐              <godlygeek/tabular>,同vim-easy-align,vim-markdown依赖
" 语法高亮md            <plasticboy/vim-markdown>

" 状态栏美化            <vim-airline/vim-airline>
" 主题                  <vim-airline/vim-airline-themes>
" 24bit真彩色配色方案   <jacoborus/tender.vim>
" 配色方案集合          <flazz/vim-colorschemes>
" 颜色着色器            <norcalli/nvim-colorizer.lua>仅适用Neovim
"
" 代码缩进线条          <Yggdroot/indentLine>
" 快速注释代码          <tpope/vim-commentary>,同tcomment_vim,nerdcommenter
" 自动补全括号、引号    <jiangmiao/auto-pairs>,同delimitMate
" 语法检查              <vim-syntastic/syntastic>,ale性能更好
" 自动生成tags          <ludovicchabant/vim-gutentags>
" 异步运行shell指令     <skywind3000/asyncrun.vim>
" 现代化的构建任务系统  <skywind3000/asynctasks.vim>;AsyncRun 助手

" go开发插件            <fatih/vim-go>
" c++高亮               <octol/vim-cpp-enhanced-highlight>

"------------------------------------------------------------------------------
" NERDTree Map
"------------------------------------------------------------------------------
" :NERDTree                 打开目录树
" :NERDTreeClose            关闭目录树
" :NERDTreeToggle           打开/关闭目录树
" :NERDTreeFind             打开目录树并定位到当前文件
" shift-i                   显示/关闭隐藏文件
" let NERDTreeShowHidden=1  可在打开时默认显示隐藏文件
"
"------------------------------------------------------------------------------
" a.vim Key Map
"------------------------------------------------------------------------------
" :A        在新Buffer中切换到c/h文件
" :AS       横向分割窗口并打开c/h文件
" :AV       纵向分割窗口并打开c/h文件
" :AT       新建一个标签页并打开c/h文件
"
"------------------------------------------------------------------------------
" vim-markdown Key Map
"------------------------------------------------------------------------------
" :Toc      创建导航垂直窗口
" :Toch     创建导航水平窗口
" ]]        转到下一个标题
" [[        转到上一个标题
" zM        折叠所有内容
" zR        打开所有折叠
"
"------------------------------------------------------------------------------
" vim-commentary Map
"------------------------------------------------------------------------------
" <普通模式>
" {count}gcc: 注释,或取消注释光标所在行. count 默认为1
" gcap: 注释整个段落
" <可视模式>
" gc: 注释,或取消注释选中行
"
"------------------------------------------------------------------------------
" syntastic Key Map
"------------------------------------------------------------------------------
" :SyntasticInfo [python]        查看是否有配置完成
" :SyntasticToggleMode           将Syntastic切换到被动模式,将禁用自动检查
" :SyntasticCheck                手动语法检查
" :lclose
"
"------------------------------------------------------------------------------
" nvim-colorizer.lua Key Map
"------------------------------------------------------------------------------
" :ColorizerToggle               切换当前缓冲区的高亮显示
"
"------------------------------------------------------------------------------
" vim-gitgutter Key Map
"------------------------------------------------------------------------------
" GitGutterToggle                关闭/打开vim-gitgutter
" GitGutterLineHighlightsToggle  高亮显示
"
"------------------------------------------------------------------------------
" ctags
"------------------------------------------------------------------------------
" CTRL-]   直接在当前窗口里跳转到定义
" CTRL-W ] 用新窗口打开并查看光标下符号的定义

"------------------------------------------------------------------------------
" asyncrun.vim
"------------------------------------------------------------------------------
" :AsyncRun[!] [options] {cmd} ... 在后台执行你的命令(和传统的!命令类似)
" 当命令后跟随一个 ! 时，quickfix 将不会自动滚动

" :AsyncStop[!] 停止正在运行的任务
" 没有叹号时，使用 TERM 信号尝试终止后台任务，有叹号时会使用 KILL 信号来终止

" F2：搜索字符
" F4：编译单个文件
" F5：运行单个文件
" F6：运行项目测试
" F7：构建项目
" F8：运行项目
" F9：使用 cmake 更新 Makefile
" F10：切换快速修复窗口

"------------------------------------------------------------------------------
" asyncrun.vim
"------------------------------------------------------------------------------
" :AsyncTaskList    可用任务查询
" :AsyncTaskList!   查看所有任务(含.开头隐藏的任务名)
" :AsyncTaskMacro   查看宏展开
" :AsyncTaskEdit    编辑当前项目或者当前目录的.tasks 配置文件
" # run with interactive mode
" $ asynctask -i
" # use fzf to select tasks
" $ asynctask -f

""==============================================================================
"" 快捷键
""==============================================================================
"let mapleader = ","

nnoremap <silent> <c-u> :Mru<cr>
nnoremap <silent> <c-p> :call fzf#Open()<cr>
nnoremap <silent> <leader>t :TagbarToggle<cr>
nnoremap <silent> <leader>e :NERDTreeToggle<cr>
nnoremap <silent> <leader>f :NERDTreeFind<cr>
" 打开关闭缩进线条
nnoremap <silent> <leader>l :IndentLinesToggle<cr>
"" <vim-gitgutter> git区块之间跳转
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" " AsyncRun
" " Compile and run a single file
" nnoremap <silent> <F4> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
" " Build C/C++ projects
" let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
" nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
" nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
" nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
" nnoremap <silent> <F9> :AsyncRun -cwd=<root> cmake . <cr>
" " F10 to toggle quickfix window
" nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
" if has('win32') || has('win64')
"     noremap <silent><F2> :AsyncRun! -cwd=<root> findstr /n /s /C:"<C-R><C-W>" 
"             \ "\%CD\%\*.h" "\%CD\%\*.c*" <cr>
" else
"     noremap <silent><F2> :AsyncRun! -cwd=<root> grep -n -s -R <C-R><C-W> 
"             \ --include='*.h' --include='*.c*' '<root>' <cr>
" endif

" 设置 F10 打开/关闭 Quickfix 窗口
noremap <silent><F10> :call asyncrun#quickfix_toggle(6)<cr>

" AsyncTask
noremap <silent><F4> :AsyncTask file-build<cr>
noremap <silent><F5> :AsyncTask file-run<cr>
noremap <silent><F6> :AsyncTask make<cr>
noremap <silent><F7> :AsyncTask emake<cr>
noremap <silent><F8> :AsyncTask emake-exe<cr>

noremap <silent><s-f4> :AsyncTask project-build<cr>
noremap <silent><s-f5> :AsyncTask project-run<cr>
noremap <silent><s-f6> :AsyncTask project-test<cr>
noremap <silent><s-f7> :AsyncTask project-init<cr>
noremap <silent><s-f8> :AsyncTask project-install<cr>

"==============================================================================
" 基础配置
"==============================================================================
set nocompatible                   " 去除VI一致性,必须(禁用 vi 兼容模式)
set nobackup                       " 禁止生成临时文件;不创建备份文件
set noswapfile                     " 禁用交换文件
set noundofile                     " 禁用 undo文件
set history=400                    " 设置VIM记录的历史数
set wildmenu                       " 启用增强模式的命令行补全
" 点击Tab键,将显示可能匹配的文件列表,并使用最长的子串进行补全
set wildmode=longest:list,full
set backspace=indent,eol,start     " 插入状态使用Backspace或者Delete删除回车符
"set backspace=2 同上; indent缩进,eol行尾,start刚开始插入

"==============================================================================
" 编码设置
"==============================================================================
set ffs=unix,dos,mac    " 设置文件类型 Use Unix as the standard file type
set encoding=utf-8      " (enc)vim内部使用的编码,包括文件内容,寄存器等
set fileencoding=utf-8  " (fenc)检测到的文件编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,latin-1 
" 打开文件时自动尝试下面顺序的编码,如果执行成功,则该编码为文件编码
" 并设置fileencoding

"==============================================================================
" 搜索设置
"==============================================================================
set hlsearch     " 高亮搜索内容
set incsearch    " 查找输入时动态增量显示查找结果
set ignorecase   " 搜索时忽略大小写
set smartcase    " 智能搜索大小写判断,默认忽略大小写,除非搜索内容包含大写字母

"==============================================================================
" 缩进模式
"==============================================================================
set ts=4                  " 制表符(tabstop)的长度是 4
set sw=4                  " 缩进代码时的缩进量(shiftwidth)为 4
set expandtab             " 输入tab时自动将其转化为空格(et);set noet(禁止)
set softtabstop=4         " 如果设置了expandtab那么展开tab为多少字符
set smarttab              " 使用et将Tab替换为空格之后;按Backspace就删除4个空格
set paste                 " 插入模式下粘贴内容,不会有任何变形;
set autoindent            " 自动缩进;和set paste不能同时出现;后配置的生效
set cindent               " c语言缩进风格
set smartindent           " 开启新行时使用智能自动缩进
filetype plugin indent on " 允许 Vim 自带脚本根据文件类型自动设置缩进等
augroup PythonTab
        au!
        " 如果你需要 python 里用 tab,那么反注释下面这行字,
        " 否则vim会在打开py文件时自动设置成空格缩进. 
        " au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END

"==============================================================================
" 静音模式
"==============================================================================
set noerrorbells        " 不让vim发出讨厌的滴滴声
set novisualbell        " 不要闪烁
set t_vb=               " 置空错误铃声的终端代码,同noerrorbells
set mouse-=a            " 鼠标右键粘贴而不是进入visual模式;set mouse=a

"==============================================================================
" 代码折叠
"==============================================================================
set foldenable          " 允许代码折叠
set foldmethod=indent   " 按缩进折叠;syntax 语法折叠;manual 手动折叠
set foldlevelstart=99   " 打开文件是默认不折叠代码

"==============================================================================
" vimdiff
"==============================================================================
" diff算法
" internal             使用内部比较库
" indent-heuristic     内部比较库使用缩进启发
" algorithm:{}         内部比较引擎使用指定的比较算法
"                      myers      缺省算法
"                      minimal    花费额外时间来生成最小的可能差异
"                      patience   耐心差异比较算法
"                      histogram  直方图差异比较算法
set diffopt+=internal,indent-heuristic,algorithm:patience

" if &diff
"     set diffopt+=iwhite " 限定在 vimdiff 模式,忽略白空格的变化
" endif

"==============================================================================
" 代码补全
"==============================================================================
" 插入模式的补全
" menuone  即使只有一个匹配,也使用弹出菜单
" noinsert 不插入任何匹配的文本,直到用户从菜单里选择一个匹配为止
" noselect 不自动选择菜单里的匹配,强迫用户从菜单中选择
set completeopt=menuone,noinsert,noselect

"==============================================================================
" 显示设置
"==============================================================================
set showmatch      " 显示匹配的括号
set matchtime=2    " 显示括号匹配的时间
set number         " 显示行号 relativenumber 相对行号
set wrap           " 一行内显示不下自动换行 nowrap
set linebreak      " 不会在单词内部折行,显示窗口比较小的时候折行展示
set list           " 显示 TAB 键
set listchars=tab:+-,trail:-,nbsp:-,eol:$          " 替换tab空格字符
set signcolumn=yes " 总是显示侧边栏(用于显示 mark/gitdiff/诊断信息)

"==============================================================================
" 状态栏设置
"==============================================================================
set ruler         " 右下角显示当前光标所在行列
set cmdheight=2   " 命令行(在状态行下)的高度,默认为1,这里是2
set laststatus=2  " 是否显示状态栏. 0表示不显示,1表示只在多窗口时显示,2表示显示
" 定制状态行
set statusline=[%F]%y%r%m%*[FORMAT=%{&ff}]%=[Line:%l,Column:%c][%p%%]

"==============================================================================
" 主题设置
"==============================================================================
" colorscheme的缩写为color
" :color         打印当前使用的颜色主题
" :color {name}  加载name主题,搜索路径为"colors/{name}.(vim|lua)"
" 配色语法:
" hi       列出当前所有的高亮配置
" hi clear 移除用户定义的高亮
"
" :hi[ghlight] [default] {group-name} {key}={arg} ..
" group-name取值如下: StatusLine,ColorColumn,Todo...
" key取值如下,开启termguicolors24位真彩色后以gui版本为准:
"   term       黑白终端的属性
"   cterm      彩色终端的属性
"   ctermfg    彩色终端的前景色
"   ctermbg    彩色终端的背景色
"   gui        GUI 版本属性
"   guifg      GUI 版本的前景色
"   guibg      GUI 版本的背景色

" NR-16 要求t_Co>=16,NR-8用在t_Co<16,对于16色ansi-styleh终端,*意味着加8
" cterm-colors
" NR-16   NR-8    COLOR NAME
" 0       0       Black
" 1       4       DarkBlue
" 2       2       DarkGreen
" 3       6       DarkCyan
" 4       1       DarkRed
" 5       5       DarkMagenta
" 6       3       Brown, DarkYellow
" 7       7       LightGray, LightGrey, Gray, Grey
" 8       0*      DarkGray, DarkGrey
" 9       4*      Blue, LightBlue
" 10      2*      Green, LightGreen
" 11      6*      Cyan, LightCyan
" 12      1*      Red, LightRed
" 13      5*      Magenta, LightMagenta
" 14      3*      Yellow, LightYellow
" 15      7*      White

set t_Co=256        " 启用256色,共2的8次方(256)种颜色

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
  set termguicolors " 开启24位真彩色;共2的24次方种颜色
endif

set background=dark        " 设置黑色背景<light>必须在<syntax enable>命令前调用
if !exists("g:syntax_on")  " 只让语法高亮设置一次
    syntax enable          " 区别:syntax on会覆盖当前对语法高亮的更改
endif

set cursorline                           " 突出显示当前行
set cursorcolumn                         " 突出显示当前列
set colorcolumn=80                       " 80列显示垂直线
hi ColorColumn ctermbg=blue guibg=blue   " 垂直线颜色

" 设置颜色主题,会在所有 runtimepaths 的 colors 目录寻找同名配置
colorscheme solarized8_dark

" color tender " 设置主题
" " tender 默认背景色是一种亮灰色,晚上特别不舒服,改成纯黑
" hi Normal guibg=#000001
" " 改背景后选中区域无法高亮,也得调一下
" hi Visual guibg=#323232
" hi SignColumn guibg=#000001
" " 灰色的状态栏很扎眼,调一下
" hi StatusLine guibg=#444444 guifg=#b3deef
" " vim 的 terminal 状态栏需要单独配置
" hi StatusLineTerm guibg=#444444 guifg=#b3deef
" hi StatusLineTermNC guibg=#444444 guifg=#999999

"==============================================================================
" 插件设置
"==============================================================================

let g:airline#extensions#tabline#enabled = 1    " 开启tab栏
" set airline theme
" let g:airline_theme = 'tender'  " AirlineTheme simple

" let g:airline_solarized_bg='dark'
" let g:airline_theme = 'solarized'  " AirlineTheme simple

" -----------------------------------------------------------------------------

let g:NERDTreeMinimalUI = 1 " 不显示帮助信息
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize=24

" -----------------------------------------------------------------------------

let g:tagbar_compact = 1 " 不显示帮助信息
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_width = 30
" let g:tagbar_autofocus = 1 " 光标在tagbar页面内

" -----------------------------------------------------------------------------

let g:AutoPairsFlyMode = 1

" -----------------------------------------------------------------------------

if executable('ag') " 如果有ag的情况下,使用ag而不是使用ack
  let g:ackprg = 'ag --vimgrep'
endif

"-----------------------------------------------------------------------------

" lua require'colorizer'.setup() " 同下

lua <<EOF
-- Attaches to every FileType mode
require 'colorizer'.setup()
EOF

" -----------------------------------------------------------------------------

let g:gitgutter_enabled = 0 " 默认关闭 vim-gitgutter
let g:gitgutter_highlight_lines = 1 " 默认开启行高亮
let g:gitgutter_realtime = 0 " 准确性来换取速度
let g:gitgutter_eager = 0

let g:gitgutter_sign_added = 'xx'
let g:gitgutter_sign_modified = 'yy'
let g:gitgutter_sign_removed = 'zz'
let g:gitgutter_sign_modified_removed = 'ww'

" -----------------------------------------------------------------------------

let g:vim_markdown_folding_disabled = 0         " 禁用md折叠
let g:vim_markdown_toc_autofit = 1              " 启用TOC窗口自动拟合
let g:vim_markdown_folding_level = 6            " 设置标题折叠级别 1-6
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_fenced_languages = ['csharp=cs'] " 屏蔽代码块语言

" -----------------------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1 " 总是打开Location List窗口
" syntastic_auto_loc_list 自动打开Locaton List
" 0表示关闭自动打开和自动关闭,
" 1表示自动打开自动关闭,
" 2表示发现错误时不自动打开,当修正以后没有再发现错误时自动关闭(默认值)
" 3表示自动打开,但不自动关闭
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1  " 是否在打开文件时检查
let g:syntastic_check_on_wq = 0    " 是否在保存文件后检查,卡顿,置为1
let g:syntastic_error_symbol='✗'   " 设置错误符号
let g:syntastic_warning_symbol='⚠' " 设置警告符号
" 让syntastic支持C++11
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++11'

" -----------------------------------------------------------------------------

let g:go_fmt_command = "goimports" " 保存时自动运行goimports;gofmt,goimports,gopls

" let g:go_fmt_fail_silently = 0     " quickfix列表中显示错误信息,1为关闭显示
" let g:go_highlight_types = 1       " 0为有限的Go语法高亮,太卡设为0
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_build_constraints = 1
" autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

" -----------------------------------------------------------------------------

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
" let g:cpp_experimental_template_highlight = 1 " 比上一个更快,但易出错
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

" -----------------------------------------------------------------------------

" 把tag文件的名字从tags换成了.tags,不容易污染当前项目的文件,删除时也好删除
" 前半部分"./.tags;" 代表在文件的所在目录下(不是":pwd"返回的Vim当前目录"查找名字
" 为".tags"的符号文件,后面一个分号代表查找不到的话向上递归到父目录,
" 直到找到 .tags 文件或者递归到了根目录还没找到
" 逗号分隔的后半部分".tags" 是指同时在Vim的当前目录
" (":pwd"命令返回的目录,可以用:cd ..命令改变)下面查找".tags"文件
set tags=./.tags;,.tags

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
if has('win32') || has('win16') || has('win64') || has('win95')
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
endif
" 禁用gutentags自动加载gtags数据库
let g:gutentags_auto_add_gtags_cscope = 0

" -----------------------------------------------------------------------------
" automatically open quickfix window when AsyncRun command is executed
" set the quickfix window 6 lines height.
let g:asyncrun_open = 6 " :copen 手动打开quickfix窗口

" ring the bell to notify you job finished
let g:asyncrun_bell = 1


" let g:asynctasks_extra_config = [
"     \ '~/.config/nvim/my_tasks.ini',
"     \ ]

" -----------------------------------------------------------------------------

"==============================================================================
" 自定义
"==============================================================================
" vim记住上次编辑和浏览位置
" Only do this part when compiled with support for autocommands
if has("autocmd")
	" In text files, always limit the width of text to 78 characters
	" autocmd BufRead *.txt set tw=78
	" When editing a file, always jump to the last cursor position
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"------------------------------------------------------------------------------
" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
"------------------------------------------------------------------------------
if &term =~ '256color' && $TMUX != ''
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

" 修正 ScureCRT/XShell 以及某些终端乱码问题，主要原因是不支持一些
" 终端控制命令，比如 cursor shaping 这类更改光标形状的 xterm 终端命令
" 会令一些支持 xterm 不完全的终端解析错误，显示为错误的字符，比如 q 字符
" 如果你确认你的终端支持，不会在一些不兼容的终端上运行该配置，可以注释
if has('nvim')
    set guicursor=
elseif (!has('gui_running')) && has('terminal') && has('patch-8.0.1200')
    let g:termcap_guicursor = &guicursor
    let g:termcap_t_RS = &t_RS
    let g:termcap_t_SH = &t_SH
    set guicursor=
    set t_RS=
    set t_SH=
endif

"==============================================================================
" END
"==============================================================================

