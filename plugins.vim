
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
" 语法检查              <dense-analysis/ale>
" 快速注释代码          <tpope/vim-commentary>,同tcomment_vim,nerdcommenter
" 代码片段              <honza/vim-snippets>
" 异步运行shell指令     <skywind3000/asyncrun.vim>
" 现代化的构建任务系统  <skywind3000/asynctasks.vim>;AsyncRun 助手
" 封装内置终端          <skywind3000/vim-terminal-help>
" debug工具             <puremourning/vimspector>
" 单行多行代码转换      <AndrewRadev/splitjoin.vim>

" go开发插件            <fatih/vim-go>
" c++高亮               <octol/vim-cpp-enhanced-highlight>
" 快速文件切换.c ->.h   <vim-scripts/a.vim>

" 文本对齐              <godlygeek/tabular>,同vim-easy-align
"
"==============================================================================
" 插件设置
"==============================================================================
if has("nvim")
lua <<EOF
-- Attaches to every FileType mode
require 'colorizer'.setup()
EOF
endif
" lua require'colorizer'.setup() " 同上

let g:airline#extensions#tabline#enabled = 1    " 开启tab栏
" let g:airline_solarized_bg='dark'
" let g:airline_theme = 'solarized'  " AirlineTheme simple

" -----------------------------------------------------------------------------
" fzf settings
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-q': function('s:build_quickfix_list'),
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" See `man fzf-tmux` for available options
if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
  " let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
  let g:fzf_layout = { 'down': '~40%' }  " Default fzf layout
endif

" Hide statusline
" autocmd! FileType fzf
" autocmd  FileType fzf set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Customize fzf colors to match your color scheme
let g:fzf_colors =
          \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
" let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
" let g:fzf_preview_window = []

  " Automatic rename of tmux window
if exists('$TMUX') && !exists('$NORENAME')
  au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
  au VimLeave * call system('tmux set-window automatic-rename on')
endif

" let $FZF_DEFAULT_OPTS .= ' --inline-info'

command! -nargs=1 Count execute printf('%%s/%s//gn', escape(<q-args>, '/')) | normal! ``

" ----------------------------------------------------------------------------
" SaveMacro / LoadMacro
" ----------------------------------------------------------------------------
function! s:save_macro(name, file)
  let content = eval('@'.a:name)
  if !empty(content)
    call writefile(split(content, "\n"), a:file)
    echom len(content) . " bytes save to ". a:file
  endif
endfunction
command! -nargs=* SaveMacro call <SID>save_macro(<f-args>)

function! s:load_macro(file, name)
  let data = join(readfile(a:file), "\n")
  call setreg(a:name, data, 'c')
  echom "Macro loaded to @". a:name
endfunction
command! -nargs=* LoadMacro call <SID>load_macro(<f-args>)


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
let g:tagbar_autofocus = 1 " 光标在tagbar页面内
" let g:tagbar_autopreview = 1
let g:tagbar_previewwin_pos = 'rightbelow'
let g:tagbar_show_linenumbers = 1 " 0/1/2/-1
let g:tagbar_sort = 0 " 0不按照名字排序

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
" <jiangmiao/auto-pairs>
let g:AutoPairsFlyMode = 0 " 1 插入右括号不生效，会直接跳转的下一个右括号

" -----------------------------------------------------------------------------
let g:indentLine_setColors = 1
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_setConceal = 0
" 禁用隐藏(可以在其JSON文件中看到引号)
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0
" Background (Vim, GVim)
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_bgcolor_gui = '#FF5F00'

" -----------------------------------------------------------------------------
let g:ale_linters_explicit = 1           " 置1 除g:ale_linters指定，其他不可用
" \    'go': ['golangci-lint','golint'],
let g:ale_linters = {
\    'bash': ['shellcheck'],
\    'python': ['pylint'],
\    'c': ['cppcheck','clang', 'gcc'],
\    'cpp': ['cppcheck','clang','g++'],
\    'rust': ['rustc', 'rls'],
\    'gitcommit': ['gitlint'],
\    'json': ['prettier'],
\    'yaml': ['actionlint'],
\    'thrift': ['thriftcheck'],
\    'proto': ['buf-lint', 'protoc-gen-lint', 'protolint'],
\}
" sudo yum install cppcheck

let g:ale_fix_on_save = 1                " Set this variable to 1 to fix files when you save them.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'proto': ['buf-format', 'protolint'],
\}

let g:ale_lint_on_text_changed = 'never'  " run lint only on saving a file  [normal]
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0               " 打开文件时不进行检查

" echo message
" %s is the error message itself
" %linter% is the linter name
" %severity is the severity type
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_set_highlights = 0              " to disabling highlighting
let g:ale_set_loclist = 0                 " use quickfix list instead of the loclist
let g:ale_set_quickfix = 1
let g:ale_disable_lsp = 1                 " 禁用lsp,使用coc.nvim的lsp
" let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚡
highlight clear ALEErrorSign              " 清除错误标志的高亮
highlight clear ALEWarningSign

let g:ale_c_gcc_options = '-Wall -O2 -std=c99
            \ -I .
            \ -I /usr/include'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11
            \ -I .
            \ -I /usr/include'
"            \ -I $HOME/local/gcc-5.4.0/include/c++/5.4.0
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

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
" vim-go
let g:go_fmt_command = "goimports" " 保存时自动运行goimports;gofmt,goimports,gopls
let g:go_fmt_autosave = 1
let g:go_autodetect_gopath = 1

let g:go_metalinter_command = "golangci-lint run"
let g:go_metalinter_enabled = ['vet', 'errcheck', 'staticcheck', 'gosimple']
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'revive']
" let g:go_metalinter_deadline = "5s"

let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_decls_includes = "func,type" " default

let g:go_list_type = "quickfix"
let g:go_list_height = 6

let g:go_auto_sameids = 1          " 高亮当前变量
let g:go_auto_type_info = 1        " 自动显示函数形参和返回值
let g:go_addtags_transform = "camelcase"

let g:go_fmt_fail_silently = 0     " quickfix列表中显示错误信息,1为关闭显示
let g:go_highlight_types = 1       " 0为有限的Go语法高亮,太卡设为0
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

let g:go_test_timeout = '10s'
let g:go_textobj_include_function_doc = 1 " 函数声明包含注释;daf时包含注释

" -----------------------------------------------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
" let g:cpp_experimental_template_highlight = 1 " 比上一个更快,但易出错
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

"------------------------------------------------------------------------------
" 需要的时候加载插件，那就放到 `~/.vim/pack/*/opt/` 目录
"------------------------------------------------------------------------------
set packpath=~/.config/nvim/

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
let g:vimspector_enable_mappings = 'HUMAN' " VISUAL_STUDIO
" insert `:VimspectorInstall` to install
" 'CodeLLDB'
let g:vimspector_install_gadgets = [ 'delve', 'debugpy', 'vscode-cpptools', 'vscode-bash-debug']
" let g:vimspector_base_dir=expand( '$HOME/.config/nvim/vimspector-config' )

"==============================================================================
" END
"==============================================================================
