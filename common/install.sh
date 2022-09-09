   ##########################################################################################
# Custom Logic
##########################################################################################

#Detect and use compatible AAPT
chmod +x "$MODPATH"/tools/*
[ "$($MODPATH/tools/aapt v)" ] && AAPT=aapt
[ "$($MODPATH/tools/aapt64 v)" ] && AAPT=aapt64
cp -af "$MODPATH"/tools/$AAPT "$MODPATH"/aapt
cp -rf "$MODPATH"/Mods/QS/* "$MODPATH"/Mods/Qtmp/
mkdir -p "$MODPATH"/Mods/Q/NavigationBarModeGestural/
mkdir -p "$MODPATH"/Mods/Qtmp/
cp -rf "$MODPATH"/tools/service.sh "$MODPATH"

if [ -d /system/xbin/ ] && [ ! -f /system/xbin/empty ] ; then
    mkdir -p "$MODPATH"/system/xbin/
    cp -rf "$MODPATH"/tools/hn "$MODPATH"/system/xbin/
    cp -rf "$MODPATH"/tools/hnr "$MODPATH"/system/xbin/
else
    mkdir -p "$MODPATH"/system/bin/
    cp -rf "$MODPATH"/tools/hn "$MODPATH"/system/bin/
    cp -rf "$MODPATH"/tools/hnr "$MODPATH"/system/bin/
fi 

#Find and delete conflicting overlays
find /data/adb/modules -type d -not -path "*HideNavBar/system*" -iname "*navigationbarmodegestural*" -exec rm -rf {} \; 2>/dev/null 

#Detect system language for translation 
LANG=$(settings get system system_locales)
LANGS=$(echo "${LANG:0:2}" )
if [ -f "$MODPATH"/Lang/"$LANGS"/"$LANGS"1.txt ]; then
    :
else
    LANGS=en
fi

LNG="$MODPATH"/Lang/"$LANGS"/"$LANGS"

#Standard volume selector stuff but with translations
#Fullscreen or immersive selection
cat "$LNG"1.txt
if $VKSEL; then
     BH=0.0
     FBH=0
     FFH=0
     FH=0.0
     SS=true
     FIM=false
     VAR3=a
     VAR4=a
else
     FH=48.0
     FBH=0
     FFH=9500
     BH=0.0
     FFS=false
     FIM=true
     SS=true
fi 

#Hide pill
if [ "$FH" = 48.0 ] ; then
     cat "$LNG"2.txt
     if $VKSEL; then
     VAR3=HP
     HD=true
     else
     VAR3=a
     fi 
fi

if [ "$API" -le 30 ] ; then
 if [ "$FH" = 48.0 ] ; then
  cat "$LNG"8.txt
  if $VKSEL; then
  VAR4=HKB
  else
  VAR4=a
  fi
 fi
else
 :
fi

#Small keyboard bar
if [ "$FH" = 48.0 ] ; then
     cat "$LNG"3.txt
     if $VKSEL; then
     FH=16.0
     FFH=4000
     else
     :
     fi 
fi

#Gesture sensitivity 
if [ "$SS" = true ] ; then
     cat "$LNG"4.txt
     if $VKSEL; then
     GS=18.0
     FGS=4000
     else
     GS=32.0
     FGS=9000
     fi
fi

if [ "$SS" = true ] ; then
     cat "$LNG"9.txt
     if $VKSEL; then
      if [ "$FFH" = 0 ] ; then
      FBH=300
      FFH=300
      else
      FBH=300
      fi
     else
      :
     fi
fi

#Disable back gesture on Q
if [ "$API" -eq 29 ] && [ "$FH" = 0.0 ] ; then
     cat "$LNG"5.txt
     if $VKSEL; then
     cp -rf "$MODPATH"/Mods/DBGQ/* "$MODPATH"
     else
     :
     fi
fi

#Disable back gesture on R+
#Reenable back gesture if no is selected 
if [ "$API" -ge 30 ] ; then
     cat "$LNG"5.txt
     if $VKSEL; then
     DBG=true
     else
     DBG=false
     settings delete secure back_gesture_inset_scale_left &>/dev/null
     settings delete secure back_gesture_inset_scale_right &>/dev/null
     fi
fi     

#Left or both sides 
if [ "$DBG" = true ] ; then
     cat "$LNG"6.txt
     if $VKSEL; then
     settings put secure back_gesture_inset_scale_left -1 &>/dev/null
     else
     settings put secure back_gesture_inset_scale_left -1 &>/dev/null
     settings put secure back_gesture_inset_scale_right -1 &>/dev/null
     fi
fi

#Back gesture warning 
if [ "$DBG" = true ] ; then
    cat "$LNG"7.txt
fi    

#Write to overlay resources
RES="$MODPATH"/Mods/Qtmp/res/values/dimens.xml
FOL="$MODPATH"/service.sh

if [ "$API" -ge 31 ] ; then
sed -i s/03/"$FBH"/g "$FOL"
sed -i s/01/"$FFH"/g "$FOL"
sed -i s/9000/"$FGS"/g "$FOL"
 if [ "$HD" = true ] ; then
 :
 else
 cat "$MODPATH"/service.sh | head -16 > "$MODPATH"/services.sh && mv "$MODPATH"/services.sh "$MODPATH"/service.sh
 fi
fi

if [ "$API" -le 30 ] ; then
sed -i s/0.3/"$BH"/g "$RES"
sed -i s/0.1/"$FH"/g "$RES"
sed -i s/0.2/"$GS"/g "$RES"
mkdir -p "$MODPATH"/Mods/MIUIc/
mkdir -p "$MODPATH"/system/vendor/overlay/
mkdir -p "$MODPATH"/Mods/Qtmp/res/values-sw900dp/
mkdir -p "$MODPATH"/Mods/Qtmp/res/values-sw600dp/
mkdir -p "$MODPATH"/Mods/Qtmp/res/values-440dpi/
mkdir -p "$MODPATH"/Mods/Qtmp/res/values-xhdpi/
mkdir -p "$MODPATH"/Mods/Qtmp/res/values-xxhdpi/
mkdir -p "$MODPATH"/Mods/Qtmp/res/values-xxxhdpi/
mkdir -p "$MODPATH"/Mods/MIUI/res/values/
mkdir -p "$MODPATH"/Mods/MIUI/res/values-440dpi/
mkdir -p "$MODPATH"/Mods/MIUI/res/values-xxhdpi/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/dimens.xml "$MODPATH"/Mods/Qtmp/res/values-sw900dp/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/dimens.xml "$MODPATH"/Mods/Qtmp/res/values-sw600dp/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/dimens.xml "$MODPATH"/Mods/Qtmp/res/values-440dpi/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/dimens.xml "$MODPATH"/Mods/Qtmp/res/values-xhdpi/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/dimens.xml "$MODPATH"/Mods/Qtmp/res/values-xxhdpi/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/dimens.xml "$MODPATH"/Mods/Qtmp/res/values-xxxhdpi/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/* "$MODPATH"/Mods/MIUI/res/values-xxhdpi/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/* "$MODPATH"/Mods/MIUI/res/values-440dpi/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/* "$MODPATH"/Mods/MIUI/res/values/
fi




#Detect original overlay location
OP=$(find /system/overlay /product/overlay /vendor/overlay /system_ext/overlay -type d -iname "navigationbarmodegestural" | cut -d 'N' -f1)

#Building overlays (A11 and below)
if [ "$API" -le 30 ] ; then
"$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/Qtmp/AndroidManifest.xml" -I /system/framework/framework-res.apk -S "$MODPATH/Mods/Qtmp/res" -F "$MODPATH"/unsigned.apk >/dev/null
"$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/MIUI/AndroidManifest.xml" -I /system/framework/framework-res.apk -S "$MODPATH/Mods/MIUI/res" -F "$MODPATH"/miui.apk >/dev/null
fi

if [ "$API" -eq 30 ] ; then
"$MODPATH"/tools/zipsigner "$MODPATH"/unsigned.apk "$MODPATH"/Mods/Q/NavigationBarModeGestural/NavigationBarModeGesturalOverlay.apk
"$MODPATH"/tools/zipsigner "$MODPATH"/miui.apk "$MODPATH"/Mods/MIUIc/GestureLineOverlay.apk
elif [ "$API" -eq 29 ] ; then
"$MODPATH"/tools/zipsignero "$MODPATH"/unsigned.apk "$MODPATH"/Mods/Q/NavigationBarModeGestural/NavigationBarModeGesturalOverlay.apk
"$MODPATH"/tools/zipsignero "$MODPATH"/miui.apk "$MODPATH"/Mods/MIUIc/GestureLineOverlay.apk
fi

#Install overlays (A11 and below)
if [ "$API" -le 30 ] ; then
mkdir -p "$MODPATH"/system"$OP"
cp -rf "$MODPATH"/Mods/Q/* "$MODPATH"/Mods/"$VAR3"/* "$MODPATH"/Mods/"$VAR4"/* "$MODPATH"/system"$OP"
fi

if [ "$API" -le 30 ] ; then
 if [ -f /product/overlay/GestureLineOverlay.apk ] ; then
 cp -rf "$MODPATH"/Mods/MIUIc/GestureLineOverlay.apk "$MODPATH"/system/product/overlay/
 elif [ -f /vendor/overlay/GestureLineOverlay.apk ] ; then
 cp -rf "$MODPATH"/Mods/MIUIc/GestureLineOverlay.apk "$MODPATH"/system/vendor/overlay/
 else
 :
 fi
fi

ui_print "Complete"
