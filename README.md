# Ze dotfiles
-------------------------
A lightweight and customized dotfile repo wich sets up a Mac to my needs, the installation step may overwrite existing dotfiles in your $HOME directory. Mostly a copy of [Mathias Bynen's](https://github.com/mathiasbynens/dotfiles) and [Zach Holman's](https://github.com/holman/dotfiles) .dotfiles.


### Whats inside
* OS X's defaults
* Some bash awesomeness
* Git configuration files
* The modified Terminal Pro-theme from [@mathiasbynens](https://github.com/mathiasbynens)
* Symlinked Sublime 2 Settings

### Download & Install
Install [git](http://git-scm.com/download/mac) before you move on to these steps.
```bash
# Fetches the latest dotfile repo and places it into your home folder /.dotfiles
git clone https://github.com/Inkdpixels/dotfiles.git ~/.dotfiles

cd ~/.dotfiles

# Move all dotfiles to the system positions & set all osx defaults.
script/bootstrap.sh
```

### Install Additions
```bash
# Copy & Symlink Sublime Text 2 User preferences
sublime2/./setup
```


## Credits
This repo is based on the work of others, as a result I wont claim this as my work. Currently it's just a mess of files and is not intended to be a fully working dotfile repo. Most of the work was done by...

* [@mathiasbynens](https://github.com/mathiasbynens) – [His dotfile repo](https://github.com/mathiasbynens/dotfiles)
* [@holman](https://github.com/holman) – [His dotfile repo](https://github.com/holman/dotfiles)

...And probably more.