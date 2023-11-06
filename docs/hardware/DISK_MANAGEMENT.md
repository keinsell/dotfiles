# Disk Management Configuration Guide

The following is the disk configuration documentation for my personal setup. It's designed as a comprehensive guide to the storage architecture employed, optimized for performance and reliability, and caters to a dual-boot system with both Windows and Linux operating systems.

## System Overview

This configuration is tailored to exploit the full potential of the hardware it runs on. The principles guiding the setup include:

- **Performance:** Utilizing high-speed storage (`Nova`) for frequently used data to ensure quick system responses.
- **Data Handling:** Placing less frequently accessed data ("cold" data) on slower storage devices (`Terra`), reserving `Nova` for "hot" data that requires quick access.
- **Equilibrium:** Introducing a mid-tier storage solution (`Nebula`) that strikes a balance between speed and storage capacity.
- **Durability:** The `Nova` volume is not set up with RAID as it contains ephemeral and non-essential data, whereas `Nebula` and `Terra` ensure data redundancy.
- **Versatility:** Maintaining dual-boot capability with Windows for instances where Linux does not support specific software requirements.

## Storage Device Layout

### `NOVA` - High-Speed Primary Drive (2TB NVME Gen.5)

`Nova` is a top-tier NVME Gen.5 drive boasting speeds up to 13 GB/s, dedicated to the operating system and primary applications, with no RAID setup due to its transient data nature.

| Partition ID         | Partition Name                  | Filesystem | Size   | Mount Point  |
|----------------------|---------------------------------|------------|--------|--------------|
| `/dev/nvme0n1p1`     | Windows EFI Partition           | FAT32      | 105 MB | n/a          |
| `/dev/nvme0n1p2`     | Windows Reserved Partition      | NTFS       | 105 MB | n/a          |
| `/dev/nvme0n1p3`     | Windows Main Partition          | NTFS       | 300 GB | C:\          |
| `/dev/nvme0n1p4`     | Windows Recovery Partition      | NTFS       | 1 GB   | n/a          |
| ---                  | ---                             | ---        | ---    | ---          |
| `/dev/nvme0n1p5`     | Linux EFI Partition             | FAT32      | 1 GB   | /boot/efi    |
| `/dev/nvme0n1p6`     | Linux Boot Partition            | F2FS       | 3 GB   | /boot        |
| `/dev/nvme0n1p7`     | Linux Root Partition (`Arch`)   | BRTFS      | 300 GB | /            |
| `/dev/nvme0n1p8`     | Linux Software Partition (`Arch`) | F2FS      | 100 GB | /usr        |
| Unallocated          | ---                             | ---        | 400 GB | ---          |
| `/dev/nvme0n1p9`     | Linux Swap Partition            | SWAP       | 48 GB  | n/a          |

### `NEBULA` - RAID-Protected Secondary NVME Storage (4TB NVME Gen.4 in RAID 10)

The `Nebula` array offers 4 TB of NVME Gen.4 storage with a 6 GB/s transfer rate, employing RAID 10 for a blend of performance and data protection.

| Partition ID         | Partition Name                 | Filesystem | Size   | Mount Point |
|----------------------|--------------------------------|------------|--------|-------------|
| `/dev/nvme1n1p1`     | Home Partition                 | LUKS2      | 2 TB   | /home       |
| `/dev/nvme1n1p2`     | Variable Data Partition        | EXT4       | 500 GB | /var        |
| Unallocated          | ---                            | ---        | 1 TB   | ---         |
| `/dev/nvme1n1p4`     | Windows Data Partition         | NTFS       | 500 GB | D:\         |

### `TERRA` - Large Capacity Storage Array (8TB HDD in RAID 10)

`Terra` consists of an 8TB HDD setup in RAID 10, focusing on data integrity and offering substantial storage space at reduced transfer speeds.

| Partition ID         | Partition Name                 | Filesystem | Size   | Mount Point  |
|----------------------|--------------------------------|------------|--------|--------------|
| `/dev/sda1`          | General Data Storage           | EXT4       | 2 TB   | /media/data  |
| `/dev/sda2`          | Backup Data Storage            | EXT4       | 6 TB   | /var/backup  |

## Recommended Storage Points

The table below provides guidance on where to store various types of data based on performance, reliability, and capacity considerations.

| File Type                            | Recommended Storage Point | Rationale                                                       |
|--------------------------------------|---------------------------|-----------------------------------------------------------------|
| Operating System Files               | `NOVA`                    | For swift boot and system operations.                           |
| Application Files (Windows)          | `NOVA` (C:\)              | For rapid application execution in Windows.                     |
| Application Files (Linux)            | `NOVA` (/usr)             | For rapid application execution in Linux.                       |
| User Data (Linux)                    | `NEBULA` (/home)          | Secured with LUKS2 encryption and RAID 10 for redundancy.       |
| User Data (Windows)                  | `NEBULA` (D:\)            | For data separation from system files and RAID 10 redundancy.   |
| Variable Data                        | `NEBULA` (/var)           | Important for integrity with moderate access speeds.            |
| Project Source Code                  | `NEBULA` (/var/src)       | For a balance of speed and data integrity.                      |
| General Data Storage                 | `TERRA` (/media/data)     | For bulk storage with less need for speed.                      |
| Backup Data                          | `TERRA` (/var/backup)     | For protected backups, prioritizing integrity over speed.       |
| Virtual Machines                     | `NEBULA`                  | For a compromise between performance and storage capacity.      |
| Multimedia Files                     | `TERRA`                   | Large files where NVME speed is unnecessary.                    |
| Documents and Office Files           | `NEBULA`                  | For faster access compared to `TERRA`.                          |
| Games                                | `NOVA`                    | Leveraging high transfer speeds for quick loading.              |
| Development Tools & IDEs             | `NOVA`                    | For efficiency in launch and file operations during development.|
| Cache and Temporary Files            | `NOVA`                    | Utilizing the speed for temporary file operations.              |
| Databases                            | `NEBULA`                  | For faster access times than `TERRA` with the benefit of RAID.  |
| Logs                                 | `NEBULA` (/var/log)       | To prevent log writes from impacting primary drive performance. |

## Further Information

This configuration serves as part of my dotfiles repository and reflects a system setup that is personalized for efficiency and effectiveness. If this guide informs your disk management strategy, tailor the partition sizes and file systems to your particular requirements and usage patterns. Remember to back up your data before undertaking any partitioning work.

For any suggestions or if you encounter issues, feel free to make a pull request or open an issue within the repository. Your interest in my disk management setup is much appreciated!
