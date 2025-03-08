#!/bin/bash

# Script to assist with updating macOS using OpenCore Legacy Patcher
# For 2011 iMacs running macOS with OCLP

# Path to OCLP app - update if it's installed elsewhere
OCLP_PATH="/Applications/OpenCore-Patcher-GUI.app"

# Colors for better readability
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if OCLP is installed
if [ ! -d "$OCLP_PATH" ]; then
    echo -e "${RED}Error: OpenCore-Patcher-GUI.app not found in Applications folder.${NC}"
    echo "Please download OCLP from: https://github.com/dortania/OpenCore-Legacy-Patcher/releases/"
    exit 1
fi

# Function to create backup
create_backup() {
    echo -e "${YELLOW}[IMPORTANT] Before proceeding, ensure you have a recent Time Machine backup.${NC}"
    read -p "Do you have a recent backup? (y/n) " has_backup
    
    if [ "$has_backup" != "y" ]; then
        echo -e "${RED}Please create a backup before continuing.${NC}"
        echo "This script will now exit. Run it again after creating a backup."
        exit 1
    fi
}

# Function to guide through OCLP update process
update_oclp() {
    echo -e "${GREEN}=== Step 1: Updating OpenCore ===${NC}"
    echo "1. Opening OpenCore Legacy Patcher..."
    open "$OCLP_PATH"
    
    echo -e "${YELLOW}Please complete these steps in the OCLP application:${NC}"
    echo "  1. Go to 'Settings' and check 'Create EFI backups'"
    echo "  2. Go to 'Build and Install OpenCore'"
    echo "  3. Select your 2011 iMac model"
    echo "  4. Click 'Build OpenCore'"
    echo "  5. When prompted, select 'Install to internal disk'"
    
    read -p "Press Enter when you have completed these steps... "
}

# Function to guide through system update process
system_update() {
    echo -e "${GREEN}=== Step 2: System Update ===${NC}"
    echo -e "${YELLOW}Please restart your Mac and then:${NC}"
    echo "  1. Go to System Preferences → Software Update"
    echo "  2. Install all available updates"
    echo "  3. Allow your Mac to restart after updates"
    
    read -p "Have you completed the updates and restarted? (y/n) " completed_updates
    
    if [ "$completed_updates" != "y" ]; then
        echo "Please complete the updates and run this script again for post-update patches."
        exit 0
    fi
}

# Function to guide through post-update patching
post_update_patch() {
    echo -e "${GREEN}=== Step 3: Post-Update Patches ===${NC}"
    echo "Opening OpenCore Legacy Patcher for post-install patches..."
    open "$OCLP_PATH"
    
    echo -e "${YELLOW}Please complete these steps in the OCLP application:${NC}"
    echo "  1. Click on 'Post-Install Root Patch'"
    echo "  2. Select needed patches (typically Graphics, WiFi, Bluetooth)"
    echo "  3. Click 'Start patching' and enter your password when prompted"
    echo "  4. Restart your Mac when patching is complete"
    
    read -p "Press Enter when you have completed these steps... "
}

# Main menu
main_menu() {
    clear
    echo -e "${GREEN}==== iMac 2011 OpenCore Update Assistant ====${NC}"
    echo "This script will help you update your macOS using OpenCore Legacy Patcher."
    echo ""
    echo "Please select an option:"
    echo "1. Complete update process (all steps)"
    echo "2. Update OpenCore only"
    echo "3. Apply post-update patches only"
    echo "4. Exit"
    
    read -p "Enter your choice (1-4): " choice
    
    case $choice in
        1)
            create_backup
            update_oclp
            system_update
            post_update_patch
            ;;
        2)
            create_backup
            update_oclp
            ;;
        3)
            post_update_patch
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Please try again.${NC}"
            sleep 1
            main_menu
            ;;
    esac
}

# Start the script
main_menu

echo -e "${GREEN}Update process complete!${NC}"
echo "Remember to check that everything is working correctly."
echo "If you encounter issues, you can use OCLP's 'OpenCore Debugging' option."
