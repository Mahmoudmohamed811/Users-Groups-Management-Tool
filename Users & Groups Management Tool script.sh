#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

check_error() {
    if [ $? -ne 0 ]; then
        echo -e "${RED}Error: $1${NC}"
        sleep 1
        return 1
    fi
}

display_main_menu() {
    echo -e "${BLUE}${BOLD}===============================================${NC}"
    echo -e "${BLUE}${BOLD} Please select an operation:${NC}"
    echo -e "${BLUE}${BOLD}===============================================${NC}"
    echo -e "${BLUE}1) User Management${NC}"
    echo -e "${BLUE}2) Group Management${NC}"
    echo -e "${BLUE}3) Exit${NC}"
}

user_management_menu() {
    echo -e "${BLUE}${BOLD}>>> You have selected User Management${NC}"
    while true; do
        echo -e "${BLUE}Please select an option:${NC}"
        echo -e "${BLUE}1. Add User${NC}"
        echo -e "${BLUE}2. Delete User${NC}"
        echo -e "${BLUE}3. Back to Main Menu${NC}"
        echo -e "${BLUE}${BOLD}===============================================${NC}"
        read -p "$(echo -e ${YELLOW}Your choice: ${NC})" user_choice
        case $user_choice in
            1) add_user ;;
            2) delete_user ;;
            3)
                echo -e "${YELLOW}Returning to Main Menu...${NC}"
                sleep 1
                clear
                break
            ;;
            *)
                echo -e "${RED}Invalid choice, please try again.${NC}"
            ;;
        esac
        sleep 1
        clear
    done
}

add_user() {
    echo -e "${YELLOW}Enter username to add:${NC}"
    read username
    useradd $username
    check_error "Failed to add user '$username'." || return 1
    echo -e "${YELLOW}Enter password to add:${NC}"
    read -s password
    echo "$password" | passwd --stdin $username
    check_error "Failed to set password for user '$username'." || return 1
    echo -e "${GREEN}User $username added.${NC}"
}

delete_user() {
    echo -e "${YELLOW}Enter username to delete:${NC}"
    read username
    userdel $username -r
    check_error "Failed to delete user '$username'." || return 1
    echo -e "${GREEN}User $username deleted.${NC}"
}

group_management_menu() {
    while true; do
        echo -e "${BLUE}Please select an option:${NC}"
        echo -e "${BLUE}1. Add Group${NC}"
        echo -e "${BLUE}2. Delete Group${NC}"
        echo -e "${BLUE}3. Rename Group${NC}"
        echo -e "${BLUE}4. Back to Main Menu${NC}"
        echo -e "${BLUE}${BOLD}===============================================${NC}"
        read -p "$(echo -e ${YELLOW}Your choice: ${NC})" group_choice
        case $group_choice in
            1) add_group ;;
            2) delete_group ;;
            3) rename_group ;;
            4)
                echo -e "${YELLOW}Returning to Main Menu...${NC}"
                sleep 1
                clear
                break
            ;;
            *)
                echo -e "${RED}Invalid choice, please try again.${NC}"
            ;;
        esac
        sleep 1
        clear
    done
}

add_group() {
    echo -e "${YELLOW}Enter group name to add:${NC}"
    read groupname
    groupadd $groupname
    check_error "Failed to add group '$groupname'." || return 1
    echo -e "${GREEN}Group $groupname added.${NC}"
}

delete_group() {
    echo -e "${YELLOW}Enter group name to delete:${NC}"
    read groupname
    groupdel $groupname
    check_error "Failed to delete group '$groupname'." || return 1
    echo -e "${GREEN}Group $groupname deleted.${NC}"
}

rename_group() {
    echo -e "${YELLOW}Enter current group name to rename:${NC}"
    read current_groupname
    echo -e "${YELLOW}Enter new group name:${NC}"
    read new_groupname
    groupmod -n $new_groupname $current_groupname
    check_error "Failed to rename group '$current_groupname' to '$new_groupname'." || return 1
    echo -e "${GREEN}Group $current_groupname renamed to $new_groupname.${NC}"
}

exit_script() {
    clear
    echo -e "${YELLOW}Exiting the script. Goodbye!${NC}"
    sleep 1
    clear
    echo -e "${BLUE}${BOLD}===============================================${NC}"
    echo -e "${BLUE}${BOLD}Thank you for using the Users & Groups Management Tool.${NC}"
    echo -e "${BLUE}${BOLD}===============================================${NC}"
    exit 0
}

# Main script
echo -e "${BLUE}${BOLD}===============================================${NC}"
echo -e "${BLUE}${BOLD} Welcome to the Users & Groups Management Tool ${NC}"
echo -e "${BLUE}${BOLD}===============================================${NC}"

PS3="$(echo -e ${YELLOW}please Enter the operation you want to perform: ${NC})"
select choice in "User Management" "Group Management" "Exit"; do
    case $choice in
        "User Management")
            clear
            user_management_menu
        ;;
        "Group Management")
            clear
            group_management_menu
        ;;
        "Exit")
            exit_script
        ;;
        *)
            echo -e "${RED}Invalid choice, please try again.${NC}"
        ;;
    esac
    display_main_menu
done