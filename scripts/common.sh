#!/usr/bin/env bash

################################################################################
##  █████╗ ██████╗  ██████╗██╗  ██╗    ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗ ##
## ██╔══██╗██╔══██╗██╔════╝██║  ██║    ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝ ##
## ███████║██████╔╝██║     ███████║    ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝  ##
## ██╔══██║██╔══██╗██║     ██╔══██║    ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗  ##
## ██║  ██║██║  ██║╚██████╗██║  ██║    ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗ ##
## ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝ ##
##                                                                            ##
## Author: eris-os                                                            ##
## Github: https://github.com/eris-os                                         ##
################################################################################



logotype () {
    clear
    echo ""
    echo "  █████╗ ██████╗  ██████╗██╗  ██╗    ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗"
    echo " ██╔══██╗██╔══██╗██╔════╝██║  ██║    ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝"
    echo " ███████║██████╔╝██║     ███████║    ██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝"
    echo " ██╔══██║██╔══██╗██║     ██╔══██║    ██║     ██║██║╚██╗██║██║   ██║ ██╔██╗"
    echo " ██║  ██║██║  ██║╚██████╗██║  ██║    ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗"
    echo " ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝    ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝"
    echo "|--------------------------------------------------------------------------|"
    echo "|                           Author: eris-os                                |"
    echo "|                     Github: https://github.com/eris-os                   |"
    echo "|--------------------------------------------------------------------------|"
    echo ""
}


log_message () {
    local LEVEL="$1"
    shift
    local MESSAGE="$@"

    case "$LEVEL" in
        INFO)
            echo -e "\e[32m[INFO]\e[0m $MESSAGE \n"
            ;;
        WARN)
            echo -e "\e[33m[WARN]\e[0m $MESSAGE \n"
            ;;
        ERROR)
            echo -e "\e[31m[ERROR]\e[0m $MESSAGE \n"
            ;;
        SUGGESTION)
            echo -e "\e[34m[!]\e[0m $MESSAGE"
            ;;
        CONFIRMATION_ERROR)
            echo -e "\e[31m[X]\e[0m $MESSAGE \n"
            ;;
        *)
            echo -e "\e[34m[LOG]\e[0m $MESSAGE \n"
            ;;
     
    esac
}


prompt_input() {
    local PROMPT="$1"
    local VARIABLE_NAME="$2"
    local INPUT

    while true; do
        read -p "$PROMPT" INPUT
        if [[ -n "$INPUT" ]]; then
            eval "$VARIABLE_NAME='$INPUT'"
            break
        else
            echo "Input cannot be empty. Please try again."
        fi
    done
}


prompt_password(){
  local PROMPT="$1"
  local VARIABLE_NAME="$2"
  local PASSWORD
  local PASSWORD_CONFIRM

  while true; do
    read -s -p "$PROMPT " PASSWORD
    echo

    read -s -p "Confirm password: " PASSWORD_CONFIRM
    echo

    # Check if password is empty
    if [[ -z "$PASSWORD" ]]; then
      log_message ERROR "Password cannot be empty. Please try again."
      continue
    fi

    # Check if passwords match
    if [[ "$PASSWORD" != "$PASSWORD_CONFIRM" ]]; then
      log_message ERROR "Passwords do not match. Please try again."
      continue
    fi

    eval "$VARIABLE_NAME='$PASSWORD'"
    break
  done
}


prompt_yes_no() {
    local PROMPT="$1"
    local VARIABLE_NAME="$2"
    local RESPONSE

    while true; do
        read -p "$PROMPT [y/n]: " RESPONSE
        case "$RESPONSE" in
            [yY][eE][sS]|[yY])
                eval "$VARIABLE_NAME='yes'"
                break
                ;;
            [nN][oO]|[nN]|'')
                eval "$VARIABLE_NAME='no'"
                break
                ;;
            *)
                echo "Invalid response. Please enter 'y' or 'n'."
                ;;
        esac
    done
}


section_header() {
    local TITLE="$1"
    echo    "|--------------------------------------------------------------------------|"
    echo -e "\e[96m                           $TITLE                                \e[0m" 
    echo    "|--------------------------------------------------------------------------|"
}


section_subheader() {
    local SUBTITLE="$1"
    echo -e "\e[35m$SUBTITLE\e[0m"
}
