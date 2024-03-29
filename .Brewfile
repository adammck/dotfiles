# Usage:
#  $ brew bundle --global
#  $ brew bundle --global cleanup --force

tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"

# To include/exclude some packages from some machines. I mostly want all of my
# machines to work the same, but I work on some weird stuff at home, and at work
# some stuff is already installed via JAMF or whatever.
hostname = `hostname -s`.strip
is_work = (hostname == "st-adammck1")
is_home = (hostname == "imac5k")

# To flash disk images to USB sticks
# Mostly for installing Linux on things
# https://balena.io/etcher
cask "balenaetcher"

# https://github.com/keith/reminders-cli
# Used by the the `rem` Alfred workflow
tap "keith/formulae"
brew "keith/formulae/reminders-cli"

# Remind me to move around once an hour.
cask "stand" if is_home

# ???
tap "osx-cross/avr"
brew "avr-gcc"

# To flash keyboard
brew "dfu-programmer"

# Tool version managers
# Don't install the things these manage with brew
brew "pyenv"
brew "tfenv"
brew "bazelisk"

# Local Golang development
brew "go", args: ["cross-compile-common"]
brew "protoc-gen-go"
brew "protoc-gen-go-grpc"

# Modern command-line utils
# Mostly prefixed with 'g', e.g. gsha1sum, gtelnet
brew "coreutils"
brew "diffutils"
brew "inetutils"
brew "bash"

# Perl package manager
brew "cpanm"

# Added after May 2020

# Password manager
cask "1password"\
  unless is_work # managed
cask "1password-cli"

# Chat
cask "slack"\
  unless is_work # managed

# Video conferencing
cask "zoom"\
  unless is_work # managed

# Games
cask "steam" if is_home
cask "minecraft" if is_home
cask "openemu"
cask "multipatch"

# Like cURL, but for gRPC
brew "grpcurl"

# Version control
brew "git"
brew "svn"
brew "mercurial"

# Code-centric text search
brew "ack"

# Random password generator
# See: .dotfiles/bin/pw
brew "pwgen"

# ps (process status) output as a tree
brew "pstree"

# JSON transformer
brew "jq"

# Terminal emulator
# For debugging serial devices
brew "picocom"

# SLOC counter
brew "scc"

# File downloader
# Use it to download files; cURL is better for most things.
brew "wget"

# Download YouTube (and many other sources) videos and audios
# Use it to archive useful videos for local search and reference
brew "youtube-dl"

# For screenshot sharing at work.
cask "cloudapp"

# Bazel/Starlark formatter
# https://github.com/bazelbuild/buildtools/tree/master/buildifier#readme
brew "buildifier"

# Shell script linter
brew "shellcheck"

# Docker Desktop
cask "docker"
cask "virtualbox"

# kubectl, kubectx, kubens
brew "kubernetes-cli"
brew "kubectx"
brew "helm"

# Local Kubernetes cluster for development.
# (Don't use the one bundled with Docker Desktop.)
brew "minikube"

# TODO: Set up config sync.
# For now, click: Dash > General > Set Up Syncing...
# The following doesn't seem to work:
#
#   defaults write com.kapeli.dashdoc syncFolderPath "~/Library/Mobile Documents/com~apple~CloudDocs/Sync/Dash"
#
cask "dash"

# TODO: Set up config sync.
cask "visual-studio-code"

# Run bin/provision-mac to set up config sync after install.
cask "sublime-text"

# Spotlight replacement: Launcher, search, macros, etc
# Run bin/provision-mac to set up config sync after install.
# (Configs are stored in iCloud Drive)
cask "alfred"

# Move and resize windows using keyboard shortcuts or snap areas.
cask "rectangle"

# Notepad in the menu bar
mas "Tot", id: 1491071483

# Task management
mas "Things 3", id: 904280696

# ASCII art/diagram editor
mas "Monodraw", id: 920404675

# Analyze disk usage
mas "DaisyDisk", id: 411643860

# CAD/CAM, for CNC machine and 3d printer
cask "autodesk-fusion360"
cask "prusaslicer"

# Menu bar icon to prevent Mac from going to sleep
cask "keepingyouawake"

# Web browser for development
cask "google-chrome"\
  unless is_ddog # managed

# Image editor
mas "Pixelmator Pro", id: 1289583905

# Junk drawer
# TODO: Organize and remove stuff no longer needed.
brew "ansible"
brew "autoconf"
brew "autojump"
brew "awscli"
brew "boost"
brew "consul"
brew "forego"
brew "glide"
brew "graphviz"
brew "libassuan"
brew "libgcrypt"
brew "libksba"
brew "libusb"
brew "libyaml"
brew "minicom"
brew "mysql"
brew "oniguruma"
brew "optipng"
brew "packer"
brew "pandoc"
brew "postgresql"
brew "pth"
brew "reattach-to-user-namespace"
brew "redis"
brew "terraform-inventory"
brew "tidy-html5"
brew "tmux"
brew "trash"
cask "scratch"
cask "vagrant"

# Fonts
tap "homebrew/cask-fonts"
cask "font-source-code-pro"
