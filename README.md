<h1 align="center"><img src="https://github.com/SegoCode/DebloBat/blob/main/media/header.png"></h1>
<h3 align="center"><img  src="https://github.com/SegoCode/DebloBat/blob/main/media/demo-2.gif"></h3>

Yes, I know... Here is another ugly meme script to debloat Windows, this no longer makes sense... honestly, the other options I found online didn't seem right for me to use on my computer. Many of them are using outdated settings or just copying and pasting stuff without really knowing what it might do, with monolithic scripts that are extremely difficult to maintain. That's why I decided to create something focused only on Group Policies, which usually don't get outdated. I carefully checked each setting to make sure any changes can be undone easily, so nothing bad happens, and I made sure the script is easy to read and understand and maintain. I didn't want to use any private tools, harsh scripts, or Windows iso... With group policies you get more than decent windows. Using resources like [admx.help](https://admx.help), [WPD app](https://wpd.app/), [AtlasOS](https://github.com/Atlas-OS/Atlas) and [Privacy.sexy](https://privacy.sexy/), I made this deblo.bat file.


## Features
- Real and secure, easy readable code, offline Windows Activation (KMS38)
- Readable, well organized script, avoids a single, unreadable monolithic script.
- Windows service configuration.
- Privacy and QoL Group Policy tweaks.
- Screenfetch tool integration.
- No residual files, very eco-friendly.
- System safety, can break your windows, no restoration point required.

## Usage & info

Deblobat access and startup, simple execution flow diagram
<h3 align="center"><img  src="https://github.com/SegoCode/DebloBat/blob/main/media/diagramRunFlow.png"></h3>

Lauch option 1:
```shell
irm https://raw.githubusercontent.com/SegoCode/DebloBat/main/src/launcher.ps1 | iex
```
Lauch option 2:
```shell
git clone https://github.com/SegoCode/DebloBat
cd DebloBat\src
Deblo.bat
```
Or [donwload a zip](https://github.com/SegoCode/DebloBat/archive/refs/heads/main.zip) and click on deblo.bat file.


<details>
  <summary>Why can't software installation be left unattended?</summary> 
  
 ##
  At first, the download manager had all the links to official programs handy, and I went through the documentation for each one to customize all installations silently. However, it was challenging to maintain. The "deblobat philosophy" aims to be as non-intrusive as possible, so using a package manager seemed intrusive to the system. Therefore, I simply download those binaries to make access easier for the user.

Still, if you want to automate that process, I recommend "scoop." In its new version, it's quite decent. Here's a text block example that you can simply copy and paste into your PowerShell terminal to install the software:
```shell
Start-Process powershell -ArgumentList "-Command Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1" -Verb RunAs -Wait

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

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

scoop install temurin-jdk
scoop install nodejs-lts
scoop install go
scoop install filezilla
scoop install vlc
scoop install qview
scoop install qbittorrent-enhanced
scoop install telegram
scoop install discord
scoop install sublime-text
scoop install flameshot

```

</details>

## Downloads

https://github.com/SegoCode/DebloBat/archive/refs/heads/main.zip
