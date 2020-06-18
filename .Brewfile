# Usage:
#  $ brew bundle --global
#  $ brew bundle --global cleanup --force

tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"

# Allow some packages to be excluded from work machine. Usually because they're
# already pushed by JAMF, so can't be managed here.
hostname = `hostname -s`.strip
is_datadog_corp = %w["COMP-C02CD0VGLVDN"].include?(hostname)

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
brew "git"
brew "go", args: ["cross-compile-common"]
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

tap "osx-cross/avr"
brew "avr-gcc"

# To flash keyboard
brew "dfu-programmer"

# To work (for Datadog) from a non-corp machine:
unless is_datadog_corp
  cask "appgate-sdp-client"
end

# Tool version managers
# Don't install the things these manage with brew
brew "pyenv"
brew "tfenv"

# Added after May 2020
cask "1password" unless is_datadog_corp
cask "1password-cli"
brew "shellcheck"
brew "youtube-dl"
brew "coreutils"
brew "bash"
cask "autodesk-fusion360"
mas "Monodraw", id: 920404675

# Set up settings Sync after installing Sublime Text:
# TODO: Do this before installing Sublime, in bin/provision-mac
#
#   cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
#   rm -rf User
#   ln -s ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Sync/Sublime\ Text/User
# 
cask "sublime-text"

# Set up settings Sync after installing Alfred!
# TODO: How to do this from the command prompt?
cask "alfred"

# Fonts
tap "homebrew/cask-fonts"
cask "font-source-code-pro"
