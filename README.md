# Manjaro/KDE Setup Files
## Description
* These are all the necessary files to get Manjaro/KDE set up to my preferences; install.sh places all of them where they belong.

## Global Pywal Setter
### How it works:
* The sh files are templates which output a new file with updated color values after pywal is called.
* kde_wall_setter.py sets the wallpaper in KDE (for some reason pywal doesnt do that on its own in KDE).
* pywal_kde_theme.py expects a theme name when being called. It will find and set a random wallpaper according to the given theme (in .wallpapers). It then updates KDE, Alacritty, Discord, and Spotify.
### How to install on your system:
1. You will need to have Pywal, Discord, BeautifulDiscord, Spotify, and Spicetify installed. Konsole will not work with Pywal, so you will have to get another terminal emulator which will work with Pywal (I recommend Alacritty).
2. Copy the necessary files:
    ```bash
    rsync -a .global_pywal_setter .wallpapers ~/
    sudo rsync plasma-theme /usr/local/bin/
    ```
3. Add an alias to make updating much quicker:
    ```bash
    echo 'alias theme="py $HOME/.global_pywal_setter/pywal_kde_theme.py"' >> ~/.bashrc
    ```
### How to customize for yourself:
* If there's something (Alacritty, Discord, etc) you don't want updated with new themes:
  * Remove its respective method and method call from pywal_kde_theme.py
* If you'd like to add different themes:
  * Add the theme name to the list <b>supported_themes</b> in the method <b>supported</b> in pywal_kde_theme.py. Then add a folder with the same theme name to .wallpapers and put your desired wallpapers in that new folder
* If you'd like to change the wallpapers location:
  * Move the wallpapers to where you'd like and update <b>path</b> in the method <b>set_wall</b> in pywal_kde_theme.py