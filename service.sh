#!/system/bin/sh
if [ -f /data/adb/modules/rboard-themes_addon/system.prop ] || [ -f /data/adb/modules/gboardnavbar/system.prop ] || [ -f /data/adb/modules/rboard-themes/system.prop ]; then
printf 'do nothing'
else
resetprop ro.com.google.ime.kb_pad_port_b 1.0
fi
