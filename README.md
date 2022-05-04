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

# 处理runtimepath下的所有文档
:helptags ALL
```

## install

- fzf
- ag/ack
- universal-ctags

## install Coc

```bash
# install node
# curl -sL install-node.now.sh | bash
mkdir -p ~/.config/nvim/pack/coc_fjp/start
cd  ~/.config/nvim/pack/coc_fjp/start
git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
nvim -c "helptags coc.nvim/doc/ | q"
```

## install vimspector
```bash
cd ~/.config/nvim/pack/vendor_fjp/opt
wget https://github.com/puremourning/vimspector/archive/refs/tags/2254158724.tar.gz
tar -zxvf 2254158724.tar.gz
# curl -L <url> | tar -C $HOME/.config/nvim/pack/vendor_fjp/opt zxvf -
# python3 install_gadget.py --all ==> VimspectorInstall
# python3 install_gadget.py --enable-c --enable-cpp --enable-python --enable-go
```

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
# vim 命令
```bash
vim --startuptime start.log test1.py # 启动速度
# :%TOhtml                  " 保存为html
```
