# Ze dotfiles
-------------------------
A lightweight and customized dotfile repo wich sets up a Mac to my needs, the installation step may overwrite existing dotfiles in your $HOME directory. Mostly a mix of components from [Mathias Bynen's](https://github.com/mathiasbynens/dotfiles), [Zach Holman's](https://github.com/holman/dotfiles) and [Nicolas Gallagher's](https://github.com/necolas/dotfiles) .dotfiles.


### Whats inside
* OS X's defaults
* Some bash awesomeness
* Git configuration files
* The modified Terminal Pro-theme from [@mathiasbynens](https://github.com/mathiasbynens)
* Symlinked Sublime 2 Settings

It will also check & optionally install some usefull ruby gems wich I use from day to day like SASS, Compass & Rake.


### Things the bootstrap script depends on
* CLT from xCode _(Needs to be installed manually)_
* Homebrew _(Installs automatically if not found)_
+ git _(Installs automatically if not found)_


### Download & Install
```bash
# Fetches the latest dotfiles into '~/.dotfiles' and runs the bootstrap script
git clone https://github.com/Inkdpixels/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && script/bootstrap.sh
```


## Credits
This repo is based on the work of others, as a result I wont claim this as my work. Currently it's just a mess of files and is not intended to be a fully working dotfile repo. Most of the work was done by...

* [@mathiasbynens](https://github.com/mathiasbynens) – [His dotfile repo](https://github.com/mathiasbynens/dotfiles)
* [@holman](https://github.com/holman) – [His dotfile repo](https://github.com/holman/dotfiles)

...And probably more.