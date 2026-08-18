# OverTheWire Bandit Wargame Labs

Documentation, setup automation, and command walkthroughs for the [OverTheWire Bandit](https://overthewire.org/wargames/bandit/) wargame challenges. This repository tracks practical Linux command-line mastery, privilege escalation, file inspection, and shell scripting techniques.

---

## rerequisites & Local Environment

* **OS:** Linux / WSL2 (Ubuntu / Debian recommended)
* **Packages:** `openssh-client`, `tmux`, `git`, `netcat`, `nmap`, `curl`, `tar`, `gzip`, `bzip2`, `xxd`

---

## Quickstart & SSH Automation

To connect seamlessly to any Bandit level without manually specifying port, host, or user flags every time, configure your local SSH client:

### 1. SSH Client Configuration

Run the following commands in your local terminal to create and secure your SSH configuration:

```bash
# Ensure ~/.ssh exists with strict directory permissions
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Append automated host rule for OverTheWire Bandit levels
cat << 'EOF' >> ~/.ssh/config
Host bandit*
    HostName bandit.labs.overthewire.org
    Port 2220
    StrictHostKeyChecking accept-new
EOF

# Lock down config file permissions (enforced by OpenSSH)
chmod 600 ~/.ssh/config
```

### 2. How the Config Works

| Directive | Function |
| :--- | :--- |
| `Host bandit*` | Wildcard match for any command starting with `bandit` (e.g., `bandit0`, `bandit24`). |
| `HostName bandit.labs.overthewire.org` | Routes the target alias to the official Bandit server endpoint. |
| `Port 2220` | Automatically sets the non-standard SSH port to `2220`. |
| `StrictHostKeyChecking accept-new` | Accepts new host keys automatically while preventing Man-in-the-Middle changes. |

With this configured, connecting to any level requires only:

```bash
ssh bandit0@bandit0
# Default password for Level 0: bandit0
```
###Recommended Workflow with tmux

Using `tmux` allows simultaneous execution on the remote target alongside local note-taking and script staging:

```bash
# 1. Start a persistent tmux session
tmux new -s bandit

# 2. Split window horizontally:  Ctrl + b, then "
# 3. Split window vertically:    Ctrl + b, then %
# 4. Navigate between panes:     Ctrl + b, then [Arrow Keys]

```
### Repository Structure

```text
overthewire-bandit/
├── README.md
├── notes/
│   ├── level-00-to-05.md
│   ├── level-06-to-10.md
│   └── level-11-to-15.md
└── scripts/
    └── brute_force_pin.sh

```

### Level Index & Focus Areas

| Level Range | Core Concepts | Key Commands |
| :--- | :--- | :--- |
| **00 → 05** | Filesystem navigation, hidden files, special characters, spaces in filenames | `cat`, `ls -la`, `file`, `find` |
| **06 → 10** | Permissions, group ownership, human-readable strings, base64 decoding | `find -user -group -size`, `strings`, `base64` |
| **11 → 15** | ROT13 substitution, compressed data extraction, network sockets, SSL/TLS connections | `tr`, `xxd`, `gzip`, `tar`, `nc`, `openssl` |
| **16 → 20** | Port scanning, SSH private keys, setuid/setgid privilege escalation | `nmap`, `ssh -i`, `nc -lvnp` |
| **21 → 26** | Scheduled cron jobs, shell breakout techniques, PATH manipulation | `crontab`, `/etc/cron.d/`, `vim :set` |
| **27 → 34** | Git repository forensics, custom shells, restricted bash environments | `git log`, `git branch`, `chsh` |

---

### Security & Safe Practice Notice

> **Note:** Passwords and solved flags should be documented in local, gitignored files (`.gitignore`) to avoid publishing active CTF solutions directly to public repositories.
