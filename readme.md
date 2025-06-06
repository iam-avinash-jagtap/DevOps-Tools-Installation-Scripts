# DevOps Tools Installation Scripts
This repository contains automated installation scripts for 15+  popular DevOps tools, tailored specifically for **Amazon Linux 2023** and **Ubuntu 24.04** operating systems. Each script installs a single tool with necessary permissions and configurations to get you started quickly.

---

## Knowledge Required

To successfully use these installation scripts, users should have the following basic knowledge:

- **Basic Linux command line skills**:  
  Familiarity with terminal commands such as `cd`, `chmod`, `sudo`, and running shell scripts.

- **Understanding of user permissions and groups**:  
  Knowing how `sudo` works and why some scripts add users to groups (e.g., Docker group) for permission management.

- **SSH and remote server access**:  
  Ability to connect to Linux servers remotely using SSH.

- **Basic networking and internet connectivity**:  
  Ensuring the machine can access external repositories and download required packages.

- **Familiarity with the tools**:  
  Knowing what the installed DevOps tools do and why you want them will help verify installation success and troubleshoot issues.

- **Ability to read and follow instructions carefully**:  
  Some tools may require logging out and back in or restarting the system after installation.

---

This knowledge will help you avoid common pitfalls and make the most out of the installation scripts.


---

## How to Use the Scripts

Follow these steps to install your desired DevOps tools:

### 1: Connect to your Linux server

Use SSH or your preferred terminal to connect to your server where you want to install the tools.

```bash
ssh your-user@your-server-ip
```
### 2: Clone this repository on your server
```bash
git clone 
```
---
### 3: Navigate to the folder with scripts
```bash
cd /amazon-linux-2023
# or
cd /ubuntu-24.04
```
---
### 4: Make the script executable
```bash
chmod +x install_<toolname>_ubuntu.sh
# or for Amazon Linux scripts
chmod +x install_<toolname>_amazonlinux.sh
```
---
### 5: Run the installation script with sudo
```bash
sudo ./install_<toolname>_ubuntu.sh
# or
sudo ./install_<toolname>_amazonlinux.sh
```
---
### 6: Verify installation
Each script ends with instructions or a command to verify the tool was installed successfully.

---
## Summary
This repo automates the installation of 18 essential DevOps tools for Amazon Linux 2023 and Ubuntu 24.04.

Ensure you run the appropriate script for your operating system.

Grant execution permission to scripts before running them.

Use sudo to execute the scripts for proper installation.

Check tool versions after installation to confirm success.

Feel free to contribute or raise issues if you face any problems!

***Happy DevOps Learning ! with Avinash Jagtap 🚀***