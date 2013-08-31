# Files with dots in them
My dotfiles for OS X.


## Features
### Automatic software installation
Shell installations:
* NPM
* Homebrew
* [z](https://github.com/rupa/z/)

Homebrew formulae:
* Ack
* GNU core utilities
* Git
* Bash Completion
* Node.js
* OpenSSH
* [Homebrew Cask](https://github.com/phinze/homebrew-cask)

Node packages:
* [Grunt CLI](gruntjs.com)

Ruby gems:
* [SASS](http://sass-lang.com/)
* [Compass](http://compass-style.org/)

Applications(will be installed via [Homebrew Cask](https://github.com/phinze/homebrew-cask)):
* Blender
* Dropbox
* Firefox
* Firefox Aurora
* Google Chrome
* Google Chrome Canary
* InSync
* ImageAlpha
* ImageOptim
* iTerm2
* KeePass-X
* Libre Office
* Little Snitch
* Opera
* Skype
* Spotify
* Sublime Text
* The Unarchiver
* Thunderbird
* Virtualbox
* VLC Media Player
* WebStorm


### Configuration files & .dotfiles
* Bash aliases & functions
* Global Git configuration files
* OSX Defaults


### Other stuff
* The modified Terminal Pro-theme from [@mathiasbynens](https://github.com/mathiasbynens)



## Install
Before you download and install the dotfiles, you might want to download the [Command Line Tools for xCode](https://developer.apple.com/downloads) as they are required to run the bootstrap script.
```bash
# Fetches the latest dotfiles into '~/.dotfiles' and runs the bootstrap script
curl -LOk https://github.com/Inkdpixels/dotfiles/archive/master.zip && unzip master.zip && mv dotfiles-master/ .dotfiles/ && rm -rf master.zip && cd .dotfiles && script/bootstrap.sh
```



## Credits
* [@mathiasbynens](https://github.com/mathiasbynens) – [His dotfile repo](https://github.com/mathiasbynens/dotfiles)
* [@holman](https://github.com/holman) – [His dotfile repo](https://github.com/holman/dotfiles)
