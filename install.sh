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



# Get the path of the current script
SCRIPT_DIRECTORY="$(dirname "$(realpath "$0")")"


# Load common functions and variables
source "$SCRIPT_DIRECTORY/scripts/common.sh"


logotype


# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    log_message ERROR "This script must be run as root."
    exit 1
  else
    log_message INFO "Script is running with root privilegies."
fi


#Check if there is internet connection
if ping -q -c 4 -W 1 archlinux.org >/dev/null; then
  log_message INFO "Internet connection is available."
else
  log_message ERROR "There must be an active internet connection to run this script. Please check your network settings and try again."
  exit 1
fi


# Detect boot mode
if [[ -d /sys/firmware/efi/efivars ]]; then
  BOOT_MODE="UEFI"
  log_message INFO "Boot mode detected: UEFI"
else
  BOOT_MODE="BIOS"
  log_message INFO "Boot mode detected: BIOS"
fi


log_message INFO "Starting Arch Linux Installation Script..."
sleep 4


# Give execution permissions and call sub-script "options.sh"
chmod +x $SCRIPT_DIRECTORY/scripts/options.sh
$SCRIPT_DIRECTORY/scripts/options.sh


log_message INFO "Installation completed. Check log file for additional information."
