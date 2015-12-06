# Inkdpixels/dotfiles [![Build Status](https://travis-ci.org/Inkdpixels/dotfiles.svg)](https://travis-ci.org/Inkdpixels/dotfiles)

> dotfiles with a CLI for quickly setting & updating up a unix machine.

## Installation
``` bash
git clone https://github.com/Inkdpixels/dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles && ./install && cd
```

## Requirements
Currently this .dotfiles repository is aimed at Linux and OSX systems, you also need a package manager like `apt-get` or `homebrew` to install all dependencies.

## What will be installed?
* Git (Including the global configuration files)
* Homebrew (OSX only)
* Common bash functions, aliases and exports
* nvm
* npm
* caniuse-cmd
* semantic-release-cli
* composer
* OpenSSH
* [eg](https://github.com/srsudar/eg)
* [z](https://github.com/rupa/z)
* [s](https://github.com/haosdent/s)
* [stormSSH](https://github.com/emre/storm)
* [prm](https://github.com/eivind88/prm)

## CLI
This .dotfiles repository comes bundled with an CLI, below is a list of commands you can execute.

#### Commands
| Command            | Description                                                               |
| ------------------ | ------------------------------------------------------------------------- |
| `dot install`      | Installs all hard dependencies and conditionally some other and binaries. |
| `dot self-update`  | Self-Updates the local .dotfiles repository.                              |
| `dot help`         | Prints the usage guidelines.                                              |
| `dot help:git`     | Prints all available git related aliases.                                 |
| `dot help:bash`    | Prints all available bash aliases & functions.                            |

#### YMAL
You might also like: [@mathiasbynens](https://github.com/mathiasbynens/dotfiles) dotfiles.

## License
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
