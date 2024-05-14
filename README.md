# NavTweaks (former Fullscreen/Immersive gestures) 10-14

![](https://i.imgur.com/vcXAreJ.png)

This Magisk Module lets you tweak the appearence of Android 10-14's navigation bar.

## Requirements
- Android 10-14
- Magisk 20+ or KernelSU (likely Apatch as well)

## Installation 
1. Flash the module
2. Select the desired options on the volume selector
3. Reboot
4. Enjoy!

## Disclaimer
- GSI compabitility isn't guaranteed due to Magisk's inconsistent GSI support
- Navbar coloring (getting light/dark) doesn't work on Android 11+ (using the Coloring fix/workaround option may fix it but it's not guaranteed)
- KernelSU users need to add the SystemUI app to the root list (no need to grant root access, just make sure unmount modules is disabled to it)

## Links
- [GitHub](https://github.com/Magisk-Modules-Repo/HideNavBar) 
- [Telegram Channel](https://t.me/danmgk)
- [PayPal](https://www.paypal.com/donate/?hosted_button_id=BJAJW4755BXFY)
- Revolut Tag @danielem47

### Translation
 If you wish to have the installer translated to your language send me a text file containing all lines (inside ui_print in common/install.sh) either on Github or my Email, omit special symbols such as á,ã

## Special Thanks
- [skittles9823](https://github.com/skittles9823) for his help with the initial install script 

- [Nebulart](https://t.me/nebulart) for the banner

- [Samchugit](https://github.com/samchugit) for making the original immersive gestures module

- [Zackptg5](https://github.com/Zackptg5) for the MMT-Ex template

- [Topjohnwu](https://github.com/topjohnwu) for making Magisk

- [RKBDI](https://t.me/RKBDI) for the Rboard module

- [Gnonymous7](https://github.com/Gnonymous7) for some general inspiration

- [AAGaming00](https://github.com/AAGaming00/aapt2) for his AAPT2 binary

- All Custom ROMs who made my module an official feature in their ROM (AOSIP, Havoc & etc)

## Changelog

### v27.1
- Increase volume selector timeout (to give users more time to read the options)

### v27
- Switched to AAPT2 for overlay buidling (fixes Android 14 QPR2 issues without the need for the previous embedded framework workaround)
- Fixed the keyboard buttons not getting hidden in landscape on MIUI/HyperOS
- Restructured the installer to allow for further customization of the navigation bar and to simplify the names of options (fullscreen and immersive were somewhat too vague)

 Due to the restructured installer, translations will need to be updated for russian, italian, spanish and chinese (for text 10-12, don't submit text 1 as it's no longer used), feel free to submit them through a pull request or through my Telegram

### v26.1
- Hotfix for Fullscreen not working properly
 
### v26.0
- Initial Taskbar support (currently only works on Pixel Launcher or on device's who's stock launcher's package name is com.android.launcher3)
- Add disclaimer for KernelSU users about the need to add SystemUI to the root list (making sure the unmount module option is not enabled)

### v25.0
- Fixed the module not working on A14 QPR2
- Fixed the issue where the keyboard bar was overlaying the keyboard on A14 (this fix may cause the hide keyboard buttons option to not work)

### v24.0
- Lowered overlay priority and added slight delays to the boot script (which should prevent system overlays from overriding the module's values)
- Disabled config_imeDrawsImeNavBar (which should allow the hide keyboard buttons option to work properly on Android 13 and up)

### v23.0
- Miscenaleous fixes

### v22.0
- Added Android 14 support (experimental)

### v21.0
- Rewrite installer for Android 12+ to use fabricated overlays for higher compatibility 
- Added Gcam lag fix as install option (12+ atm)

  Translations needed for the Gcam fix option 

### v20.0-hotfix
- Fix terminal setup tool 

### v20.0
- Fix Android 10 support (which was broken since v14.0)

### v19.0
- Reworked Terminal config tool (su -c hn), should avoid issues related to zipsigner
- Properly support Rboard Theme Manager v3 to avoid conflicts

### v18.0
- Added Samsung A12 support

### v17.0
- Proper MIUI detection/install logic (should provide compatibility to MIUI based on Android 10, not tested)

### v16.4
- Removed unnecessary waiting during module install 

### v16.3
- Added Fox## Disclaimer
- GSI compabitility isn't guaranteed due to Magisk's inconsistent GSI support
- Navbar coloring (getting light/dark) doesn't work on Android 11+ (using the Coloring fix/workaround option may fix it but it's not guaranteed)
- KernelSU users need to add the SystemUI app to the root list (no need to grant root access, just make sure unmount modules is disabled to it)

## Links
- [GitHub](https://github.com/Magisk-Modules-Repo/HideNavBar) 
- [Telegram Channel](https://t.me/danmgk)
- [PayPal](https://www.paypal.com/donate/?hosted_button_id=BJAJW4755BXFY)
- Revolut Tag @danielem47

### Translation
 If you wish to have the installer translated to your language send me a text file containing all lines (inside ui_print in common/install.sh) either on Github or my Email, omit special symbols such as á,ã

## Special Thanks
- [skittles9823](https://github.com/skittles9823) for his help with the initial install script 

- [Nebulart](https://t.me/nebulart) for the banner

- [Samchugit](https://github.com/samchugit) for making the original immersive gestures module

- [Zackptg5](https://github.com/Zackptg5) for the MMT-Ex template

- [Topjohnwu](https://github.com/topjohnwu) for making Magisk

- [RKBDI](https://t.me/RKBDI) for the Rboard module

- [Gnonymous7](https://github.com/Gnonymous7) for some general inspiration

- [AAGaming00](https://github.com/AAGaming00/aapt2) for his AAPT2 binary

- All Custom ROMs who made my module an official feature in their ROM (AOSIP, Havoc & etc)

## Changelog

### v27
- Switched to AAPT2 for overlay buidling (fixes Android 14 QPR2 issues without the need for the previous embedded framework workaround)
- Fixed the keyboard buttons not getting hidden in landscape on MIUI/HyperOS
- Restructured the installer to allow for further customization of the navigation bar and to simplify the names of options (fullscreen and immersive were somewhat too vague)

 Due to the restructured installer, translations will need to be updated for russian, italian, spanish and chinese (for text 10-12, don't submit text 1 as it's no longer used), feel free to submit them through a pull request or through my Telegram

### v26.1
- Hotfix for Fullscreen not working properly
 
### v26.0
- Initial Taskbar support (currently only works on Pixel Launcher or on device's who's stock launcher's package name is com.android.launcher3)
- Add disclaimer for KernelSU users about the need to add SystemUI to the root list (making sure the unmount module option is not enabled)

### v25.0
- Fixed the module not working on A14 QPR2
- Fixed the issue where the keyboard bar was overlaying the keyboard on A14 (this fix may cause the hide keyboard buttons option to not work)

### v24.0
- Lowered overlay priority and added slight delays to the boot script (which should prevent system overlays from overriding the module's values)
- Disabled config_imeDraw## Disclaimer
- GSI compabitility isn't guaranteed due to Magisk's inconsistent GSI support
- Navbar coloring (getting light/dark) doesn't work on Android 11+ (using the Coloring fix/workaround option may fix it but it's not guaranteed)
- KernelSU users need to add the SystemUI app to the root list (no need to grant root access, just make sure unmount modules is disabled to it)

## Links
- [GitHub](https://github.com/Magisk-Modules-Repo/HideNavBar) 
- [Telegram Channel](https://t.me/danmgk)
- [PayPal](https://www.paypal.com/donate/?hosted_button_id=BJAJW4755BXFY)
- Revolut Tag @danielem47

### Translation
 If you wish to have the installer translated to your language send me a text file containing all lines (inside ui_print in common/install.sh) either on Github or my Email, omit special symbols such as á,ã

## Special Thanks
- [skittles9823](https://github.com/skittles9823) for his help with the initial install script 

- [Nebulart](https://t.me/nebulart) for the banner

- [Samchugit](https://github.com/samchugit) for making the original immersive gestures module

- [Zackptg5](https://github.com/Zackptg5) for the MMT-Ex template

- [Topjohnwu](https://github.com/topjohnwu) for making Magisk

- [RKBDI](https://t.me/RKBDI) for the Rboard module

- [Gnonymous7](https://github.com/Gnonymous7) for some general inspiration

- [AAGaming00](https://github.com/AAGaming00/aapt2) for his AAPT2 binary

- All Custom ROMs who made my module an official feature in their ROM (AOSIP, Havoc & etc)

## Changelog

### v27
- Switched to AAPT2 for overlay buidling (fixes Android 14 QPR2 issues without the need for the previous embedded framework workaround)
- Fixed the keyboard buttons not getting hidden in landscape on MIUI/HyperOS
- Restructured the installer to allow for further customization of the navigation bar and to simplify the names of options (fullscreen and immersive were somewhat too vague)

 Due to the restructured installer, translations will need to be updated for russian, italian, spanish and chinese (for text 10-12, don't submit text 1 as it's no longer used), feel free to submit them through a pull request or through my Telegram

### v26.1
- Hotfix for Fullscreen not working properly
 
### v26.0
- Initial Taskbar support (currently only works on Pixel Launcher or on device's who's stock launcher's package name is com.android.launcher3)
- Add disclaimer for KernelSU users about the need to add SystemUI to the root list (making sure the unmount module option is not enabled)

### v25.0
- Fixed the module not working on A14 QPR2
- Fixed the issue where the keyboard bar was overlaying the keyboard on A14 (this fix may cause the hide keyboard buttons option to not work)

### v24.0
- Lowered overlay priority and added slight delays to the boot script (which should prevent system overlays from overriding the module's values)
- Disabled config_imeDrawsImeNavBar (which should allow the hide keyboard buttons option to work properly on Android 13 and up)

### v23.0
- Miscenaleous fixes

### v22.0
- Added Android 14 support (experimental)

### v21.0
- Rewrite installer for Android 12+ to use fabricated overlays for higher compatibility 
- Added Gcam lag fix as install option (12+ atm)

  Translations needed for the Gcam fix option 

### v20.0-hotfix
- Fix terminal setup tool 

### v20.0
- Fix Android 10 support (which was broken since v14.0)

### v19.0
- Reworked Terminal config tool (su -c hn), should avoid issues related to zipsigner
- Properly support Rboard Theme Manager v3 to avoid conflicts

### v18.0
- Added Samsung A12 support

### v17.0
- Proper MIUI detection/install logic (should provide compatibility to MIUI based on Android 10, not tested)

### v16.4
- Removed unnecessary waiting during module install 

### v16.3
- Added Fox Manager Extension support (support link shortcut when installing the module)
- Try and improve the volume selector delay a bit

### v16.1
sImeNavBar (which should allow the hide keyboard buttons option to work properly on Android 13 and up)

### v23.0
- Miscenaleous fixes

### v22.0
- Added Android 14 support (experimental)

### v21.0
- Rewrite installer for Android 12+ to use fabricated overlays for higher compatibility 
- Added Gcam lag fix as install option (12+ atm)

  Translations needed for the Gcam fix option 

### v20.0-hotfix
- Fix terminal setup tool 

### v20.0
- Fix Android 10 support (which was broken since v14.0)

### v19.0
- Reworked Terminal config tool (su -c hn), should avoid issues related to zipsigner
- Properly support Rboard Theme Manager v3 to avoid conflicts

### v18.0
- Added Samsung A12 support

### v17.0
- Proper MIUI detection/install logic (should provide compatibility to MIUI based on Android 10, not tested)

### v16.4
- Removed unnecessary waiting during module install 

### v16.3
- Added Fox Manager Extension support (support link shortcut when installing the module)
- Try and improve the volume selector delay a bit

### v16.1
 Manager Extension support (support link shortcut when installing the module)
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


For older changelogs check [here](https://github.com/Magisk-Modules-Alt-Repo/HideNavBar/blob/master/OC.md)
