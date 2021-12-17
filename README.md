# Home Directory

## How to install

```sh
cd ~
git init
git remote add origin git@github.com:amekusa/home.git
git pull origin master
```

## Shell

```sh
# Install Oh-My-Zsh
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

---

## Homebrew

```sh
# Install:
$ git clone https://github.com/Homebrew/brew.git .brew

# Make sure if there are any issues with:
$ brew doctor
```

### Packages to install
```sh
# Additional repositories:
$ brew tap homebrew/services
$ brew tap homebrew/cask-fonts

# Shell (zsh)
$ brew install zsh

# Utilities:
$ brew install tmux tig lazygit googler

# Web server, SQL, PHP:
$ brew install nginx mariadb php composer

# NodeJS:
$ brew install node yarn

# Fonts:
$ brew install --cask font-fira-code font-fira-code-nerd-font font-iosevka

# Ungoogled Chromium for browser testing:
$ brew cask install eloston-chromium
```

### Fixing curl failing due to expired certs
1. Download https://curl.se/ca/cacert.pem
2. Replace `/etc/ssl/cert.pem` with it
```sh
cd /etc/ssl
sudo mv cert.pem cert.pem.org
sudo cp ~/Downloads/cacert.pem ./cert.pem
```

### Enable the homebrew version of zsh as the default shell

```sh
# Check the path to the zsh you want to enable
$ which zsh

# Add the path to /etc/shells
$ sudo nano /etc/shells

# Set the path as your default shell
$ chsh -s $(which zsh)
```

**After restarting the computer**, make sure that `$SHELL` is pointing at the correct path.

```sh
$ echo $SHELL
```

### Maintenance

```sh
# Cleanup caches
$ brew cleanup -s

# Update packages
$ brew update
```

---

## NPM

### Packages to install

```sh
# Utilities:
$ npm i -g npm-check-updates

# Automation:
$ npm i -g npm-watch

# Bundler:
$ npm i -g rollup
$ npm i -g @rollup/plugin-babel @rollup/plugin-node-resolve @rollup/plugin-commonjs

# Debug, Testing, Code Coverage:
$ npm i -g source-map-support
$ npm i -g mocha c8 codecov

# Documentation Generator:
$ npm i -g jsdoc
```

### Maintenance

```sh
# To see all the packages installed:
$ npm ls -g --depth=0

# Update packages (required: npm-check-updates)
$ ncu -g -u
```

---

## Git

```sh
# Global ignore
$ git config --global core.excludesfile ~/.gitignore_global

# Ddefault editor (nano)
$ git config --global core.editor "nano"
```
