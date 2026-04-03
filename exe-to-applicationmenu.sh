#!/bin/sh

#variables
EXE=$1
PATH=$(/bin/dirname $EXE)
EXENAME=$(/bin/basename $EXE)

#quiz

CUSTOMNAME=$(/bin/zenity --entry --title="What should be it's name?

(this is what it will be called in the applications menu)

(leave blank if you just want it to be called the name of your executable" )

#set CUSTOMNAME to the executable file name if this question was left blank
if [ $CUSTOMNAME == ""]
then
    CUSTOMNAME=$EXENAME
fi


CATEGORIES=$(/bin/zenity --entry --title="In wich application menu category should I be?

(type 'Game' if you want it to be in the 'Games' menu)" )

FILETYPE=$(/bin/zenity --entry --title="What type of executeable am I?

(.sh or .exe)")

#get the .exe icon if its a .exe file, or else it asks for the path to an icon
if [ $FILETYPE == ".exe" ]
then
    #extract the icon from the .exe
    /bin/wrestool -x -t 14 $EXE > ~/Pictures/icons/$EXENAME.ico
    ICON=~/Pictures/icons/$EXENAME.ico

    DESKTOPPROGRAM="Exec= wine $EXE"
else
    #ask for an icon
    ICON=$(/bin/zenity --entry --title="Add the path to the icon you want

    (for example: ~/Pictures/icons/your_icon.png)")


    DESKTOPPROGRAM="Exec= sh $EXENAME"
    echo $DESKTOPPROGRAM
fi


#make the .desktop file
(echo "[Desktop Entry]"
echo "Categories=$CATEGORIES"
echo "Comment[en_US]="
echo "Comment="
echo "$DESKTOPPROGRAM"
echo "GenericName[en_US]="
echo "GenericName=$CUSTOMNAME"
echo "Icon=$ICON"
echo "MimeType="
echo "Name[en_US]=$CUSTOMNAME"
echo "Name=$CUSTOMNAME"
echo "Path=$PATH"
echo "StartupNotify=true"
echo "Terminal=false"
echo "TerminalOptions="
echo "TryExec=lutris"
echo "Type=Application"
echo "X-KDE-SubstituteUID=false"
echo "X-KDE-Username=") > ~/.local/share/applications/$EXENAME.desktop


