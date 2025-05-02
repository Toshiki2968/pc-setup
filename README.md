# PC Setup for Windows Developers

## 前提
- Windows 10/11
- 管理者権限
- PowerShell 7.x 推奨

## セットアップ手順

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
.\install_scripts\choco_installer.ps1
.\install_scripts\devtools_installer.ps1
.\install_scripts\dotsinstaller.ps1
