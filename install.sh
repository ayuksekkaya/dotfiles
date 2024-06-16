#!/bin/zsh

# Download the latest version of Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz

# Remove any existing Neovim installation in /opt/nvim
sudo rm -rf /opt/nvim

# Extract the downloaded Neovim tarball to /opt
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# Add Neovim to the system PATH
export PATH="$PATH:/opt/nvim-linux64/bin"

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone the Powerlevel10k theme for Oh My Zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install zoxide for quick directory navigation
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Clone the fzf repository for fuzzy finding
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

# Install fzf
~/.fzf/install --all

# Install bat (a cat clone with syntax highlighting)
sudo apt install bat

# Install fd (a simple, fast and user-friendly alternative to find)
sudo apt install fd-find

# Create a local bin directory if it doesn't exist
mkdir -p ~/.local/bin

# Create a symbolic link for fd-find
ln -s $(which fdfind) ~/.local/bin/fd

# Create a symbolic link for bat
ln -s /usr/bin/batcat ~/.local/bin/bat

# Download the latest release of git-delta
wget https://github.com/dandavison/delta/releases/latest/download/git-delta_0.17.0_amd64.deb

# Install git-delta
sudo dpkg -i git-delta_0.17.0_amd64.deb

# Remove the downloaded git-delta package
rm git-delta_0.17.0_amd64.deb

# Optional: Add the new PATH to your .zshrc to ensure it's available in future sessions
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.zshrc
source ~/.zshrc

