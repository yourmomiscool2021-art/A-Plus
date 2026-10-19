
# CompTIA A+ Core 2 Automation: System Health Check

## Project Overview
This repository contains a beginner-friendly PowerShell script (`System-Health-Check.ps1`) designed to automate routine Windows system administration tasks. I built this project while studying for my **CompTIA A+ Core 2 (220-1102) certification** to demonstrate practical knowledge of operating system maintenance, scripting basics, and security management.

## Core 2 Objectives Covered
* **Operating Systems (Objective 1.0):** Utilizing administrative tools and command-line interfaces (PowerShell).
* **Security (Objective 2.0):** Enforcement of User Account Control (UAC) / Administrator privilege checks.
* **Troubleshooting (Objective 3.0):** Utilizing system verification tools (`sfc`) and network connectivity tests (`ping`).

## Features
1. **Privilege Verification:** Checks if the script session is running with elevated privileges (Run as Administrator) before executing.
2. **Network Connectivity Test:** Pings a public DNS server to verify if the network stack and external connectivity are operating normally.
3. **Storage Hardware Check:** Queries the Windows Management Instrumentation (WMI) framework to read the status of physical storage drives.
4. **File Integrity Scan:** Executes the System File Checker command with the `/verifyonly` switch to look for OS corruption without altering system states unexpectedly.

## How to Run
1. Download the `System-Health-Check.ps1` file.
2. Open PowerShell as an Administrator.
3. Execute the script using: `./System-Health-Check.ps1`
