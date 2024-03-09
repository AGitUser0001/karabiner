#!/bin/sh
export ZDOTDIR=~/.zsh
if test -f $ZDOTDIR/homebrew-env.sh; then
  source $ZDOTDIR/homebrew-env.sh
else
  export HOMEBREW_PREFIX="/opt/homebrew"
fi

menu() {
  case $# in
    1) script 'tell application "System Events" to tell (first process where it is frontmost) to click '"$1"' of menu bar 1';;
    2) script 'tell application "System Events" to tell (first process where it is frontmost) to click '"$1"' of menu bar '"$2";;
    3) script 'tell application "System Events" to tell '"$1"' to click '"$2"' of menu bar '"$3";;
  esac
}

notify() {
  case $# in
    1) $HOMEBREW_PREFIX/bin/terminal-notifier -remove "$1";;
    2|3) $HOMEBREW_PREFIX/bin/terminal-notifier -sender org.pqrs.Karabiner-NotificationWindow -title Karabiner-Elements -message "$2" -group "$3";;
    4) $HOMEBREW_PREFIX/bin/terminal-notifier -sender org.pqrs.Karabiner-NotificationWindow -title "$2" -message "$3" -group "$4";;
  esac
}

script() {
  osascript -e "$1" >/dev/null
}

app() {
  open -a "$1"
}

play() {
  afplay /System/Library/Sounds/$1.aiff
}
