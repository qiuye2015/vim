
" -----------------------------------------------------------------------------
"  ________      _____   _______      ____   ____   _____   ____    ____
" |_   __  |    |_   _| |_   __ \    |_  _| |_  _| |_   _| |_   \  /   _|
"   | |_ \_|      | |     | |__) |     \ \   / /     | |     |   \/   |
"   |  _|     _   | |     |  ___/       \ \ / /      | |     | |\  /| |
"  _| |_     | |__' |    _| |_           \ ' /      _| |_   _| |_\/_| |_
" |_____|    `.____.'   |_____|           \_/      |_____| |_____||_____|
"
" -----------------------------------------------------------------------------
"==============================================================================
"" 快捷键
"==============================================================================
let mapleader = ","
let maplocalleader="_"

:command! W w
:command! Q q
:command! Wq wq
:command! WQ wq
map <leader>0 :source $MYVIMRC<CR>       " 手动加载配置文件
map <leader>1 :set syntax=sh<CR>
map <leader>2 :set syntax=c<CR>
map <leader>3 :set syntax=cpp<CR>
map <leader>4 :set syntax=python<CR>
map <leader>5 :set syntax=cfg<CR>
map <leader>$ :syntax sync fromstart<CR> " 重新同步一下语法着色
map <leader>c :call ToggleCopy()<CR>

map W <C-w>w
map C :call s:generate_compile_commands()
map R :call CompileRun()<CR>
map tx :r !figlet
" 插入acscii 文字

nnoremap <C-n> :Lexplore<CR>
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<left><left> " find and replace
nnoremap <leader>nu :call <SID>NumberToggle()<CR>
nnoremap <leader>bg :call <SID>ToggleBackground()<CR>

" remap control + arrow key to select windows
noremap <C-Down>  <C-W>j
noremap <C-Up>    <C-W>k
noremap <C-Left>  <C-W>h
noremap <C-Right> <C-W>l
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

xnoremap < <gv
xnoremap > >gv

" 命令模式按键映射
cnoremap w!! w !sudo tee % >/dev/null                "  没加sudo导致无法保存时
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

map te :tabedit<CR>
map tl :-tabmove<CR>
map tr :+tabmove<CR>
map tn :+tabnext<CR>
map tp :-tabnext<CR>

map sr :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map sd :set splitbelow<CR>:split<CR>
map <s-up> :res -5<CR>
map <s-down> :res +5<CR>
map <s-left> :vertical resize -5<CR>
map <s-right> :vertical resize +5<CR>

" zM 递归折叠所有
" zR 递归展开所有

" zm 逐层折叠所有
" zr 逐层展开所有

" zi 打开/关闭所有折叠
" za 打开/关闭当前折叠
"
" zc 折叠当前行
" zo 打开当前折叠
" 用空格键来开关折叠
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nnoremap <C-z> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" Ctrl-Shift-_
nnoremap <C-_> @=((foldclosed(line('.')) < 0) ? 'zM' : 'zR')<CR>

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
"
set autoread                       " 文件在Vim之外修改过，自动重新读入
set hidden                         " 无需保存文件即可在 buffers 缓冲区之间切换
set helplang=cn                    " 设置中文帮助
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

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
"set paste                " 插入模式下粘贴内容,不会有任何变形;影响imap使用
set autoindent            " 自动缩进;和set paste不能同时出现;后配置的生效
set cindent               " c语言缩进风格
set smartindent           " 开启新行时使用智能自动缩进
filetype plugin indent on " 允许 Vim 自带脚本根据文件类型自动设置缩进等

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
set number         " 显示行号
set relativenumber " 显示相对行号
set wrap           " 一行内显示不下自动换行 nowrap
set linebreak      " 不会在单词内部折行,显示窗口比较小的时候折行展示
" set list           " 显示 TAB 键
set listchars=tab:+-,trail:-,nbsp:-,eol:$          " 替换tab空格字符
set scrolloff=5    " 垂直滚动时,光标距离顶部/底部的位置
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes " 总是显示侧边栏(用于显示 mark/gitdiff/诊断信息)
endif

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
" colorscheme pablo
" colorscheme solarized8_dark

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
" netrw
"==============================================================================
let g:netrw_winsize = 20
let g:netrw_liststyle = 3
let g:netrw_banner = 0
" let g:netrw_sort_by = 'time'
" let g:netrw_sort_direction = 'reverse'

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
	" 设置 vimrc 修改保存后立刻生效，不用在重新打开
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
	autocmd BufEnter * :syntax sync fromstart " 重新同步一下语法着色
	autocmd BufNewFile,BufRead *.conf set syntax=cfg
    " 高亮json注释
    autocmd FileType json syntax match Comment +\/\/.\+$+
endif

" 设置别名
function! SetupCommandAbbrs(from, to)
    exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Compile function
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        silent exec '!g++ % -o %<'
        exec '!time ./%<'
        silent exec '!rm ./%<'
    elseif &filetype == 'cpp'
        set splitbelow
        silent exec "!g++ -std=c++11 % -Wall -o %<"
        :term ./%<
        :res -10
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        " exec '!time python %'
        set splitbelow
        :term python3 %
        :res -10
    elseif &filetype == 'go'
        set splitbelow
        :term go run .
        :res -10
    endif
endfunc

function! s:NumberToggle()
    if(&number == 1) | set nu! | set rnu! | else | set rnu | set nu | endif
endfunction

function! s:ToggleBackground()
    if &background ==# 'light'
        set background=dark
    else
        set background=light
    endif
endfunction

" global variable
let g:copymode=0
" function
function ToggleCopy()
    if g:copymode
        set number
        set relativenumber
        set mouse=a
    else
        set nonumber
        set norelativenumber
        set mouse=v
    endif
    let g:copymode=!g:copymode
endfunction

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
" command! -nargs=0 Gcmake :call s:generate_compile_commands()
"==============================================================================
" 特定编程语言
"==============================================================================
augroup PythonTab
        au!
        " 如果你需要 python 里用 tab,那么反注释下面这行字,
        " 否则vim会在打开py文件时自动设置成空格缩进.
        " au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END


