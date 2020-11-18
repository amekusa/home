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
# Utilities:
$ brew tap homebrew/services
$ brew install tmux tig

# Web server, SQL, PHP:
$ brew install nginx mariadb php composer

# NodeJS:
$ brew install node yarn

# Ungoogled Chromium for browser testing:
$ brew cask install eloston-chromium
```

Beware NOT to use `brew bundle` because it makes the installation process EXTREMELY slow for unknow reason.

### Maintenance
```sh
# Cleanup chaches:
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

# Testing, Code coverage:
$ npm i -g mocha nyc codecov

# Documentation generator:
$ npm i -g jsdoc
```

### Maintenance
```sh
# To see all the packages installed:
$ npm list -g --level=1

# Update packages (required: npm-check-updates)
$ ncu -g -u
```
