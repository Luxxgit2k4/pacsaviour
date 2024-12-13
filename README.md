
# PacSaviour

A saviour who manages your package.

---

## Introduction

PacSaviour automates your command line operations which  aims to make system maintenance on Arch Linux hassle-free by:
- **Optimizing Mirrors**: Automatically selects the best 10 fastest mirrors, based on the user's choice with their desired country. Your previous mirrorlist is backed up and stored, so you can revert back into it.
- **Cleaning Up Packages**: Removes unused cache files and orphaned packages.
- **Updating the System**: Ensures your system is always up-to-date.

With PacSaviour, you can focus more on using your system and less on maintaining it.

---

## Prerequisites

Before installing and using PacSaviour, ensure you have the following:
- **Arch Linux or Arch-based Distribution**: The tool is specifically built for Arch-based systems.
- **Root Privileges**: The script requires `sudo` to perform system-level operations.
- **Reflector**: Make sure reflector is installed which is used for optimizing the mirros.

---

## Installation

PacSaviour is available on the Arch User Repository (AUR). You can install it using an AUR helper such as `yay` or `paru`.

### Using yay
 Install PacSaviour:
   ```bash
   yay -S pacsaviour
   ```

### Manual installation:

   Clone this repository
```bash
git clone https://github.com/Luxxgit2k4/pacsaviour  
```
And make all the .sh files executable using chmod +x.
Then run the main.sh, you will see the help menu and using the commands from the help you can run the project.
```bash
./main.sh
```
---

## Usage

You can run the default pacSaviour command to see the help menu.
The commands are also mentioned below:

### Command-Line Options
- `--help`: Display help menu.
- `-i`: Launch the interactive menu.
- `-mi`: Optimize mirrors.
- `-pc`: Clean package cache and remove orphans.
- `-up`: Update the system.

---

## Technology Used

PacSaviour is built using:
- **Bash Scripting**: The entire tool is implemented as a Bash script for simplicity and efficiency on Arch-based systems.
- **Pacman**: The core package manager for Arch Linux, used for managing system packages.
- **Shell Utilities**: Leveraging standard Linux utilities for file operations, logging, and process handling.

---

## Contributing

We welcome contributions to improve PacSaviour!

### How to Contribute
1. Fork the repository on GitHub.
2. Clone your forked repository:
   ```bash
   git clone https://github.com/Luxxgit2k4/pacsaviour.git
   ```
3. Create a new branch for your feature:
   ```bash
   git checkout -b feature-name
   ```
4. Commit your changes:
   ```bash
   git commit -m "Add the message"
   ```
5. Push the changes to your fork:
   ```bash
   git push origin feature-name
   ```
6. Open a pull request in the main repository.


---

## License

PacSaviour is licensed under the MIT License.

You can find the full license text in the [LICENSE](LICENSE) file.

---


