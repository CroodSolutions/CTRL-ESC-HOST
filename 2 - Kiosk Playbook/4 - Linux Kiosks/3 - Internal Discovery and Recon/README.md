## Introduction and Overview

So, you managed to get a shell on a Linux kiosk. Now what?

In a typical penetration test, you'd transfer tools like LinPEAS or a C2 beacon (e.g., Sliver or Cobalt Strike). However, kiosk engagements often have a smaller scope and tighter rules. When an administrator asks, "So what?", you need quick answers without complex tooling.

These simple, few-character oneliners allow you to quickly understand:
 - What network(s) is the host on and what can it reach?
 - Is it joined to an Active Directory domain or LDAP?
 - What services and interesting software are running?

**Key Point**: This guide is not a replacement for comprehensive tools. It's meant for quick, high-level recon using built-in Linux commands to answer basic questions in minutes.

## Basic Recon 

Most of these commands are standard on almost all Linux distributions (Ubuntu, Debian, RHEL, CentOS). 

### Basic Host Info

 - `uname -a` (kernel version and architecture)
 - `hostnamectl` (OS version, architecture, and virtualization info)
 - `cat /etc/*release` (detailed OS and version information)
 - `hostname`
 - `whoami`
 - `id` (shows UID, GID, and group memberships)
 - `groups`
 - `env` (check for interesting environment variables like `KIOSK_USER` or `DISPLAY`)

**Note**: If an EDR blocks `whoami` or `id`, try reading `/etc/passwd` directly: `grep $(whoami) /etc/passwd`.

### Passive Network Discovery

 - `ip addr` (all network interfaces and IP addresses)
 - `ip route` (view the routing table)
 - `ip neighbor` (equivalent to `arp -a`, shows the ARP cache)
 - `ss -tulnp` (list listening ports and associated processes; requires sudo for process names)
 - `netstat -rn` (routing table in classic format)
 - `cat /etc/resolv.conf` (DNS servers)
 - `cat /etc/hosts` (local host mappings)
 - `nmcli device show` (NetworkManager details, if available)

### Basic Account and Policy Enumeration

 - `cat /etc/passwd` (list all local users)
 - `getent passwd` (list all users, including those from AD/LDAP if joined)
 - `sudo -l` (check what commands the current user can run with sudo)
 - `last` (list last logged-in users)
 - `grep sudo /etc/group` (list users in the sudo/admin group)
 - `cat /etc/sudoers` (if readable, shows sudo policies)
 - `ls -l /etc/sudoers.d/`
 - `realm list` (check if the host is joined to an AD domain via SSSD)
 - `wbinfo -u` (list domain users if using Winbind)

## Identify Running / Interesting Software and Services

 - `ps aux` (list all running processes)
 - `top -n 1` (snapshot of running processes and system load)
 - `systemctl list-units --type=service --state=running` (list active systemd services)
 - `service --status-all` (list status of all services in older SysV init systems)
 - `ls -l /etc/systemd/system/` (list custom systemd service files)
 - `dpkg -l` (list installed packages on Debian/Ubuntu)
 - `rpm -qa` (list installed packages on RHEL/CentOS)
 - `ls /opt` (often contains third-party kiosk or management software)
 - `ps aux | grep -i "kiosk\|chrome\|firefox"` (identify the kiosk application itself)

## Mapped Drives and Reachable Shares

 - `lsblk` (list block devices and mount points)
 - `mount | column -t` (show all mounted filesystems in a readable format)
 - `df -h` (disk space usage and mount points)
 - `cat /etc/fstab` (static filesystem information and network mounts)
 - `smbclient -L localhost -N` (list local Samba shares, if smbclient is installed)
 - `showmount -e <IP>` (check for NFS exports on adjacent hosts)

## Examine Scheduled Tasks

 - `crontab -l` (list cron jobs for the current user)
 - `ls -R /etc/cron*` (list system-wide cron jobs)
 - `systemctl list-timers` (list systemd timers, the modern equivalent of cron)
 - `cat /etc/anacrontab`

## Active Sessions

 - `who` (who is currently logged in)
 - `w` (what users are doing)
 - `last -a` (last logins with hostnames)
 - `lastlog` (reports the most recent login of all users)

## Kiosk-Specific Enumeration

 - `cat /etc/X11/default-display-manager` (check which display manager is used, e.g., GDM, LightDM)
 - `ls /usr/share/xsessions` (available desktop sessions)
 - `cat ~/.xsession-errors` (might contain clues about kiosk app crashes or configs)
 - `ps aux | grep X` (identify the X server and its arguments)

## Credits

These Linux-specific tips have been curated and adapted for the CTRL+ESC+HOST project based on common Linux pentesting and hardening practices. 
 - [Christian Taillon](https://x.com/christian_tail)
 - [GTFOBins](https://gtfobins.github.io/) (for understanding potential breakouts)
