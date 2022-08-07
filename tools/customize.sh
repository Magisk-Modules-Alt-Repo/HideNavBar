chmod +x "$MODPATH"/tools/*
[ "$($MODPATH/tools/aapt v)" ] && AAPT=aapt
[ "$($MODPATH/tools/aapt64 v)" ] && AAPT=aapt64
cp -af "$MODPATH"/tools/$AAPT "$MODPATH"/aapt

if [ -d /system/xbin/ ] && [ ! -f /system/xbin/empty ] ; then
    mkdir -p "$MODPATH"/system/xbin/
    cp -rf "$MODPATH"/tools/hn "$MODPATH"/system/xbin/
else
    mkdir -p "$MODPATH"/system/bin/
    cp -rf "$MODPATH"/tools/hn "$MODPATH"/system/bin/
fi 

#Detect original overlay location
OP=$(find /system/overlay /product/overlay /vendor/overlay /system_ext/overlay -type d -iname "navigationbarmodegestural" | cut -d 'N' -f1)
mkdir -p "$MODPATH"/system"$OP"

#Build and sign overlays
"$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/Qtmp/AndroidManifest.xml" -I /system/framework/framework-res.apk -S "$MODPATH/Mods/Qtmp/res" -F "$MODPATH"/unsigned.apk >/dev/null
"$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/MIUI/AndroidManifest.xml" -I /system/framework/framework-res.apk -S "$MODPATH/Mods/MIUI/res" -F "$MODPATH"/miui.apk >/dev/null
"$MODPATH"/tools/zipsigner "$MODPATH"/unsigned.apk "$MODPATH"/Mods/Q/NavigationBarModeGestural/NavigationBarModeGesturalOverlay.apk
"$MODPATH"/tools/zipsigner "$MODPATH"/miui.apk "$MODPATH"/Mods/MIUIc/GestureLineOverlay.apk


#Install overlays
cp -rf "$MODPATH"/Mods/Q/* "$MODPATH"/opt/* "$MODPATH"/system"$OP"

if [ -f /product/overlay/GestureLineOverlay.apk ] ; then
cp -rf "$MODPATH"/Mods/MIUIc/GestureLineOverlay.apk "$MODPATH"/system/product/overlay/
elif [ -f /vendor/overlay/GestureLineOverlay.apk ] ; then
cp -rf "$MODPATH"/Mods/MIUIc/GestureLineOverlay.apk "$MODPATH"/system/vendor/overlay/
else
 :
fi

echo "To apply changes make sure to reboot"
