#!/bin/bash
cd "$(dirname "$0")"
git pull

function syncFiles() {
  sync_files=(
  ".gitconfig"
  ".gitignore"
  )
  sync_cmd=""
  for f in "${sync_files[@]}"
  do
    sync_cmd="$sync_cmd $f"
  done
  echo cp $sync_cmd ~
  cp $sync_cmd ~
}

# sync gitconfig files
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	syncFiles
else
	read -p "This may overwrite existing gitconfig files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		syncFiles
  fi
fi
unset syncFiles
source ~/.bash_profile

function setupVimconf() {
  rm -rf ~/.vim  ~/.vimrc
  git clone https://github.com/hszcg/vimconf.git ~/.vim
  ln -s ~/.vim/vimrc ~/.vimrc
  cd ~/.vim
  git submodule init
  git submodule update
}

# Use hszcg vim conf files
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	setupVimconf
else
  read -p "Would you like to use hszcg's vimconf file? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    setupVimconf
  fi
fi
unset setupVimconf

