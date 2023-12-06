# Path Management Script

This script allows users to interactively add or delete paths from the `PATH` environment variable for both Zsh (`~/.zshrc`) and Bash (`~/.bashrc`). The script prompts the user to choose their operating system and then provides options for manipulating the `PATH` variable.

## Usage
---
**Setup to run from anywhere in the system.**
```bash
# Clone the repository
git clone https://github.com/m14r41/LinuxEnv
cd LinuxEnv
chmod +x LinuxEnv.sh
mv LinuxEnv.sh LinuxEnv
sudo mv LinuxEnv /usr/local/bin
cd ..
rm -rf LinuxEnv
```
## Screnshoot After Setup
![image](https://github.com/m14r41/LinuxEnv/assets/95265573/ab9077ce-0e51-4e88-899c-1039172450fc)

---
## Screnshoot for Linux

![image](https://github.com/m14r41/LinuxEnv/assets/95265573/e8b3da08-b88d-4056-a95f-b4ba1b8639c2)

## Screnshoot for Parrot OS
![image](https://github.com/m14r41/LinuxEnv/assets/95265573/86bbbee3-aaac-464f-9791-9dc74f1c4432)

---

## Features

1. **Colorful Output:**
   - The script uses color codes for better visibility, including green for success, red for errors, yellow for prompts, and blue for informational messages.

2. **ASCII Art:**
   - The script begins with an ASCII art representation of a Linux terminal, providing a visually appealing introduction.

3. **Add and Delete Paths:**
   - Allows the user to add a new path to the `PATH` variable or delete an existing path for both Zsh and Bash.

4. **Input Validation:**
   - Checks whether the specified directory exists before adding or deleting a path.
   - Provides error messages if the specified directory does not exist.

5. **Interactive Shell Check:**
   - Checks if the shell is running interactively before sourcing the configuration file (`.zshrc` or `.bashrc`) to avoid errors when executed non-interactively.

6. **Operating System Choice:**
   - Asks the user to choose their operating system (Kali Linux or Parrot OS) at the beginning of the script.
   - Routes the user to the appropriate section based on their operating system choice.

7. **Dynamic Menus:**
   - Presents dynamic menus based on the user's choice, allowing them to choose between adding or deleting a path.

8. **Readable Code Structure:**
   - The code is well-structured with functions for each major task, improving readability and maintainability.
   - The script is divided into logical sections for Zsh and Bash operations.

9. **Error Handling:**
   - Provides clear error messages in case of invalid choices, non-existent directories, or issues with configuration files.

10. **Interactive User Prompts:**
    - Uses `read` to interactively prompt the user for input, enhancing the user experience.

11. **Operating System Validation:**
    - Checks the user's choice for the operating system and handles errors for invalid choices.

12. **User and Author Information:**
    - Displays the author's name (Madhurendra Kumar) and a tag (m14r41) in the ASCII art section.

---


**Note:**
Ensure that you have appropriate permissions to modify the configuration files (`~/.zshrc` or `~/.bashrc`).
