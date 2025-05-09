#!/usr/bin/bash

aptInstall() {
    if hash $1 2>/dev/null; then
        echo "[-] $1 is already installed"
    else
        sudo apt-get install -y $1
    fi
}


snapInstall() {
    if hash $1 2>/dev/null; then
        echo "[-] $1 is already installed"
    else
        sudo snap install -y $1
    fi
}


packages=(
    git
    htop
    snapd
    python3
    python3-pip
    zsh
    curl
    tmux
    fzf
    neovim
    jq
    fd-find
)

#update the system
echo "[+] Updating The System"
sudo apt-get -y update 

echo "[+] Installing Packages"
for package in ${packages[@]}; do
    echo "[+] Installing Package: $package"
    aptInstall $package
done

#create directory for Development
echo "[+] Created The Development Directory"
mkdir ~/Development

#install vscode
# echo "[+] Installing VS Code"
# sudo snap install --classic code

#install spotify
# echo "[+] Installing Spotify"
# snapInstall spotify

#install oh-my-zsh
echo "[+] Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Install Addons
echo "[+] Installing Addons"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Create and
mkdir ~/github
git clone https://github.com/andronikosf/dotfiles.git ~/github/dotfiles

# Initialize Nvim
mkdir -p ~/.config/nvim
cp ~/github/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
