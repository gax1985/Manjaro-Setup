# Manjaro/KDE Setup Files

## Description
* These are all the necessary files to get Manjaro/KDE set up to my preferences; install.sh places all of them where they belong.
* If you're only insterested in the Pywal stuff, check out the info & install instructions below

## Global Pywal Setter

<p align='center'>
    <img src='screens.gif'>
</p>

### How it works:
* The sh files contain templates which output a new file with updated color values (all executed by pywal_kde_theme.py).
  * Alacritty's template is based on the program's settings file. It contains my preferences for Alacritty and the color values. You can change the template to match your preferences but do not change anything in the colors block. Alacritty automatically updates when the settings file is changed.
  * Discord's template is set up for BeautifulDiscord (I based this from a gruvbox theme I found a while ago). BeautifulDiscord also automatically updates when the css file is changed.
  * KDE's template is based on a colorscheme file. If you set a global theme in KDE (I prefer Materia) and then change the Plasma-Style to Breath (Follows color scheme), all of KDE's UI elements will follow the same colors. After the colorscheme is generated from the template, pywal_kde_theme.py sets that colorscheme using plasma-theme (the binary is provided here).
  * Spicetify's template is based off the Dribbblish[](https://github.com/morpheusthewhite/spicetify-themes/tree/master/Dribbblish) theme. After the new file is generated, pywal_kde_theme.py applies the update only if spotify is currently running. 
* kde_wall_setter.py sets the wallpaper in KDE (pywal's background change doesn't work with KDE).
* pywal_kde_theme.py expects a theme name when being called. It will find and set a random wallpaper according to the given theme (in .wallpapers). It then calls Pywal with that random wallpaper as the input argument and, finally, it updates KDE, Alacritty, Discord, and Spotify according to the newly generated Pywal color scheme.
### How to install on your system:
1. You will need to have Pywal[](https://github.com/dylanaraps/pywal) installed. If you want to theme discord, you will need BeautifulDiscord[](https://github.com/leovoel/BeautifulDiscord) installed. If you want to theme Spotify, you will need Spicetify[](https://github.com/khanhas/spicetify-cli) installed. Konsole will not work with Pywal, so you will have to get another terminal emulator which will work with Pywal (I recommend Alacritty[](https://github.com/alacritty/alacritty)).
2. Copy the necessary files:
    ```bash
    rsync -a .global_pywal_setter .wallpapers ~/
    sudo rsync plasma-theme /usr/local/bin/
    ```
3. Add an alias to make updating much quicker:
    ```bash
    echo 'alias theme="python3 $HOME/.global_pywal_setter/pywal_kde_theme.py"' >> ~/.bashrc

    # or if you're using zsh

    echo 'alias theme="python3 $HOME/.global_pywal_setter/pywal_kde_theme.py"' >> ~/.zshrc
    ```
4. Run the tool once with any theme to generate all pywal files (everything except discord should be set after). 
    ``` bash
    theme med
    ```
    We need to run this once so BeautifulDiscord knows which css file to keep track of:
    ``` bash
    python3 -m pip BeautifulDiscord --css ~/.config/beautdisc/pywal.css
    ```
### How to use:
* Example calls with different themes:
    ```bash
    theme low
    theme med
    theme hi
    theme solid
    ```
### How to customize for yourself:
* If there's something (Alacritty, Discord, etc) you don't want updated with new themes:
  * Remove its respective method and method call from pywal_kde_theme.py
* If you'd like to add different themes:
  * Add the theme name to the list <b>supported_themes</b> in the method <b>supported</b> in pywal_kde_theme.py. Then add a folder with the same theme name to .wallpapers and put your desired wallpapers in that new folder
* If you'd like to change the wallpapers location:
  * Move the wallpapers to where you'd like and update <b>path</b> in the method <b>set_wall</b> in pywal_kde_theme.py