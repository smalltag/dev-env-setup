dev-env-setup
=============

Setup dev env from scratch

Includes [zsh](https://github.com/hszcg/vimconf), [vimconf](https://github.com/hszcg/vimconf), git-alias and others.


# Get Started

* Install zsh first

```
# For Mac OSX
brew install zsh

# For Ubuntu
sudo apt-get install zsh

# If default $SHELL is not changed to zsh
# add the following line to .bash_profile

SHELL=$ZSH_PATH exec $ZSH_PATH --login
# ($ZSH_PATH can be /usr/local/bin/zsh OR /usr/bin/zsh)
```

* Checkout zsh config files 

```
sh install-zsh.sh
```

* sync other files

```
sh sync.sh
```
