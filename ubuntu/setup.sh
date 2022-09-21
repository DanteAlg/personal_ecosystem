# Generate ssh keys
ssh-keygen
echo "Copy and paste ssh key into your github account... \n"
cat ~/.ssh/id_rsa.pub

# Add git-aware-prompt to bash
mkdir ~/.bash
git clone https://github.com/jimeh/git-aware-prompt.git ~/.bash

# Install some basic linux dev libs
sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk

# Install asdf (Version manager)
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2

# Install node 
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

# Install erlang
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
# Ubuntu 22.04 used now openssl 3 instead of openssl1 some openssl 1 functions are now deprecated
# Ref: https://github.com/asdf-vm/asdf-erlang/issues/247#issuecomment-1114905354
CFLAGS="-w -O2 -Wno-deprecated-declarations" asdf install erlang 24.1
asdf global erlang 24.1

# Install elixir
asdf plugin add elixir
asdf install elixir 1.12.2-otp-24
asdf global elixir 1.12.2-otp-24

# Install postgres
sudo apt-get install build-essential libssl-dev libreadline-dev zlib1g-dev libcurl4-openssl-dev uuid-devs
asdf plugin-add postgres
asdf install postgres 14.5
asdf global postgres 14.5
~/.asdf/installs/postgres/14.5/bin/pg_ctl -D ~/.asdf/installs/postgres/14.5/data -l logfile start

git config --global user.name "Dante"
git config --global user.email "dante.alighierimds@gmail.com"