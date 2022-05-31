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
is_ddog = (hostname == "COMP-C02CD0VGLVDN")
is_home = (hostname == "imac5k")

# Version control
brew "git"
brew "svn"

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

# To build ODrive images
if is_home
  tap "armmbed/formulae"
  brew "armmbed/formulae/arm-none-eabi-gcc"
  cask "macfuse"
  brew "tup"
  brew "open-ocd"
end

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

# Build deps at Datadog
# See: https://github.com/DataDog/devops/wiki/Go#osx-development
if is_ddog
  brew "zlib"
  brew "zstd"
  brew "librdkafka"
  brew "lz4"
end

# Modern command-line utils
# Mostly prefixed with 'g', e.g. gsha1sum, gtelnet
brew "coreutils"
brew "diffutils"
brew "inetutils"
brew "bash"

# Added after May 2020

# Password manager
cask "1password"\
  unless is_ddog # managed
cask "1password-cli"

# Chat
cask "slack"\
  unless is_ddog # managed

# Video conferencing
cask "zoom"\
  unless is_ddog # managed

# Like cURL, but for gRPC
brew "grpcurl"

# Games
cask "steam" if is_home
cask "minecraft" if is_home
cask "openemu"
cask "multipatch"

# For screenshot sharing at work.
cask "cloudapp"

# Bazel/Starlark formatter
# https://github.com/bazelbuild/buildtools/tree/master/buildifier#readme
brew "buildifier"

# Docker Desktop
cask "docker"
cask "virtualbox"

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

# Set up settings Sync after installing Alfred!
# TODO: How to do this from the command prompt?
cask "alfred"

# Fonts
tap "homebrew/cask-fonts"
cask "font-source-code-pro"

# Junk drawer
# TODO: Organize and remove stuff no longer needed.
brew "ack"
brew "ansible"
brew "autoconf"
brew "autojump"
brew "awscli"
brew "boost"
brew "consul"
brew "forego"
brew "glide"
brew "graphviz"
brew "jq"
brew "libassuan"
brew "libgcrypt"
brew "libksba"
brew "libusb"
brew "libyaml"
brew "mercurial"
brew "minicom"
brew "mysql"
brew "oniguruma"
brew "optipng"
brew "packer"
brew "pandoc"
brew "picocom"
brew "postgresql"
brew "pstree"
brew "pth"
brew "pwgen"
brew "reattach-to-user-namespace"
brew "redis"
brew "scc"
brew "shellcheck"
brew "terraform-inventory"
brew "tidy-html5"
brew "tmux"
brew "trash"
brew "wget"
brew "youtube-dl"
cask "autodesk-fusion360"
cask "keepingyouawake"
cask "scratch"
cask "vagrant"
mas "Monodraw", id: 920404675
mas "Things 3", id: 904280696
mas "Tot", id: 1491071483
