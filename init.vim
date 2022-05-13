
" -----------------------------------------------------------------------------
"  ________      _____   _______      ____   ____   _____   ____    ____
" |_   __  |    |_   _| |_   __ \    |_  _| |_  _| |_   _| |_   \  /   _|
"   | |_ \_|      | |     | |__) |     \ \   / /     | |     |   \/   |
"   |  _|     _   | |     |  ___/       \ \ / /      | |     | |\  /| |
"  _| |_     | |__' |    _| |_           \ ' /      _| |_   _| |_\/_| |_
" |_____|    `.____.'   |_____|           \_/      |_____| |_____||_____|
"
" -----------------------------------------------------------------------------
source ~/.config/nvim/base.vim

if v:version < 800
    finish
endif

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keymap.vim
source ~/.config/nvim/coc.vim

if filereadable(expand("$HOME/.vimrc.FJP")) " 判断文件是否存在
    source $HOME/.vimrc.FJP
endif

" vimrc files
" for s:path in split(glob('~/.config/nvim/vimrc/*.vim'), "\n")
"     exe 'source ' . s:path
" endfor

