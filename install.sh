# update system
sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu

# install usual apps
sudo pacman -S yay alacritty ttf-meslo-nerd-font-powerlevel10k ranger neofetch cmatrix discord python-pywal base-devel
yay -S alacritty-themes dropbox visual-studio-code-bin expressvpn spotify tutanota-desktop-bin todoist gotop-bin

# install beautiful discord
python3 -m pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip

# copy config files
rsync -a .config .local .scripts .wallpapers .zshrc ~/
sudo rsync plasma-theme /usr/local/bin/

# start and enable expressvpn daemon on login
sudo systemctl enable expressvpn
sudo systemctl start expressvpn

# sudo chmod ugo+rwx /usr/share/zsh
# p10k configure
# sudo chmod ugo-w /usr/share/zsh
