#!/bin/sh
EXE=$1
PATH=$(/bin/dirname $EXE)
EXENAME=$(/bin/basename $EXE)
CATEGORIES=$(/bin/zenity --entry --title="In wich application menu category should i be?

(type 'Game' if you want it to be in the 'Games' menu)" )
LOCATION=$2

/bin/wrestool -x -t 14 $EXE > ~/Pictures/icons/$EXENAME.ico
ICON=~/Pictures/icons/$EXENAME.ico

echo "Categories=$CATEGORIES"

(echo "[Desktop Entry]"
echo "Categories=$CATEGORIES"
echo "Comment[en_US]="
echo "Comment="
echo "Exec=env LUTRIS_SKIP_INIT=1 wine $EXE"
echo "GenericName[en_US]="
echo "GenericName="
echo "Icon=$ICON"
echo "MimeType="
echo "Name[en_US]=$EXENAME"
echo "Name=$EXENAME"
echo "Path=$PATH"
echo "StartupNotify=true"
echo "Terminal=false"
echo "TerminalOptions="
echo "TryExec=lutris"
echo "Type=Application"
echo "X-KDE-SubstituteUID=false"
echo "X-KDE-Username=") > ~/Desktop/$EXENAME.desktop

/bin/mv ~/Desktop/$EXENAME.desktop ~/.local/share/applications
