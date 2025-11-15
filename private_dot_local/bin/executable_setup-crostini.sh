#!/bin/bash
#
# setup-crostini.sh: Crostini-Specific Development Environment Setup
#
# This script is guarded and will ONLY run on a Crostini machine.
# It installs and configures a complete developer environment
# based on our conversations, preferring modern package managers
# (cargo, nvm, pyenv) over apt where possible.

# Exit immediately if any command fails
set -e

# --- Helper Function for Logging ---
log() {
  echo ""
  echo "=================================================================="
  echo ">>> $1"
  echo "=================================================================="
}

# --- 1. CROSTINI-SPECIFIC GUARD CLAUSE ---
log "Checking for Crostini environment..."
if [ ! -f "/dev/.cros_milestone" ]; then
  echo "This script is intended for Crostini (ChromeOS Linux) only."
  echo "Exiting without making any changes."
  exit 1
fi
echo "Crostini environment detected. Proceeding with installation."

# --- 2. System Dependencies (The *Only* apt Step) ---
# We must use apt once to get the build tools required to
# compile Python, tmux, and other packages from source.
log "Installing base packages and build dependencies with apt"
sudo apt update
sudo apt install -y \
  build-essential \
  autoconf \
  automake \
  pkg-config \
  libevent-dev \
  libncurses5-dev \
  libncursesw5-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libbz2-dev \
  libffi-dev \
  liblzma-dev \
  python3-openssl \
  tk-dev \
  zlib1g-dev \
  xz-utils \
  bison \
  curl \
  git

# --- 3. Install Rust (cargo) ---
log "Installing Rust and Cargo via rustup"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Add cargo to the current shell's PATH so we can use it right away
export PATH="$HOME/.cargo/bin:$PATH"

# --- 4. Install Cargo-based Tools ---
log "Installing Rust tools (alacritty, ripgrep, fd, zoxide, ast-grep, dust)"
cargo install alacritty
cargo install ripgrep
cargo install fd-find
cargo install zoxide
cargo install ast-grep
cargo install du-dust

# --- 5. Install NVM (Node Version Manager) ---
log "Installing NVM (Node Version Manager)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# Source nvm to use it in this script
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

log "Installing latest LTS version of Node.js"
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

# --- 6. Install Global NPM Packages ---
log "Installing global npm packages for Neovim"
npm install -g \
  neovim \
  tree-sitter-cli \
  prettier \
  markdownlint-cli2 \
  markdown-toc \
  @mermaid-js/mermaid-cli

# --- 7. Install pyenv (Python Version Manager) ---
log "Installing pyenv"
curl https://pyenv.run | bash

# Add pyenv to the current shell's PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

log "Compiling Python 3.12... (This will take 10-15 minutes)"
pyenv install 3.12
pyenv global 3.12

# --- 8. Install Python (pip) Packages ---
log "Upgrading pip and installing pynvim"
# We use pip3, which pyenv has now pointed to Python 3.12
pip3 install --upgrade pip
pip3 install --user pynvim

# --- 9. Install Tools from Source / Binary ---
log "Installing fzf, lazygit, and tmux"

# Create ~/.local/bin if it doesn't exist
mkdir -p $HOME/.local/bin

# fzf (from git)
log "Installing fzf from git..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all # --all installs keybindings and completion

# lazygit (binary for arm64)
log "Installing lazygit binary (for aarch64)..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^\"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_arm64.tar.gz"
tar xf lazygit.tar.gz lazygit
mv lazygit ~/.local/bin/
rm lazygit.tar.gz

# tmux (compile from latest stable tag)
log "Compiling tmux from source (latest stable tag)..."
git clone https://github.com/tmux/tmux.git ~/tmux-src
cd ~/tmux-src
# This command checks out the latest stable release tag
git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
./autogen.sh
./configure --prefix=$HOME/.local
make -j$(nproc)
make install
cd ~
rm -rf ~/tmux-src

# --- 10. Set up SSH Key for GitHub (Crostini-Specific) ---
log "Setting up SSH key for GitHub"
echo "This key will be specific to this Crostini machine."
echo "Please enter the email associated with your GitHub account:"
read user_email

ssh-keygen -t ed25519 -C "$user_email"

echo "Adding your new key to the ssh-agent..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo ""
log "ACTION REQUIRED: Copy the key below and add it to GitHub:"
echo "https://github.com/settings/keys"
echo ""
cat ~/.ssh/id_ed25519.pub
echo ""
read -p "Press [Enter] to continue once you have added the key to GitHub..."

# --- 11. Install chezmoi (if not already present) ---
# This assumes chezmoi is not yet installed.
log "Installing chezmoi binary"
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
export PATH="$HOME/.local/bin:$PATH"

# --- 12. Final Setup: chezmoi and Neovim ---
log "Initializing chezmoi from your dotfiles repository"
# We use the SSH URL we just set up the key for.
# This assumes your main branch is 'main'.
chezmoi init --apply --branch main git@github.com:m-takeuchi/dotfiles.git

# --- 13. Finalize Neovim (The "Nuke and Rebuild") ---
# This fixes the lazy-lock.json and plugin build issues we debugged.
log "Finalizing Neovim plugin setup"
echo "Removing any old/broken lockfiles or plugin code..."
rm -f ~/.config/nvim/lazy-lock.json
rm -rf ~/.local/share/nvim/lazy/

echo "Starting Neovim to install all plugins. This will open nvim."
echo "Please wait for it to finish, then quit with :qa"
echo "Press [Enter] to continue..."
read
nvim

log "Running build for any plugins that need it (like markdown-preview)..."
nvim --headless "+Lazy build" +qa

log "Cleaning up any old plugin versions..."
nvim --headless "+Lazy clean" +qa

log "SETUP COMPLETE!"
echo ""
echo "!!! --- FINAL ACTION REQUIRED --- !!!"
echo "Your new, correct 'lazy-lock.json' file has been created."
echo "You MUST save this new lockfile to your dotfiles repository."
echo ""
echo "Please run this command NOW:"
echo ""
echo "  chezmoi add ~/.config/nvim/lazy-lock.json"
echo ""
echo "After that, run 'chezmoi git commit' and 'chezmoi git push'."
echo "Your new Crostini environment is ready. Please run 'exec zsh' to reload."
