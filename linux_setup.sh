# install some basic shit
sudo apt install curl zsh git tmux vim zsh

# install linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# switch shell to zsh
chsh --shell=$(which zsh)
