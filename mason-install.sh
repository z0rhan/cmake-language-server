#!/usr/bin/env bash

pkgname="cmake-language-server"
current_dir="$PWD"

mason_install_dir="$HOME/.local/share/nvim/mason/packages/$pkgname"
mason_bin_dir="$HOME/.local/share/nvim/mason/bin"

relative_mason_install_dir="../packages"
relative_target_dir="$relative_mason_install_dir/$pkgname/venv/bin/$pkgname"

echo "Making directory $mason_install_dir"
mkdir -p "$mason_install_dir"
cd "$mason_install_dir"

echo "Making python venv at $mason_install_dir"
python -m venv venv
source ./venv/bin/activate

echo "Installting $pkgname..."
pip install "$current_dir"

echo "Creating symlink"
cd "$mason_bin_dir"
ln -s "$relative_target_dir" "$pkgname"
