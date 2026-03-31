# 🐍 Open Source Software Capstone Project
### Auditing Python | Bash Scripting Suite for Ubuntu / WSL

---

| Field               | Details                              |
|---------------------|--------------------------------------|
| **Student Name**    | [Friend's Name]                      |
| **Registration No** | [Friend's Reg No]                    |
| **Course**          | Open Source Software (Auditing Python)|
| **Environment**     | Ubuntu / Windows Subsystem for Linux (WSL) |
| **Language**        | Bash (Shell Scripting)               |

---

## 📋 Project Overview

This project consists of **five Bash scripts** written for an Ubuntu/WSL environment as part of a Capstone Project for the Open Source Software course. Each script demonstrates a core Linux/OSS concept — from system introspection and package management to log analysis and user interaction.

---

## 📁 File Structure

```
capstone_project/
├── 01_system_identity.sh    # Script 1 — System Identity Report
├── 02_package_inspector.sh  # Script 2 — Package Inspector (Python3)
├── 03_directory_auditor.sh  # Script 3 — Directory Auditor
├── 04_log_analyzer.sh       # Script 4 — Log File Analyzer
├── 05_oss_quiz.sh           # Script 5 — Interactive OSS Quiz
└── README.md                # This file
```

---

## ⚙️ Prerequisites

- Ubuntu 20.04+ **or** Windows Subsystem for Linux (WSL2)
- Bash shell (`/bin/bash`)
- Standard GNU coreutils (`uname`, `stat`, `du`, `uptime`)
- `dpkg` (pre-installed on all Debian/Ubuntu systems)

> No additional software installation is required.

---

## 🚀 How to Run the Scripts

### Step 1 — Make all scripts executable

Open your terminal and navigate to the project folder:

```bash
cd capstone_project
chmod +x *.sh
```

### Step 2 — Run each script individually

---

### Script 1 — System Identity Report
**File:** `01_system_identity.sh`  
**Purpose:** Displays the Linux distribution name, kernel version, current user, system uptime, and OS license information.

```bash
bash 01_system_identity.sh
```

**Sample Output:**
```
============================================
         SYSTEM IDENTITY REPORT
============================================

[ DISTRIBUTION ]
  Pretty Name : Ubuntu 22.04.3 LTS

[ KERNEL ]
  Release      : 5.15.90.1-microsoft-standard-WSL2

[ CURRENT USER ]
  Username : student

[ SYSTEM UPTIME ]
  up 2 hours, 34 minutes

[ OS LICENSE ]
  License Type : GNU General Public License v2 (GPL-2)
```

---

### Script 2 — Package Inspector
**File:** `02_package_inspector.sh`  
**Purpose:** Uses `dpkg` to check whether Python3 is installed and prints its version details from both the package database and the runtime binary.

```bash
bash 02_package_inspector.sh
```

**Sample Output:**
```
[ CHECKING PACKAGE: python3 ]

  Status       : INSTALLED ✔
  dpkg Version : 3.10.6-1~22.04
  Runtime      : Python 3.10.6
  Binary Path  : /usr/bin/python3
```

---

### Script 3 — Directory Auditor
**File:** `03_directory_auditor.sh`  
**Purpose:** Uses a `for` loop to audit four key system directories — `/etc`, `/var/log`, `/usr/bin`, and `/etc/python3` — reporting their disk size, read permission, write permission, owner, and octal permission code.

```bash
bash 03_directory_auditor.sh
```

> **Note:** `/etc/python3` may not exist on all Ubuntu versions. The script handles this gracefully and reports `NOT FOUND`.

**Sample Output:**
```
  DIRECTORY            SIZE       READABLE   WRITABLE   PERMISSIONS
  ---------            ----       --------   --------   -----------
  /etc                 2.4M       YES ✔      NO  ✘      drwxr-xr-x (755)
  /var/log             18M        YES ✔      NO  ✘      drwxrwxr-x (775)
  /usr/bin             168M       YES ✔      NO  ✘      drwxr-xr-x (755)
  /etc/python3         8.0K       YES ✔      NO  ✘      drwxr-xr-x (755)
```

---

### Script 4 — Log File Analyzer
**File:** `04_log_analyzer.sh`  
**Purpose:** Uses a `while` loop to read `/var/log/dpkg.log` line by line, searching for the keyword `install`. It prints the **last 5 matching entries** and provides a summary count of install, remove, and upgrade actions.

```bash
bash 04_log_analyzer.sh
```

> **Note:** If the log file is unreadable, try running with `sudo`:
> ```bash
> sudo bash 04_log_analyzer.sh
> ```

**Sample Output:**
```
  Lines scanned        : 1482
  Total matches found  : 312

[ LAST 5 MATCHING ENTRIES ]
  [1] 2024-11-01 10:22:31 install python3:amd64 <none> 3.10.6-1
  [2] 2024-11-01 10:22:32 install python3-pip:amd64 <none> 22.0.2
  ...
```

---

### Script 5 — Interactive OSS Quiz
**File:** `05_oss_quiz.sh`  
**Purpose:** Asks the user **3 questions** about Open Source Software. Answers are saved to a timestamped `.txt` file in the current directory and reviewed on screen after submission.

```bash
bash 05_oss_quiz.sh
```

**Questions asked:**
1. What do you understand by the term "Open Source Software"? Give an example.
2. Name TWO popular Open Source licenses and describe what each permits.
3. How does Python demonstrate the principles of Open Source Software development?

**Output file format:** `oss_quiz_answers_YYYYMMDD_HHMMSS.txt`

---

## 🔑 Key Concepts Demonstrated

| Script | Concepts Covered |
|--------|-----------------|
| System Identity | `/etc/os-release`, `uname`, `uptime`, `whoami`, OS licenses |
| Package Inspector | `dpkg -s`, `dpkg -l`, package versioning, `command -v` |
| Directory Auditor | `for` loop, `du`, `stat`, file permissions, `-r`/`-w`/`-x` tests |
| Log Analyzer | `while read` loop, arrays, `grep`, log parsing, `/var/log/dpkg.log` |
| OSS Quiz | `read`, `>>`  redirection, `date`, timestamped file output |

---

## 📝 Notes for Submission

- All scripts are self-contained and require no external dependencies.
- Scripts have been tested on **Ubuntu 22.04 LTS** and **WSL2 (Windows 11)**.
- The `for` loop in Script 3 and `while` loop in Script 4 satisfy the explicit loop-usage requirements.
- Script 5 dynamically creates a new `.txt` file per run using a timestamp — no file is ever overwritten.

---

## 📜 License

This project was created for academic purposes under the Open Source Software course.  
Scripts are provided under the **MIT License** — free to use, modify, and distribute with attribution.

---

*Submitted as part of the Capstone Project requirement.*  
*Course: Open Source Software (Auditing Python)*
