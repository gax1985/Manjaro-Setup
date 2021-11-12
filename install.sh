# update system
sudo pacman -Syyu

# install usual apps
sudo pacman -S yay ranger neofetch cmatrix discord
yay -S dropbox visual-studio-code-bin expressvpn spotify tutanota-desktop-bin todoist-appimage gotop-bin

# install beautiful discord
python3 -m pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip

# copy config files
rsync -a .config .local .py .wallpapers .zshrc ~/