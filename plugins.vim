
" -----------------------------------------------------------------------------
"  ________      _____   _______      ____   ____   _____   ____    ____
" |_   __  |    |_   _| |_   __ \    |_  _| |_  _| |_   _| |_   \  /   _|
"   | |_ \_|      | |     | |__) |     \ \   / /     | |     |   \/   |
"   |  _|     _   | |     |  ___/       \ \ / /      | |     | |\  /| |
"  _| |_     | |__' |    _| |_           \ ' /      _| |_   _| |_\/_| |_
" |_____|    `.____.'   |_____|           \_/      |_____| |_____||_____|
"
" -----------------------------------------------------------------------------
" 配色方案集合          <flazz/vim-colorschemes>
" 随心所欲切换主题      <chxuan/change-colorscheme>
" 颜色着色器            <norcalli/nvim-colorizer.lua>仅适用Neovim
" 状态栏美化            <vim-airline/vim-airline>
" 主题                  <vim-airline/vim-airline-themes>
"
" 代码缩进线条          <Yggdroot/indentLine>
" 显示树形目录          <preservim/nerdtree>
" 显示git状态在nerdtree <Xuyuanp/nerdtree-git-plugin>
" 显示git diff          <vim-scripts/vim-gitgutter>
" 显示文件标签          <preservim/tagbar> eg:类|结构体|函数|变量等
" 自动生成tags          <ludovicchabant/vim-gutentags>
" 自动补全括号、引号    <jiangmiao/auto-pairs>,同delimitMate
" 显示并修复（删除）尾部的空格                <bronson/vim-trailing-whitespace>
"
" 最近使用文件          <lvht/mru> Most Recently Used
" 模糊搜索              <epii1/fzf>是<junegunn/fzf>的精简版,同ctrlp
" 全局搜索文件          <mileszs/ack.vim>
"
" 语法检查              <vim-syntastic/syntastic>,ale性能更好
" 快速注释代码          <tpope/vim-commentary>,同tcomment_vim,nerdcommenter
" 代码片段              <honza/vim-snippets>
" 异步运行shell指令     <skywind3000/asyncrun.vim>
" 现代化的构建任务系统  <skywind3000/asynctasks.vim>;AsyncRun 助手
" 封装内置终端          <skywind3000/vim-terminal-help>
" debug工具             <puremourning/vimspecto>

" go开发插件            <fatih/vim-go>
" c++高亮               <octol/vim-cpp-enhanced-highlight>
" 快速文件切换.c ->.h   <vim-scripts/a.vim>

" 语法高亮md            <plasticboy/vim-markdown>
" 文本对齐              <godlygeek/tabular>,同vim-easy-align,vim-markdown依赖
"
"==============================================================================
" 插件设置
"==============================================================================
lua <<EOF
-- Attaches to every FileType mode
require 'colorizer'.setup()
EOF
" lua require'colorizer'.setup() " 同上

let g:airline#extensions#tabline#enabled = 1    " 开启tab栏
" let g:airline_solarized_bg='dark'
" let g:airline_theme = 'solarized'  " AirlineTheme simple

" -----------------------------------------------------------------------------
let g:NERDTreeMinimalUI = 1 " 不显示帮助信息
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize=24
let NERDTreeShowHidden=1   " 可在打开时默认显示隐藏文件
" let NERDTreeWinPos="right" " 默认为左侧

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" -----------------------------------------------------------------------------
let g:gitgutter_enabled = 0 " 默认关闭 vim-gitgutter
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 1 " 默认开启行高亮
let g:gitgutter_realtime = 0 " 准确性来换取速度
let g:gitgutter_eager = 0

let g:gitgutter_sign_added = 'xx'
let g:gitgutter_sign_modified = 'yy'
let g:gitgutter_sign_removed = 'zz'
let g:gitgutter_sign_modified_removed = 'ww'

" -----------------------------------------------------------------------------
let g:tagbar_compact = 1 " 不显示帮助信息
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_width = 30
" let g:tagbar_autofocus = 1 " 光标在tagbar页面内

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
let g:AutoPairsFlyMode = 1

" -----------------------------------------------------------------------------
if executable('ag') " 如果有ag的情况下,使用ag而不是使用ack
  let g:ackprg = 'ag --vimgrep'
endif
" 加上!，禁止跳到第一个搜索结果; cnoreabbrev 缩写
cnoreabbrev Ack Ack!
let g:ackhighlight = 1 " 高亮搜索关键词

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
" let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"

" -----------------------------------------------------------------------------
" automatically open quickfix window when AsyncRun command is executed
" set the quickfix window 6 lines height.
let g:asyncrun_open = 6 " :copen 手动打开quickfix窗口
" ring the bell to notify you job finished
let g:asyncrun_bell = 1
let g:asyncrun_rootmarks = ['.git', '.svn', '.root', '.project', '.hg']
" let g:asynctasks_rtp_config = "tasks.ini"
let g:asynctasks_extra_config = [
    \ '~/.config/nvim/tasks.ini',
    \ ]
" output=terminal
let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_term_rows = 10    " set height for the horizontal terminal split
let g:asynctasks_term_cols = 80    " set width for vertical terminal split


" -----------------------------------------------------------------------------
let g:terminal_key = '<m-=>'
let g:terminal_height = 11

" -----------------------------------------------------------------------------
let g:vimspector_enable_mappings = 'HUMAN'

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

command! -nargs=0 Gvimspector :call s:generate_vimspector_conf()

nmap <Leader>v <Plug>VimspectorBalloonEval
xmap <Leader>v <Plug>vimspectorBalloonEval

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

"-----------------------------------------------------------------------------
let g:vim_markdown_folding_disabled = 0         " 禁用md折叠
let g:vim_markdown_toc_autofit = 1              " 启用TOC窗口自动拟合
let g:vim_markdown_folding_level = 6            " 设置标题折叠级别 1-6
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_fenced_languages = ['csharp=cs'] " 屏蔽代码块语言


" -----------------------------------------------------------------------------
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
" highlight CopilotSuggestion guifg=#555555 ctermfg=8
" :Copilot status
" :Copilot disable
" :Copilot enable

"------------------------------------------------------------------------------
" 需要的时候加载插件，那就放到 `~/.vim/pack/*/opt/` 目录
"------------------------------------------------------------------------------

" packadd! myself
" packadd! templates_load
" let g:template_load = 1
" let g:template_tags_replacing = 1
" let g:T_AUTHOR = "fjp"
" let g:T_AUTHOR_EMAIL = "fjp@gmail.com"
" let g:T_AUTHOR_WEBSITE = "http://www.fjp.cn"
" let g:T_DATE_FORMAT = "%c"
"
packadd! vimspector
" 加载debug插件,复用F3-F12
" nmap <m-0> :packadd vimspector<cr>
let g:vimspector_enable_mappings = 'HUMAN' " VISUAL_STUDIO
" insert `:VimspectorInstall` to install
" 'CodeLLDB'
let g:vimspector_install_gadgets = [ 'delve', 'debugpy', 'vscode-cpptools', 'vscode-bash-debug']
" let g:vimspector_base_dir=expand( '$HOME/.config/nvim/vimspector-config' )

"==============================================================================
" END
"==============================================================================

