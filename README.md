# 🐧 Hands-On Linux Systems Engineering & Security Portfolio

![Linux](https://img.shields.io/badge/OS-Ubuntu_24.04_LTS-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Platform](https://img.shields.io/badge/Environment-WSL2-0078D4?style=for-the-badge&logo=windows&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-GNU_Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![Status](https://img.shields.io/badge/Audit_Status-100%25_Verified-brightgreen?style=for-the-badge)

Production-grade Linux system administration, security auditing, log sanitization pipelines, and POSIX permissions configured and verified on **Ubuntu Linux**.

---

## Interactive Terminal Audit (Asciinema)

Click the player below to view the live verification audit inspecting active ACLs, Sticky Bit enforcement, and system telemetry:

[![asciicast](https://asciinema.org/a/FEjqMVAG87JN5yI2.svg)](https://asciinema.org/a/FEjqMVAG87JN5yI2)
*(Click above to play the interactive terminal recording)*

---

## Lab Roadmap & Module Matrix

### Phase 1: Core Systems & Security (Completed)
| ID | Module Name | Core Concepts & Utilities | Verification Artifacts | Status |
| :---: | :--- | :--- | :--- | :---: |
| **01** | **File Storage & Staging Cleanup** | Brace expansion (`{}`), `find`, `wc -l`, String safety | [Validation Script](./labs/01-file-storage) | `PASS` |
| **02** | **Log Sanitization Pipeline** | Here-Docs (`cat << 'EOF'`), `sed` regex (`[^"]*`), `grep` exit codes | [Sanitized Log Audit](./labs/02-log-sanitization) | `PASS` |
| **03** | **Special File Permissions** | SUID (`4000`), SGID (`2000`), Sticky Bit (`1000`) | [Security Audit](./labs/03-special-permissions) | `PASS` |
| **04** | **POSIX Access Control Lists** | `getfacl`, `setfacl`, ACL Mask ceiling, Default inherited ACLs (`d:`) | [ACL Manifest](./labs/04-posix-acls) | `PASS` |
| **05** | **Process Telemetry & Signals** | Background jobs (`&`), PIDs (`$!`), `ps aux`, `uptime`, `free -h`, `kill` | [Process Monitor](./labs/05-process-telemetry) | `PASS` |

### Phase 2: Advanced Linux Systems (Upcoming)
- [ ] **06:** Systemd Service Creation, Logging (`journalctl`), and Auto-Restart Policies
- [ ] **07:** Storage Management (LVM, Partitioning, Filesystems & Mounting)
- [ ] **08:** Linux Networking (IPTables / UFW Firewalls, SSH Hardening, Netstat/SS)
- [ ] **09:** Containerization Basics (Docker Runtime, Namespaces, Cgroups)

---

## Command Execution Log

Raw command execution outputs for completed labs are archived in [`scripts/completed_labs_history.log`](./scripts/completed_labs_history.log).

---
**Author:** Rohan Rathod  
**Role:** Systems & Software Engineering Student  
