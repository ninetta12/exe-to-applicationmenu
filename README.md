## What is this and why?
A script that easily adds executable files (.exe (with wine) and .sh) to your linux applications menu!

It automatically extracts the icon of a .exe file!

I made this because i wanted an easy way to add executable files instead of manually creating a .desktop file to the application menu, and because I was bored

## Installation
```
git clone https://github.com/ninetta12/exe-to-applicationmenu/
```
```
cd exe-to-applicationmenu
```

## Usage
```
sh exe-to-applicationmenu.sh path_to_file.exe
```
After running this, it will give you a 'quiz'. You get to choose in wich category to put it, and if your executable doesn't have an icon, you get to pick an icon by typing in its path!

If you want to remove the shortcut you just made, open your file manager, go to ~/.local/share/applications and delete it (press Ctrl+H if you don't see the .local directory in your home directory)
