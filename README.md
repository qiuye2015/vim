# FJP' vimrc
Support both vim8 and neovim.

## usage
```bash
# for neovim
git clone --recursive https://github.com/qiue2015/vim.git ~/.config/nvim

# for vim8
git clone --recursive https://github.com/qiuye2015/vim.git ~/.vim
ln -s ~/.vim/init.vim ~/.vimrc

# 将一个项目同时从本地推送到 GitHub 和 Gitee
cp config .git/config
```

## install
- fzf
- ag/ack
- universal-ctags

## alias
```bash
#  用fzf选择task去执行
## nvim
alias task='~/.config/nvim/pack/vendor_fjp/start/asynctasks.vim/bin/asynctask -f'
## vim
alias task='~/.vim/pack/vendor_fjp/start/asynctasks.vim/bin/asynctask -f'
```

## 使用 Git 管理 Vim 插件
```bash
# 初始化仓库
mkdir -p ~/.config/nvim && cd ~/.config/nvim
git init

# 添加插件
git submodule add https://github.com/lvht/mru pack/vendor_fjp/start/mru

# 更新指定插件
git submodule update --init --remote pack/vendor/start/mru

# 更新所有插件
git submodule update --init --remote

# 删除插件
git rm pack/vendor_fjp/start/vim-colorscheme-icons/

# 推送到github/gitee
git commit
git push
```
## 附录
### 已经安装
```bash
git submodule add https://github.com/lvht/mru pack/vendor_fjp/start/mru
git submodule add https://github.com/epii1/fzf pack/vendor_fjp/start/fzf
git submodule add https://github.com/mileszs/ack.vim pack/vendor_fjp/start/ack.vim
git submodule add https://github.com/vim-scripts/a.vim pack/vendor_fjp/start/a.vim
git submodule add https://github.com/preservim/tagbar pack/vendor_fjp/start/tagbar
git submodule add https://github.com/preservim/nerdtree pack/vendor_fjp/start/nerdtree
git submodule add https://github.com/Xuyuanp/nerdtree-git-plugin pack/vendor_fjp/start/nerdtree-git-plugin
git submodule add https://github.com/vim-scripts/vim-gitgutter pack/vendor_fjp/start/vim-gitgutter
git submodule add https://github.com/zivyangll/git-blame.vim pack/vendor_fjp/start/git-blame.vim
git submodule add https://github.com/godlygeek/tabular pack/vendor_fjp/start/tabular
git submodule add https://github.com/plasticboy/vim-markdown pack/vendor_fjp/start/vim-markdown

git submodule add https://github.com/vim-airline/vim-airline pack/vendor_fjp/start/vim-airline
git submodule add https://github.com/vim-airline/vim-airline-themes pack/vendor_fjp/start/vim-airline-themes
git submodule add https://github.com/jacoborus/tender.vim pack/vendor_fjp/start/tender.vim
git submodule add https://github.com/flazz/vim-colorschemes/ pack/vendor_fjp/start/vim-colorschemes
git submodule add https://github.com/norcalli/nvim-colorizer.lua pack/vendor_fjp/start/nvim-colorizer.lua

git submodule add https://github.com/Yggdroot/indentLine pack/vendor_fjp/start/indentLine
git submodule add https://github.com/tpope/vim-commentary pack/vendor_fjp/start/vim-commentary 
git submodule add https://github.com/jiangmiao/auto-pairs pack/vendor_fjp/start/auto-pairs
git submodule add https://github.com/vim-syntastic/syntastic pack/vendor_fjp/start/syntastic
git submodule add https://github.com/ludovicchabant/vim-gutentags pack/vendor_fjp/start/vim-gutentags
git submodule add https://github.com/skywind3000/asyncrun.vim pack/vendor_fjp/start/asyncrun.vim
git submodule add https://github.com/skywind3000/asynctasks.vim pack/vendor_fjp/start/asynctasks.vim

git submodule add https://github.com/fatih/vim-go pack/vendor_fjp/start/vim-go
git submodule add https://github.com/octol/vim-cpp-enhanced-highlight pack/vendor_fjp/start/vim-cpp-enhanced-highlight
````

### 自定义插件
```bash
# 加载
# packadd myself
# packadd templates_load

pack/vendor_fjp/opt/
├── myself
│   └── plugin
│       ├── comdg.vim         # 生成C++函数文档
│       └── insert.vim        # 避免同一个文件被include多次,ifndef
└── templates_load
    ├── plugin
    │   └── load_template.vim # 自动加载模板插件
    └── templates
        └── tpl.c             # 模板
```
