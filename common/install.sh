   ##########################################################################################
# Custom Logic
#########################################################   ##########################################################################################
# Custom Logic
##########################################################################################

#Detect and use compatible AAPT
chmod +x "$MODPATH"/tools/*
[ "$($MODPATH/tools/aapt v)" ] && AAPT=aapt
[ "$($MODPATH/tools/aapt64 v)" ] && AAPT=aapt64
cp -af "$MODPATH"/tools/$AAPT "$MODPATH"/aapt
mkdir -p "$MODPATH"/Mods/Q/NavigationBarModeGestura/
mkdir -p "$MODPATH"/Mods/Qtmp/
mkdir -p "$MODPATH"/system/app/
cp -rf "$MODPATH"/Mods/QS/* "$MODPATH"/Mods/Qtmp/
cp -rf "$MODPATH"/tools/service.sh "$MODPATH"

#if [ -d /system/xbin/ ] && [ ! -f /system/xbin/empty ] ; then
#    mkdir -p "$MODPATH"/system/xbin/
#    cp -rf "$MODPATH"/tools/hn "$MODPATH"/system/xbin/
#    cp -rf "$MODPATH"/tools/hnr "$MODPATH"/system/xbin/
#else
#    mkdir -p "$MODPATH"/system/bin/
#    cp -rf "$MODPATH"/tools/hn "$MODPATH"/system/bin/
#    cp -rf "$MODPATH"/tools/hnr "$MODPATH"/system/bin/
#fi

#Find and delete conflicting overlays/package-cache/resource-cache
find /data/adb/modules -type d -not -path "*HideNavBar/system*" -iname "*navigationbarmodegestural*" -exec rm -rf {} \; 2>/dev/null 
find /data/system/package_cache -type f -iname "*NavigationBarMode*" -exec rm -rf {} \; 2>/dev/null
find /data/resource-cache -type f -iname "*NavigationBarMode*" -exec rm -rf {} \; 2>/dev/null
find /data/resource-cache -type f -iname "*P" -exec rm -rf {} \; 2>/dev/null
find /data/resource-cache -type f -iname "*HL" -exec rm -rf {} \; 2>/dev/null
find /data/resource-cache -type f -iname "*L" -exec rm -rf {} \; 2>/dev/null
find /data/resource-cache -type f -iname "*PH" -exec rm -rf {} \; 2>/dev/null

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
     HKB=true
     FIM=false
     VAR3=a
     HKB=false
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
     VAR4=PH
     VAR5=HL
     HD=true
     else
     VAR3=a
     VAR4=a
     VAR5=a
     fi
fi

#Hide Keyboard buttons
if [ "$API" -ge 29 ]; then
 if [ "$FH" = 48.0 ] ; then
  cat "$LNG"8.txt
  if $VKSEL; then
  HKB=true
  else
  HKB=false
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
      BH=1.0
      FH=1.0
      else
      FBH=300
      BH=1.0
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
LRES="$MODPATH"/Mods/HPS1/res/values/dimens.xml
LRESS="$MODPATH"/Mods/HPS2/res/values/dimens.xml

if [ "$API" -ge 29 ]; then
sed -i s/0.3/"$BH"/g "$RES"
sed -i s/0.2/"$BH"/g "$LRES"
sed -i s/0.2/"$BH"/g "$LRESS"
sed -i s/0.1/"$FH"/g "$RES"
sed -i s/0.2/"$GS"/g "$RES"
mkdir -p "$MODPATH"/Mods/Qtmp/res/values-sw900dp/
mkdir -p "$MODPATH"/Mods/Qtmp/res/values-sw600dp/
mkdir -p "$MODPATH"/Mods/Qtmp/res/values-440dpi/
mkdir -p "$MODPATH"/Mods/Qtmp/res/values-xhdpi/
mkdir -p "$MODPATH"/Mods/Qtmp/res/values-xxhdpi/
mkdir -p "$MODPATH"/Mods/Qtmp/res/values-xxxhdpi/
mkdir -p "$MODPATH"/Mods/P/
mkdir -p "$MODPATH"/Mods/L/
mkdir -p "$MODPATH"/Mods/PH/
mkdir -p "$MODPATH"/Mods/HL/
mkdir -p "$MODPATH"/Mods/HTK/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/dimens.xml "$MODPATH"/Mods/Qtmp/res/values-sw900dp/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/dimens.xml "$MODPATH"/Mods/Qtmp/res/values-sw600dp/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/dimens.xml "$MODPATH"/Mods/Qtmp/res/values-440dpi/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/dimens.xml "$MODPATH"/Mods/Qtmp/res/values-xhdpi/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/dimens.xml "$MODPATH"/Mods/Qtmp/res/values-xxhdpi/
cp -rf "$MODPATH"/Mods/Qtmp/res/values/dimens.xml "$MODPATH"/Mods/Qtmp/res/values-xxxhdpi/
fi

#Detect original overlay location
#OP=$(find /system/overlay /product/overlay /vendor/overlay /system_ext/overlay -type d -iname "navigationbarmodegestural" | cut -d 'N' -f1)

#Building overlays (A11 and below)
if [ "$API" -lt 34 ] && [ "$API" -ge 29 ]; then
    "$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/Qtmp/AndroidManifest.xml" -I /system/framework/framework-res.apk -S "$MODPATH/Mods/Qtmp/res" -F "$MODPATH"/unsigned.apk >/dev/null
    "$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/HPS1/AndroidManifest.xml" -I /system/framework/framework-res.apk -S "$MODPATH/Mods/HPS1/res" -F "$MODPATH"/unsigned2.apk >/dev/null
    "$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/HPS2/AndroidManifest.xml" -I /system/framework/framework-res.apk -S "$MODPATH/Mods/HPS2/res" -F "$MODPATH"/unsigned3.apk >/dev/null
    "$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/HPS3/AndroidManifest.xml" -I /system/framework/framework-res.apk -S "$MODPATH/Mods/HPS3/res" -F "$MODPATH"/unsigned4.apk >/dev/null
    "$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/HPS4/AndroidManifest.xml" -I /system/framework/framework-res.apk -S "$MODPATH/Mods/HPS4/res" -F "$MODPATH"/unsigned5.apk >/dev/null
elif [ "$API" -ge 34 ]; then
     "$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/Qtmp/AndroidManifest.xml" -I "$MODPATH"/tools/framework-res.apk -S "$MODPATH/Mods/Qtmp/res" -F "$MODPATH"/unsigned.apk >/dev/null
     "$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/HPS1/AndroidManifest.xml" -I "$MODPATH"/tools/framework-res.apk -S "$MODPATH/Mods/HPS1/res" -F "$MODPATH"/unsigned2.apk >/dev/null
     "$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/HPS2/AndroidManifest.xml" -I "$MODPATH"/tools/framework-res.apk -S "$MODPATH/Mods/HPS2/res" -F "$MODPATH"/unsigned3.apk >/dev/null
     "$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/HPS3/AndroidManifest.xml" -I "$MODPATH"/tools/framework-res.apk -S "$MODPATH/Mods/HPS3/res" -F "$MODPATH"/unsigned4.apk >/dev/null
     "$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/HPS4/AndroidManifest.xml" -I "$MODPATH"/tools/framework-res.apk -S "$MODPATH/Mods/HPS4/res" -F "$MODPATH"/unsigned5.apk >/dev/null
fi

if [ "$HKB" = true ]; then
"$MODPATH"/aapt p -f -v -M "$MODPATH/Mods/HKBT/AndroidManifest.xml" -I /system/framework/framework-res.apk -S "$MODPATH/Mods/HKBT/res" -F "$MODPATH"/unsigned6.apk >/dev/null

"$MODPATH"/tools/zipsigner "$MODPATH"/unsigned6.apk "$MODPATH"/Mods/HTK/HTK.apk

cp -rf "$MODPATH"/Mods/HTK/ "$MODPATH"/system/app/
fi


if [ "$API" -ge 30 ]; then
"$MODPATH"/tools/zipsigner "$MODPATH"/unsigned.apk "$MODPATH"/Mods/Q/NavigationBarModeGestura/NavigationBarModeGesturalOverlay.apk
"$MODPATH"/tools/zipsigner "$MODPATH"/unsigned2.apk "$MODPATH"/Mods/P/Pixel.apk
"$MODPATH"/tools/zipsigner "$MODPATH"/unsigned3.apk "$MODPATH"/Mods/L/L3.apk
"$MODPATH"/tools/zipsigner "$MODPATH"/unsigned4.apk "$MODPATH"/Mods/PH/PH.apk
"$MODPATH"/tools/zipsigner "$MODPATH"/unsigned5.apk "$MODPATH"/Mods/HL/HL.apk
elif [ "$API" -eq 29 ] ; then
"$MODPATH"/tools/zipsignero "$MODPATH"/unsigned.apk "$MODPATH"/Mods/Q/NavigationBarModeGestura/NavigationBarModeGesturalOverlay.apk
fi

#Install overlays (A11 and below)
if [ "$API" -ge 29 ]; then
mkdir -p "$MODPATH"/system"$OP"
cp -rf "$MODPATH"/Mods/Q/* "$MODPATH"/Mods/P/ "$MODPATH"/Mods/L/ "$MODPATH"/Mods/"$VAR3"/ "$MODPATH"/Mods/"$VAR4"/ "$MODPATH"/Mods/"$VAR5"/ "$MODPATH"/system/app/
 if [ "$HKB" = true ]; then
 cp -rf "$MODPATH"/Mods/HKB/ "$MODPATH"/system/app/
 fi
fi


ui_print "If you're using KernelSU, add SystemUI to the root list"
ui_print "and make sure unmount modules is disabled"


ui_print "Complete"
 
