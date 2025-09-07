#!/bin/bash

sudo apt install -y build-essential git vim gdb valgrind strace clang libclang-dev cmake curl

sudo apt install -y libsqlite3-dev libreadline-dev libgdbm-dev zlib1g-dev libbz2-dev sqlite3 \
    tk-dev zip libssl-dev libffi-dev wget llvm libncursesw5-dev xz-utils  libxml2-dev libxmlsec1-dev liblzma-dev

sudo apt install -y qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools qtbase5-examples qtdeclarative5-dev qml-module-qtquick-controls \
    qml-module-qtquick-controls2 qtquickcontrols2-5-dev qtwayland5 qtwayland5-dev-tools

git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
git clone https://github.com/pyenv/pyenv-update.git $HOME/.pyenv/plugins/pyenv-update
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
pyenv install 3.13.7
pyenv global 3.13.7
python --version
python -m pip install --upgrade pip setuptools
python -m pip install pyside6

cd /tmp
wget https://downloads.mysql.com/archives/get/p/20/file/libmysqlcppconn9_8.4.0-1debian12_amd64.deb
wget https://downloads.mysql.com/archives/get/p/20/file/libmysqlcppconn8-2_8.4.0-1debian12_amd64.deb
wget https://downloads.mysql.com/archives/get/p/20/file/libmysqlcppconn-dev_8.4.0-1debian12_amd64.deb
wget https://downloads.mysql.com/archives/get/p/20/file/libmysqlcppconn9-dbgsym_8.4.0-1debian12_amd64.deb
wget https://downloads.mysql.com/archives/get/p/20/file/libmysqlcppconn8-2-dbgsym_8.4.0-1debian12_amd64.deb
wget https://dev.mysql.com/get/Downloads/MySQL-8.4/mysql-community-client-plugins_8.4.6-1debian12_amd64.deb
sudo dpkg -i ./libmysqlcppconn9_8.4.0-1debian12_amd64.deb \
    libmysqlcppconn8-2_8.4.0-1debian12_amd64.deb \
    libmysqlcppconn-dev_8.4.0-1debian12_amd64.deb \
    libmysqlcppconn9-dbgsym_8.4.0-1debian12_amd64.deb \
    libmysqlcppconn8-2-dbgsym_8.4.0-1debian12_amd64.deb \
    mysql-community-client-plugins_8.4.6-1debian12_amd64.deb

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
sed -i 's/^OSH_THEME="font"/OSH_THEME="nwinkler"/' $HOME/.bashrc
source $HOME/.bashrc
