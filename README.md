
# Users & Groups Management Tool

## Overview

This Bash script provides a simple, interactive command-line tool for managing users and groups on a Linux system. It allows administrators to add, delete, and rename groups, as well as add and delete users, with basic error checking and a color-coded interface for improved usability.

## Features

- **User Management**:
  - Add a new user with a username and password.
  - Delete an existing user and their home directory.
- **Group Management**:
  - Add a new group.
  - Delete an existing group.
  - Rename an existing group.
- **Visual Feedback**:
  - Blue headers and menu options for clarity.
  - Yellow prompts and transitional messages for user interaction.
  - Green success messages for completed actions.
  - Red error messages for failures or invalid inputs.
- **Error Handling**: Basic checks for command failures (e.g., `useradd`, `groupdel`) with descriptive error messages.
- **Interactive Menus**: Easy navigation using `select` for the main menu and `read` for sub-menus.

## Requirements

- **Operating System**: Linux (tested on systems supporting `useradd`, `userdel`, `passwd --stdin`, `groupadd`, `groupdel`, and `groupmod`).
- **Permissions**: Must be run as root (e.g., via `sudo`) to perform user and group operations.
- **Terminal**: A terminal supporting ANSI color codes for proper display of colored and bold text.

## Installation

1. **Download the Script**:
   - Clone the repository or download the script file (e.g., `users_groups_management.sh`):
     ```bash
     git clone <repository-url>
     ```
2. **Make Executable**:
   - Set execute permissions for the script:
     ```bash
     chmod +x users_groups_management.sh
     ```
3. **Run the Script**:
   - Execute the script with root privileges:
     ```bash
     sudo ./users_groups_management.sh
     ```

## Usage

1. **Launch the Script**:
   - Run the script with `sudo` to see the main menu:
     ```
     ===============================================
      Welcome to the Users & Groups Management Tool
     ===============================================
     please Enter the operation you want to perform:
     1) User Management
     2) Group Management
     3) Exit
     ```
2. **Main Menu Options**:
   - **1) User Management**: Manage user accounts.
   - **2) Group Management**: Manage groups.
   - **3) Exit**: Exit the script.
3. **User Management Menu**:
   - **1. Add User**: Prompts for a username and password, then creates the user.
   - **2. Delete User**: Prompts for a username and deletes the user and their home directory.
   - **3. Back to Main Menu**: Returns to the main menu.
4. **Group Management Menu**:
   - **1. Add Group**: Prompts for a group name and creates it.
   - **2. Delete Group**: Prompts for a group name and deletes it.
   - **3. Rename Group**: Prompts for current and new group names, then renames the group.
   - **4. Back to Main Menu**: Returns to the main menu.
5. **Error Handling**:
   - If a command fails (e.g., user already exists, group doesn’t exist), an error message is displayed in red.
   - Invalid menu choices display a red warning.

## Example

- **Adding a User**:
  ```
  >>> You have selected User Management
  Please select an option:
  1. Add User
  2. Delete User
  3. Back to Main Menu
  ===============================================
  Your choice: 1
  Enter username to add: newuser
  Enter password to add: [hidden input]
  User newuser added.
  ```
- **Deleting a Group**:
  ```
  Please select an option:
  1. Add Group
  2. Delete Group
  3. Rename Group
  4. Back to Main Menu
  ===============================================
  Your choice: 2
  Enter group name to delete: testgroup
  Group testgroup deleted.
  ```

## Functions

- **`check_error`**: Checks the exit status of the last command and displays a red error message if it fails.
- **`display_main_menu`**: Displays the main menu with blue, bold formatting.
- **`user_management_menu`**: Presents the user management submenu and handles user-related operations.
- **`add_user`**: Prompts for a username and password, then adds the user.
- **`delete_user`**: Prompts for a username and deletes the user with their home directory.
- **`group_management_menu`**: Presents the group management submenu and handles group-related operations.
- **`add_group`**: Prompts for a group name and creates it.
- **`delete_group`**: Prompts for a group name and deletes it.
- **`rename_group`**: Prompts for current and new group names, then renames the group.
- **`exit_script`**: Exits the script with a farewell message.

## Notes

- **Permissions**: Run as root (e.g., `sudo`) to avoid permission-related errors.
- **Portability**: The `passwd --stdin` command may not work on all systems (e.g., Debian/Ubuntu). Consider modifying to use `chpasswd` for broader compatibility.
- **Safety**: The `userdel -r` command deletes the user’s home directory—use with caution.
- **Colors**: Requires a terminal supporting ANSI escape codes for colored and bold output.

## Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make changes and test thoroughly.
4. Commit your changes (`git commit -m "Add feature XYZ"`).
5. Push to the branch (`git push origin feature-branch`).
6. Open a pull request.
