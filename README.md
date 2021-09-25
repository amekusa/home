# Home Directory

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
$ brew install --cask font-fira-code font-iosevka

# Ungoogled Chromium for browser testing:
$ brew cask install eloston-chromium
```

Beware NOT to use `brew bundle` because it makes the installation process EXTREMELY slow for unknow reason.

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
