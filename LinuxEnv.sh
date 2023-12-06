#!/bin/bash

# Colors for better output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# ASCII art
echo -e "${BLUE}
 _     _                  _____            
| |   (_)_ __  _   ___  _| ____|_ ____   __
| |   | | '_ \| | | \ \/ /  _| | '_ \ \ / /
| |___| | | | | |_| |>  <| |___| | | \ V / 
|_____|_|_| |_|\__,_/_/\_\_____|_| |_|\_/  

    By: Madhurendra Kumar( m14r41 )     
${NC}"

# Function to add a path to PATH (for zshrc)
addPathZsh() {
    # Ask the user for a path to add to PATH
    read -p "Enter the path to add to PATH: " new_path

    # Check if the specified directory exists
    if [ ! -d "$new_path" ]; then
        echo -e "${RED}Error: Directory '$new_path' does not exist.${NC}"
        return
    fi

    # Add the path to .zshrc
    echo "export PATH=\$PATH:$new_path" >> ~/.zshrc

    # Check if the shell is interactive before using setopt
    if [[ -o interactive ]]; then
        # Source .zshrc to apply changes
        source ~/.zshrc
    fi

    # Display confirmation message
    echo -e "${YELLOW}Path '$new_path' has been added to PATH.${NC}"
    echo -e "${GREEN}Changes applied. You can now use the new path.${NC}"
}

# Function to delete a path from PATH (for zshrc)
delPathZsh() {
    # Check if .zshrc exists
    if [ -f ~/.zshrc ]; then
        # Display current PATH
        echo -e "${YELLOW}Current PATH:${NC}"
        echo $PATH

        # Ask the user for the path to delete from PATH
        read -p "Enter the path to delete from PATH: " path_to_delete

        # Check if the specified directory exists
        if [ ! -d "$path_to_delete" ]; then
            echo -e "${RED}Error: Directory '$path_to_delete' does not exist.${NC}"
            return
        fi

        # Remove the specified path from .zshrc using awk
        awk -v path="$path_to_delete" '$0 !~ path { print $0 }' ~/.zshrc > ~/.zshrc_temp
        mv ~/.zshrc_temp ~/.zshrc

        # Check if the shell is interactive before using setopt
        if [[ -o interactive ]]; then
            # Source .zshrc to apply changes
            source ~/.zshrc
        fi

        # Verify if the path has been successfully deleted
        if ! grep -q "export PATH=.*$path_to_delete" ~/.zshrc; then
            echo -e "${GREEN}Path '$path_to_delete' has been deleted from PATH.${NC}"
            echo -e "${GREEN}Changes applied. You can now use the updated PATH.${NC}"
        else
            echo -e "${RED}Error: Unable to delete the specified path from PATH.${NC}"
        fi
    else
        echo -e "${RED}Error: The .zshrc file does not exist.${NC}"
    fi
}


# Function to add a path to PATH (for bashrc)
addPathBash() {
    # Ask the user for a path to add to PATH
    read -p "Enter the path to add to PATH: " new_path

    # Check if the specified directory exists
    if [ ! -d "$new_path" ]; then
        echo -e "${RED}Error: Directory '$new_path' does not exist.${NC}"
        return
    fi

    # Add the path to .bashrc
    echo "export PATH=\$PATH:$new_path" >> ~/.bashrc

    # Source .bashrc to apply changes
    source ~/.bashrc

    # Display confirmation message
    echo -e "${YELLOW}Path '$new_path' has been added to PATH.${NC}"
    echo -e "${GREEN}Changes applied. You can now use the new path.${NC}"
}

# Function to delete a path from PATH (for bashrc)
delPathBash() {
    # Check if .bashrc exists
    if [ -f ~/.bashrc ]; then
        # Display current PATH
        echo -e "${YELLOW}Current PATH:${NC}"
        echo $PATH

        # Ask the user for the path to delete from PATH
        read -p "Enter the path to delete from PATH: " path_to_delete

        # Check if the specified directory exists
        if [ ! -d "$path_to_delete" ]; then
            echo -e "${RED}Error: Directory '$path_to_delete' does not exist.${NC}"
            return
        fi

        # Remove the specified path from .bashrc using awk
        awk -v path="$path_to_delete" '$0 !~ path { print $0 }' ~/.bashrc > ~/.bashrc_temp
        mv ~/.bashrc_temp ~/.bashrc

        # Source .bashrc to apply changes
        source ~/.bashrc

        # Verify if the path has been successfully deleted
        if ! grep -q "export PATH=.*$path_to_delete" ~/.bashrc; then
            echo -e "${GREEN}Path '$path_to_delete' has been deleted from PATH.${NC}"
            echo -e "${GREEN}Changes applied. You can now use the updated PATH.${NC}"
        else
            echo -e "${RED}Error: Unable to delete the specified path from PATH.${NC}"
        fi
    else
        echo -e "${RED}Error: The .bashrc file does not exist.${NC}"
    fi
}

# Determine the user's operating system
echo -e "${RED}Choose your operating system:${NC}"
echo -e "${BLUE}1. Kali Linux${NC}"
echo -e "${BLUE}2. Parrot OS${NC}"

read -p "Enter your choice (1 or 2): " os_choice

if [ "$os_choice" == "1" ]; then
    # Display menu for the user to choose (for zshrc)
    echo -e "${RED}Choose an option for Zsh:${NC}"
    echo -e "${BLUE}1. Add a path to PATH${NC}"
    echo -e "${BLUE}2. Delete a path from PATH${NC}"

    # Read user's choice
    read -p "Enter your choice (1 or 2): " choice_zsh

    # Perform action based on user's choice (for zshrc)
    case $choice_zsh in
        1)
            addPathZsh
            ;;
        2)
            delPathZsh
            ;;
        *)
            echo -e "${RED}Error: Invalid choice. Please choose 1 or 2.${NC}"
            ;;
    esac

elif [ "$os_choice" == "2" ]; then
    # Display menu for the user to choose (for bashrc)
    echo -e "${YELLOW}Choose an option for Bash:${NC}"
    echo -e "${BLUE}1. Add a path to PATH${NC}"
    echo -e "${BLUE}2. Delete a path from PATH${NC}"

    # Read user's choice
    read -p "Enter your choice (1 or 2): " choice_bash

    # Perform action based on user's choice (for bashrc)
    case $choice_bash in
        1)
            addPathBash
            ;;
        2)
            delPathBash
            ;;
        *)
            echo -e "${RED}Error: Invalid choice. Please choose 1 or 2.${NC}"
            ;;
    esac

else
    echo -e "${RED}Error: Invalid operating system choice.${NC}"
fi

