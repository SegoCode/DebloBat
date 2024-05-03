<h1 align="center"><img src="https://github.com/SegoCode/DebloBat/blob/main/media/header.png"> </h1>
<h3 align="center"><img  src="https://github.com/SegoCode/DebloBat/blob/main/media/demo-2.gif"></h3>

Yes, I know... Here is another ugly meme script to debloat Windows, this no longer makes sense... honestly, the other options I found online didn't seem right for me to use on my computer. Many of them involved using outdated settings or just copying and pasting stuff without really knowing what it might do. That's why I decided to create something focused only on Group Policies, which usually don't get outdated. I carefully checked each setting to make sure any changes can be undone easily, so nothing bad happens, and I made sure the script is easy to read and understand. I didn't want to use any private tools, harsh scripts, or Windows isos just for some basic adjustments in Group Policies. Using resources like [admx.help](https://admx.help), [WPD app](https://wpd.app/), [AtlasOS](https://github.com/Atlas-OS/Atlas), and Privacy.sexy, I made this deblo.bat file.

Perhaps a slightly contentious point is the activation of Windows using online KMS. From my research, the only telemetry data sent to KMS could potentially be exploited on an outdated and vulnerable system, or in the case of a zero-day vulnerability. (For the record, I use legally obtained copies of Windows) However, I created this KMS script a few years back and found it useful to include in Deblobat. Ultimately, the choice to use the feature it is yours.

## Features
- Have a online Windows activation
- Services and Task configs
- Group Policy privacy configs
- Useful Group Policy configs
- Screenfetch
- Cant break your system

## Usage & info

- Works better with internet

Option 1:
```shell
irm https://raw.githubusercontent.com/SegoCode/DebloBat/main/src/launcher.ps1 | iex
```
Option 2:
```shell
git clone https://github.com/SegoCode/DebloBat
cd DebloBat\src
Deblo.bat
```
Or [donwload a zip](https://github.com/SegoCode/DebloBat/archive/refs/heads/main.zip).

## Downloads

https://github.com/SegoCode/DebloBat/archive/refs/heads/main.zip
