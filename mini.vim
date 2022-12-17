" vim -u mini.vim

set nocompatible
set runtimepath^=$HOME/.config/nvim/pack/vendor_fjp/start/coc.nvim/
set runtimepath^=$HOME/.config/nvim/pack/vendor_fjp/start/md-vim
filetype plugin indent on
syntax on
set hidden

let g:coc_data_home='~/.config/nvim/pack/coc_fjp/coc_data'
let g:coc_config_home = '~/.config/nvim/conf_coc'
let g:coc_start_at_startup = 1     " 禁止在vim启动时启动coc服务;手动:CocStart
