### v8.4
- Fixed an issue that was causing hide pill to be installed regardless of user preference
- Cleaner install code (again)
### v8.3
- Remove Android 11 specific overlays (no longer necessary as the standard ones work just fine on 11)
- Clean up install code even more
### v8.2
- Fix immersive sensitivity options
- Clean up installer code significantly 
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
