#!/bin/bash

# Prologue
set -e

# Managing test mode
if [ "$ALPHA_EMACS_TEST" == 'yes' ]
then
  export HOME=`pwd`
fi

# Setting global variables
EMACSDIR="$HOME/.emacs.d"
ALPHA_BOOTSTRAP="./src/alpha/bootstrap.el"

print_usage () {
  echo -e "Usage: install-alpha-emacs.sh [COMMAND]\n\n" \
          "Commands:\n" \
          "  install      installs Alpha Emacs in user home directory\n" \
          "  run          run installed Alpha Emacs (for testing only)"
          "  uninstall    completely uninstalls Alpha Emacs"
}

install_alpha_emacs () {
  local SRCDIR=./src
  echo "Installing Alpha Emacs..."
  if [ "$ALPHA_EMACS_TEST" != 'yes' ]
  then
    if [ -d $EMACSDIR ]
    then
      echo "User Emacs directory already exists."
      while true; do
        read -p "Do you wish to erase the content of user Emacs directory? (YES/no)" YN
        case $YN in
          YES)
            echo "Removing user Emacs directory..."
            rm -frv $EMACSDIR
            echo "User Emacs directory successfully removed"
            break
            ;;
          no)
            echo "Alpha Emacs installation cannot continue."
            exit 1
            ;;
          *)
            echo "please answer YES or no"
            ;;
        esac
      done
    fi
    echo "Creating Emacs user directory..."
    mkdir -v $EMACSDIR
  fi
  echo "Installing Alpha Emacs files..."
  cp -rv $SRCDIR/* $EMACSDIR/
  echo "Alpha Emacs files successfully installed."
  echo "Boostrapping Alpha Emacs..."
  emacs -Q --script $ALPHA_BOOTSTRAP
  exit 0
}

run_alpha_emacs () {
  echo "Running Alpha Emacs..."
  emacs
  echo "Finished running Alpha Emacs..."
}

uninstall_alpha_emacs() {
  if [ -d $EMACSDIR ]
  then
    echo "Uninstalling Alpha Emacs..."
    rm -frv $EMACSDIR
    echo "Alpha Emacs successfully uninstalled."
    exit 0
  else
    echo "Alpha Emacs not installed yet."
    exit 1
  fi
}

case $1 in
  install)
    install_alpha_emacs
    ;;
  run)
    run_alpha_emacs
    ;;
  uninstall)
    uninstall_alpha_emacs
    ;;
  *)
    echo -e "No valid command provided.\n"
    print_usage
    ;;
esac
