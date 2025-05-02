Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = "Tls12"
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
