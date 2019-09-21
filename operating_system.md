# Windows 10
Advanced Post-setup of Windows 10 Installation.

## Enabling an WSL 2.0
WSL 2.0 enables an complete Linux kernel in Windows operating system which provides an cross-platform compatibility between Windows and Linux.

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

Then we're able to set defaul disturibution of Linux by `wsl --set-version <Distro> 2` and make WSL 2.0 default architecture `wsl --set-default-version 2`.

At the end we're able to verify an installation by `wsl -l -v`.
