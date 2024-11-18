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
SCRIPT_DIR="$(dirname "$(realpath "$0")")"


# Load common functions and variables
source "$SCRIPT_DIR/common.sh"


#-------------------------#
# TIME ZONE CONFIGURATION #
#-------------------------#
logotype
section_header "Time Zone Configuration"
log_message SUGGESTION "To list available time zones run 'timedatectl list-timezones'."
echo ""
prompt_input "Enter your time zone (e.g., 'America/New_York'): " "TIMEZONE" validate_timezone
echo ""
log_message INFO "Time zone set to: $TIMEZONE"
sleep 2


#----------------------#
# LOCALE CONFIGURATION #
#----------------------#
logotype
section_header "Locale Configuration"
log_message SUGGESTION "You can list available locales in /etc/locale.gen"
echo ""
prompt_input "Enter your locale (e.g., 'en_US.UTF-8'): " "LOCALE" validate_locale
echo ""
log_message INFO "Locale set to: $LOCALE"
sleep 2


#------------------------#
# HOSTNAME CONFIGURATION #
#------------------------#
logotype
section_header "Hostname Configuration"
echo ""
prompt_input "Enter a hostname for your system: " "HOSTNAME" 
echo ""
log_message INFO "Hostname set to: $HOSTNAME"
sleep 2


#--------------------#
#   ROOT PASSWORD    #
#--------------------#
logotype
section_header "Root Password"
echo ""
prompt_password "Enter a password for root user: " ROOT_PASSWORD
log_message INFO "Root password has been set successfully."
sleep 2


#--------------------#
# USER CONFIGURATION #
#--------------------#
logotype
section_header "User Account Creation"
echo ""
prompt_yes_no "Do you want to create a non root user?" "CREATE_USER"
echo ""
