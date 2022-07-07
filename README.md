# Fullscreen/Immersive Gesture Tweaks for Android 10-13

![](https://i.imgur.com/vcXAreJ.png)

This Magisk Module lets you tweak Android 10-13's gestures.

## Requirements
- Android 10-13
- Magisk 20+

## Installation 
1. Flash the module
2. Select the desired options on the volume selector
3. Reboot
4. Enjoy!

## Terminal Setup
 Run on a terminal app the following command 
 su -c hn

### Translation
 If you wish to have the installer translated to your language send me a text file containing all lines (inside ui_print in common/install.sh) either on Github or my Email

## Disclaimer
- Any option not working is due to incompatibility with your current ROM (there's little i can do about it)
- Any issues related to GCam after installing the module are outside my control 
- Automatic navbar coloring doesn't work on Android 11+

## Links
- [GitHub](https://github.com/Magisk-Modules-Repo/HideNavBar) 
- [Telegram Channel](https://t.me/danmgk)

## Options

- Android Default

<p align="left">
  <img src="https://i.imgur.com/x1zcFTn.jpg">
</p>

- Fullscreen

<p align="left">
  <img width="463" height="51" src="https://i.imgur.com/q0vTxdR.png">
</p>

- Immersive (With the Pill + Default Keyboard Spacing)

<p align="left">
  <img src="https://i.imgur.com/x1zcFTn.jpg">
</p>

<p align="left">
  <img src="https://i.imgur.com/ZPdYrom.jpg">
</p>

- Immersive (With the Pill + Small Keyboard Spacing)

<p align="left">
  <img src="https://i.imgur.com/siUBxhY.jpg">
</p>

- Immersive (Without the Pill + Default Keyboard Spacing)

<p align="left">
  <img src="https://i.imgur.com/q0vTxdR.png">
</p>

<p align="left">
  <img src="https://i.imgur.com/FpdqBfb.jpg">
</p>

- Immersive (Without the Pill + Small Spacing under the Keyboard)

<p align="left">
  <img src="https://i.imgur.com/8JrB5uZ.jpg">
</p>


- Additionally back gestures can be disabled on Android 11-12 for either left side only (to access side menus on apps) or both sides (if one wishes to remap the back gestures with other apps)

## Special Thanks
- [skittles9823](https://github.com/skittles9823) for his help with the initial install script 

- [Nebulart](https://t.me/nebulart) for the banner

- [Samchugit](https://github.com/samchugit) for making the original immersive gestures module

- [Zackptg5](https://github.com/Zackptg5) for the MMT-Ex template

- [Topjohnwu](https://github.com/topjohnwu) for making Magisk

- [RKBDI](https://t.me/RKBDI) for the Rboard module

- [Gnonymous7](https://github.com/Gnonymous7) for some general inspiration, if you want more visual tweaks make sure to check out their module [G-VisualMod](https://github.com/Magisk-Modules-Repo/G-VisualMod)

- All Custom ROMs who made my module an official feature in their ROM (AOSIP, Havoc & etc)

## Changelog
### v16.4
- Removed unnecessary waiting during module install 
### v16.3
- Added Fox Manager Extension support (support link shortcut when installing the module)
- Try and improve the volume selector delay a bit
### v16.1
- Fix the Terminal Config tool
### v16.0
- Proper MIUI 13 support
### v15.0
- Added MIUI support (confirmed working on MIUI 13)
- Fixed Terminal Script not working on devices with pseudo/fake xbin folders
### v14.0
- Fixed miscelaneous error messages
- Fixed Terminal config tool on Android 13 (Google's fault this time lol)
- Tablet support (it works inconsisntently) 
### v13.0
- Full AAPT rewrite 
- Added terminal config tool for changing each navbar parameter
 (To use it run the following on a terminal app su -c hn)
### v12.0
- Fixed the Gcam lag when switching modes
### v11.0
- Preemptive Android 13 support (untested) 
### v10.0
- Added Support for Android 12L, and thank you all very much for your support over these 2 years of development
### v9.9
- Allow hiding the buttons underneath the keyboard in Immersive mode
### v9.8
- Fix Rboard checking for the keyboard spacing removal feature (apologies to RKBDI for the troubles)
### v9.7
- Automatically removes conflicting overlays during install (AKA some theme modules that include gesture overlays for no reason at all)
### v9.6
- More reliable language detection (should prevent issues where the installer shows no text)
### v9.5
- Added support for translations in the installer (currently included languages are English, Portuguese and Spanish)
### v9.4
- Allow disabling back gesture also on Android 10 (due to way A10 handles the back gesture it's only possible to disable them completely and on fullscreen mode only, if you have Xposed on A10 and wishes to disable only the left back gesture use this Xposed module https://github.com/kuba2k2/NoLeftBackGesture/releases/tag/v1.0)
### v9.3-hotfix
- Fix install (sorry for the inconvenience)
### v9.3
- Updated Volume selector (from MMT-EX), should resolve install issues on some devices
- Increased the timeout to 10s to give users time to read the options
### v9.2
- Reenable back gestures on NO (on the whether to disable back gestures or not) option 
### v9.1
- Reenable back gesture on uninstall (if user is unable to change the device's back gesture sensitivy from settings) 
### v9.0
- Allow disabling back gesture on A11-12 (Left only for side menus and Left & Right for gesture apps)
### v8.8
- Update MAXAPI to 31 to support the eventual stable A12 release 
### v8.7
- Update Volume selector
- Revised install logic
- Disable the Gboard spacing some Android 11 ROMs were using by default (users are still free to change/reenable the spacing with Rboard as I've made sure my code won't overlap with it)
### v8.6
- Fix and go back to using the new install logic on Android 11
### v8.5
- Revert to old install logic on Android 11 (attempts to bug fix module not installing correctly on some devices)
### v8.4
- Fixed an issue that was causing hide pill to be installed regardless of user preference
- Cleaner install code (again)
### v8.3
- Remove Android 11 specific overlays (no longer necessary as the standard ones work just fine on 11)
- Clean up install code even more
### v8.2
- Fix immersive sensitivity options
- Clean up installer code significantly 

(if you notice any issues on Android 11 due to the new install logic report to me immediatelly)
### v8.1
- Fix for Immersive+default sensitivity not getting properly installed
### v8.0
- Allow changing gesture sensitivity (for users who may prefer Android's default gesture sensitivity)
### v7.2
- Fix fullscreen gestures installation (apologies for the inconvenience)
### v7.1
- Added new options during install

- Small keyboard bar (for immersive mode): Allows you to have less spacing underneath the keyboard

- Hide Pill (for immersive mode): Allows you to have a near fullscreen experience while still keeping the spacing underneath the keyboard
### v7.0
- Switch to the MMT-EX template and added immersive gestures by [samchugit](https://github.com/samchugit/Immersive_Gestural_Nav_Bar) as an option 
### v6.7
- Fix gesture option disappearing on later Android 11 builds
### v6.6 
- Hotfix for Android 11 beta
### v6.5
- Lowered gesture area to 18dp to reduce conflicts with apps
### v6.4
- Fix Android 11 support
### v6.2
- Add support for Android 11/R (untested as Magisk isn't avaliable for Android R yet)
### v6.1
- Block installation on MIUI as it's incompatible with the module
### v6.0
- Added support for ROMs that use /vendor/overlays for their gesture overlays
### v5.0
- Update to the latest Magisk module template and some minor clean ups in the code
### v4.0
- Hopefully fixed the issue that made so uninstalling the module made gestures completely unavailable on some ROMs
### v3.0
- Reduced conflict with some apps (like Gboard) by slightly lowering the gesture trigger area
### v2.0
- Hide gesture bar correctly in landscape
### v1.0
- Initial release
