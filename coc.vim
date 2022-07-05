"---------------
"-----base------
"---------------
" set nocompatible
" filetype plugin indent on
" syntax on
" set hidden

"---------------
" coc.nvim
"---------------
" :h coc-nvim
" :CocConfig
" :CocOpenLog
" :CocList extensions
" :CocOutline

set rtp+=~/.config/nvim/pack/coc_fjp/start/coc.nvim
let g:coc_data_home='~/.config/nvim/pack/coc_fjp/coc_data'
let g:coc_config_home = '~/.config/nvim/conf_coc'
let g:coc_start_at_startup = 1     " 禁止在vim启动时启动coc服务;手动:CocStart
" let g:node_client_debug = 1
" let g:coc_node_path = '/usr/local/opt/node@10/bin/node'

" 设置需要安装的插件，coc会检测其中未安装的插件在vim 启动后使用异步方式进行安装
" \'coc-explorer',
" \'coc-go',
" \'coc-diagnostic',
" \'coc-git',
let g:coc_global_extensions = [
            \'coc-highlight',
            \'coc-marketplace',
            \'coc-lists',
            \'coc-json',
            \'coc-yaml',
            \'coc-prettier',
            \'coc-pairs',
            \'coc-snippets',
            \'coc-translator',
            \'coc-vimlsp',
            \'coc-pyright',
            \'coc-sh',
            \'coc-clangd',
            \'coc-cmake',
            \'coc-thrift-syntax-support']

hi link CocFloating Normal

autocmd FileType markdown let b:coc_suggest_disable = 1

autocmd ColorScheme *
            \ hi CocErrorSign  ctermfg=Red guifg=#ff0000 |
            \ hi CocWarningSign  ctermfg=Brown guifg=#ff922b |
            \ hi CocInfoSign  ctermfg=Yellow guifg=#fab005 |
            \ hi CocHintSign  ctermfg=Blue guifg=#15aabf |
            \ hi CocUnderline  cterm=underline gui=underline

"==============================================================================
" Mappings for CoCList
"==============================================================================
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Show Most Recently Used (MRU) files
nnoremap <silent><nowait> <space>u  :<C-u>CocList -N mru -A<cr>
" grep current word in current buffer
nnoremap <silent> <space>f  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
" grep word under cursor with interactive mode
nnoremap <silent> <space>w :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" call SetupCommandAbbrs('C', 'CocConfig')
nnoremap <silent><nowait> <space>0  :CocConfig<cr>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <space>rn <Plug>(coc-rename)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" 跳转到下/上一个错误处
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Apply AutoFix to problem on the current line.
nmap <space>qf  <Plug>(coc-fix-current)
" Show all diagnostics.
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
"==============================================================================
"===============
" coc-highlight
"===============
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"===============
" coc-marketplace
"===============
":CocList marketplace
":CocList marketplace python
nnoremap <silent> <space>m :<C-u>CocList marketplace<cr>

"===============
" coc-lists
"===============
" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" mru.validate
" tags.generate

"===============
" coc-prettier
"===============
" only for: json...
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
" Formatting selected code.
xmap <space>fs  <Plug>(coc-format-selected)
nmap <space>fs <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder. (函数签名提示,在跳转占位符时触发)
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"===============
" coc-snippets
"===============
" 用选择的文本创建新的代码片段
xmap <space>x  <Plug>(coc-convert-snippet)

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" let g:coc_snippet_next = '<tab>'

"===============
" coc-translator
"===============
":CocList translation
" NOTE: do NOT use `nore` mappings
" popup
nmap <space>t <Plug>(coc-translator-p)
vmap <space>t <Plug>(coc-translator-pv)
" echo
" nmap <space>e <Plug>(coc-translator-e)
" vmap <space>e <Plug>(coc-translator-ev)

"===============
" coc-vimlsp
"===============
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

"===============
" coc-pyright
"===============
"python.runLinting
"python.sortImports
"pyright.organizeimports

"===============
" coc-clangd
"===============
" nnoremap <space>g :call s:generate_compile_commands()

" clangd.install
" clangd.switchSourceHeader
" clangd.symbolInfo
" clangd.memoryUsageo
" clangd.ast
" clangd.inlayHints.toggle

"===============
" golang
"===============
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
" autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
" autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>

"===============
" coc-yaml
"===============
" :CocOutline 提供文件大纲


