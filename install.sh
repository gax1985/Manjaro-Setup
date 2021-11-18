# update system
sudo pacman -Syyu

# install usual apps
sudo pacman -S yay alacritty ttf-meslo-nerd-font-powerlevel10k ranger neofetch cmatrix discord base-devel
yay -S alacritty-themes dropbox visual-studio-code-bin expressvpn spotify tutanota-desktop-bin todoist gotop-bin

# install beautiful discord
python3 -m pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip

# copy config files
rsync -a .config .local .py .wallpapers .zshrc ~/

# set privileges for powerline configuration
sudo chmod u-rx /usr/share/zsh
p10k configure

# start and enable expressvpn daemon on login
sudo systemctl enable expressvpn
sudo systemctl start expressvpn