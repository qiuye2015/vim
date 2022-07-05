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
- ag/ack `sudo yum install epel-release.noarch the_silver_searcher`
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
# python3 install_gadget.py --enable-go --enable-python --enable-c --enable-bash

# pip3 install neovim
# pip3 install pynvim
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
git submodule update --init --remote pack/vendor_fjp/start/mru

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

# vim 基础知识

- `checkhealth` nvim 检查环境
- `:options` 了解 vimrc 设置
- `:h vimrc` 查找 vimrc 文件
- `:h startup` 查看大致加载顺序
- `:h key-notation` 了解按键
- `:h jump-motions` 跳转动作
- `:h tag-commands` tag 跳转
- `:h +feature-list` 浏览完整的功能列表
- `vim --startuptime start.log test1.py` 查看每一个插件的耗时
- `vim --clean --startuptime start.log test1.py` 查看不加载这些插件耗时
- `>G`命令会增加从当前行到文档末尾处的缩进层级
- `gg=G`自动格式化
- `:%TOhtml` 保存为 html
- `line('.')`可以返回当前行号

# vim Map

- base.vim C-x|S-x|x
- plugins.vim leader-x
- coc.vim space-x

# 环境变量

```bash
:echo $HOME         " 用户根目录"
:echo $VIM          " Vim 程序安装目录"
:echo $VIMRUNTIME   " Vim 程序位置"
:echo $MYVIMRC      " .vimrc 文件位置"
```

# Vim 信息

```bash
:version            " 版本信息和加载 vimrc 顺序等信息"
:scriptnames        " 查看 script 脚本的加载顺序"
:set runtimepath?   " 显示 script 搜索路径
:messages           " 查看 echom 打印信息"
:function           " 查看加载的 function 列表"
:set all            " 查看 Vim 所有变量"
:set                " 查看 Vim 所有与系统不同的变量"
:set variable?      " 显示指定 Vim 变量的当前值
```
