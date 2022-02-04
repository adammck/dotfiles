# Usage:
#  $ brew bundle --global
#  $ brew bundle --global cleanup --force

tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"

# Allow some packages to be excluded from work machine. Usually because they're
# already pushed by JAMF, so can't be managed here.
hostname = `hostname -s`.strip
is_datadog_corp = ["COMP-C02CD0VGLVDN"].include?(hostname)

# Dumped from iMac in May 2020.
# TODO: Organize and remove stuff no longer needed.
brew "ack"
brew "libyaml"
brew "ansible"
brew "autoconf"
brew "autojump"
brew "awscli"
brew "boost"
brew "forego"
brew "glide"
brew "oniguruma"
brew "jq"
brew "libassuan"
brew "libusb"
brew "libgcrypt"
brew "libksba"
brew "mercurial"
brew "minicom"
brew "mysql"
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
brew "terraform-inventory"
brew "tidy-html5"
brew "tmux"
brew "wget"
brew "trash"
brew "scc"

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

# To build ODrive images
tap "armmbed/formulae"
brew "armmbed/formulae/arm-none-eabi-gcc"
cask "osxfuse"
brew "tup"
brew "open-ocd"

# ???
tap "osx-cross/avr"
brew "avr-gcc"

# To flash keyboard
brew "dfu-programmer"

# Tool version managers
# Don't install the things these manage with brew
brew "pyenv"
brew "tfenv"

# Local Golang development
brew "go", args: ["cross-compile-common"]
brew "protoc-gen-go"
brew "protoc-gen-go-grpc"

# Build deps at Datadog
# See: https://github.com/DataDog/devops/wiki/Go#osx-development
if is_datadog_corp
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
cask "1password"\
  unless is_datadog_corp # managed
cask "1password-cli"
brew "shellcheck"
brew "youtube-dl"
cask "autodesk-fusion360"
mas "Monodraw", id: 920404675
brew "consul"
cask "slack"\
  unless is_datadog_corp # managed
cask "keepingyouawake"
brew "graphviz"
mas "Tot", id: 1491071483
cask "scratch"
mas "Things 3", id: 904280696
cask "vagrant"

# Like cURL, but for gRPC
brew "grpcurl"

# Games
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
