 <img src="https://github.com/SegoCode/DebloBat/blob/main/media/header.png"> 
<img  src="https://github.com/SegoCode/DebloBat/blob/main/media/demo-2.gif">

Yes, I know... Here is another ugly meme script to debloat Windows, this no longer makes sense, but to be honest, the solutions I've found online haven't impressed me. There's a lot of outdated registry keys and too much copying and pasting without understanding the consequences of each action. That's why I started this, concentrating solely on Group Policies, which are seldom outdated. I've gone through each one carefully, with the guiding principle that any tweak should be easily reversible, ensuring no unwanted effects occur. I didn't want to resort to using closed-source privacy tools, aggressive scripts, or modified ISOs for simple tasks like adjusting enterprise-level Group Policies. So, by leveraging resources like [admx.help](https://admx.help) [WPD closed-source app](https://wpd.app/), [AtlasOS](https://github.com/Atlas-OS/Atlas), [Privacy.sexy](https://github.com/undergroundwires/privacy.sexy), I developed this deblo.bat file.

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

```shell
git clone https://github.com/SegoCode/DebloBat
cd DebloBat\src
Deblo.bat
```
Or [donwload a zip](https://github.com/SegoCode/DebloBat/archive/refs/heads/main.zip).

## Downloads

https://github.com/SegoCode/DebloBat/archive/refs/heads/main.zip
