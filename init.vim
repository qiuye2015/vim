
" -----------------------------------------------------------------------------
"  ________      _____   _______      ____   ____   _____   ____    ____
" |_   __  |    |_   _| |_   __ \    |_  _| |_  _| |_   _| |_   \  /   _|
"   | |_ \_|      | |     | |__) |     \ \   / /     | |     |   \/   |
"   |  _|     _   | |     |  ___/       \ \ / /      | |     | |\  /| |
"  _| |_     | |__' |    _| |_           \ ' /      _| |_   _| |_\/_| |_
" |_____|    `.____.'   |_____|           \_/      |_____| |_____||_____|
"
" -----------------------------------------------------------------------------
source ~/.vim/base.vim

if v:version < 800 | finish | endif

source ~/.vim/plugins.vim
source ~/.vim/keymap.vim
source ~/.vim/coc.vim
source ~/.vim/md-snippets.vim

" 判断文件是否存在
if filereadable(expand("$HOME/.vimrc.FJP")) | source $HOME/.vimrc.FJP | endif

" vimrc files
" for s:path in split(glob('~/.vim/vimrc/*.vim'), "\n")
"     exe 'source ' . s:path
" endfor

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
" packloadall

" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
