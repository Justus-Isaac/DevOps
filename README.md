# DEVOPS PROJECTS

# 1:DevOps - Server Performance Stats Monitor 

A lightweight, robust Bash script designed to analyze and report critical server performance statistics in real-time. This project is part of a series of DevOps tooling and automation utilities aimed at system administration and health monitoring.

---

## Features Monitored

The `server-stats.sh` script collects and displays the following system metrics:

1. **CPU Usage:** Calculates total CPU utilization percentage by taking two snapshots of `/proc/stat` with a 1-second interval.
2. **Memory Usage:** Reports total, used, and free RAM percentages using `free`.
3. **Disk Usage:** Analyzes overall disk storage utilization across mounted filesystems (excluding virtual/temporary file systems).
4. **Top CPU-Consuming Processes:** Lists the top 5 processes currently consuming the highest CPU resources.
5. **Top Memory-Consuming Processes:** Lists the top 5 processes currently consuming the highest RAM.

---

## Prerequisites

* **Operating System:** Linux (Ubuntu/Debian-based or any standard Linux distribution with `/proc/stat` support).
* **Core Utilities:** `awk`, `free`, `df`, `ps`, and `head`.

---

## Getting Started

### 1. Clone the Repository
```bash
git clone [https://github.com/Justus-Isaac/DevOps.git](https://github.com/Justus-Isaac/DevOps.git)
cd DevOps/server-stats
