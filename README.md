<h1 align="center"><img src="https://github.com/SegoCode/DebloBat/blob/main/media/header.png"></h1>
<h3 align="center"><img  src="https://github.com/SegoCode/DebloBat/blob/main/media/demo-2.gif"></h3>

Yes, I know... Here is another ugly meme script to debloat Windows, this no longer makes sense... honestly, the other options I found online didn't seem right for me to use on my computer. Many of them are using outdated settings or just copying and pasting stuff without really knowing what it might do, with monolithic scripts that are extremely difficult to maintain. That's why I decided to create something focused only on Group Policies, which usually don't get outdated. I carefully checked each setting to make sure any changes can be undone easily, so nothing bad happens, and I made sure the script is easy to read and understand and maintain. I didn't want to use any private tools, harsh scripts, or Windows iso... With group policies you get more than decent windows. Using resources like [admx.help](https://admx.help), [WPD app](https://wpd.app/), [AtlasOS](https://github.com/Atlas-OS/Atlas) and [Privacy.sexy](https://privacy.sexy/), I made this deblo.bat file.


## Features
- Real and secure, easy readable code, offline Windows Activation (KMS38)
- Readable, well organized script. Avoids a single, unreadable monolithic script.
- Windows service configuration
- Privacy and QoL Group Policy tweaks
- Screenfetch tool integration
- System Safety, can break your windows, no restoration point required

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
Or [donwload a zip](https://github.com/SegoCode/DebloBat/archive/refs/heads/main.zip).

## Downloads

https://github.com/SegoCode/DebloBat/archive/refs/heads/main.zip
