# update system
sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu

# install usual apps
sudo pacman -S yay base-devel
yay -S alacritty ttf-meslo-nerd-font-powerlevel10k ttf-raleway ranger neofetch cmatrix gotop-bin discord dropbox visual-studio-code-bin expressvpn spotify spicetify-cli python-pywal libreoffice-fresh

# install beautiful discord and pywalfox
python3 -m pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip
python3 -m pip install pywalfox
pywalfox install

# copy config files
rsync -a .config .local .global_pywal_setter .wallpapers .zshrc ~/
sudo rsync plasma-theme /usr/local/bin/

# start and enable expressvpn daemon on login
sudo systemctl enable expressvpn
sudo systemctl start expressvpn

# configure spotify for spicetify
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify config extensions dribbblish.js
spicetify config current_theme Dribbblish color_scheme pywal
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify backup

# p10k configure