<h1 align="center"><img src="https://github.com/SegoCode/DebloBat/blob/main/media/header.png"></h1>
<h3 align="center"><img  src="https://github.com/SegoCode/DebloBat/blob/main/media/demo-2.gif"></h3>

<p align="center">
  <a href="#about">About</a> •
  <a href="#features">Features</a> •
  <a href="#quick-start--information">Quick Start & Information</a> •
  <a href="#download">Download</a> 
</p>

## About

Yes, I know... Here is another ugly meme script to debloat Windows, this no longer makes sense... honestly, the other options I found online didn't seem right for me to use on my computer. Many of them are using outdated settings or just copying and pasting stuff without really knowing what it might do, with monolithic scripts that are extremely difficult to maintain. That's why I decided to create something focused only on Group Policies, which usually don't get outdated. I carefully checked each setting to make sure any changes can be undone easily, i have been reading group policy documentation for two years, so nothing bad happens, and i made sure the script is easy to read and understand and maintain. I didn't want to use any private tools, harsh scripts, or Windows iso... With group policies you get more than decent windows. Using resources like [admx.help](https://admx.help), [WPD app](https://wpd.app/), [AtlasOS](https://github.com/Atlas-OS/Atlas), [Privacy.sexy](https://privacy.sexy/), [tiny11builder](https://github.com/ntdevlabs/tiny11builder/), [mydigitallife.net](https://forums.mydigitallife.net/) I made this deblo.bat file.


## Features

- Real and secure, easy readable code, offline Windows Activation (KMS38)
- Readable, well organized script, avoids a single, unreadable monolithic script.
- Windows service configuration.
- Privacy and QoL Group Policy tweaks.
- Screenfetch tool integration.
- No residual files, very eco-friendly.
- System safety, can break your windows, no restoration point required.

## Quick Start & Information

Deblobat access and startup, simple execution flow diagram
<h3 align="center"><img  src="https://github.com/SegoCode/DebloBat/blob/main/media/diagramRunFlow.png"></h3>

Lauch option 1:
```shell
irm https://raw.githubusercontent.com/SegoCode/DebloBat/main/src/launcher.ps1 | iex
```
Lauch option 2:
```shell
git clone https://github.com/SegoCode/DebloBat
cd DebloBat\code
Deblo.bat
```
Or [donwload a zip](https://github.com/SegoCode/DebloBat/archive/refs/heads/main.zip) and click on deblo.bat file.


<details>
  <summary>Why can't software installation be left unattended? Is there any way to install my software in an unattended way?</summary> 
  
 ##
  At first, the download manager had all the links to official programs handy, and I went through the documentation for each one to customize all installations silently. However, it was challenging to maintain. The "deblobat philosophy" aims to be as non-intrusive as possible, so using a package manager seemed intrusive to the system. Therefore, I simply download those binaries to make access easier for the user.

Still, if you want to unattended that process, I recommend "scoop." In its new version, it's quite decent. Here's a text block example that you can simply copy and paste using the button into your PowerShell terminal to install the software:
```shell
# Enable long paths in Windows registry for Scoop
Start-Process powershell -ArgumentList "-Command Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1" -Verb RunAs -Wait

# Install Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Install essential Scoop packages
scoop install refreshenv

scoop install 7zip
refreshenv

scoop install git
refreshenv

scoop install innounp
refreshenv

scoop install wixtoolset
refreshenv

scoop bucket add extras
scoop bucket add java
refreshenv

# You can add or remove programs below this section as needed
scoop install java/temurin-jdk
scoop install main/nodejs-lts
scoop install main/go
scoop install extras/filezilla
scoop install extras/vlc
scoop install extras/qview
scoop install extras/qbittorrent-enhanced
scoop install extras/telegram
scoop install extras/discord
scoop install extras/sublime-text
scoop install extras/flameshot
scoop install extras/simplewall
scoop install extras/firefox
```

</details>

## Download

https://github.com/SegoCode/DebloBat/archive/refs/heads/main.zip

---
<p align="center"><a href="https://github.com/SegoCode/DebloBat/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=SegoCode/DebloBat" />
</a></p>
