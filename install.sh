#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

echo "Starting configuration..."

echo "Configuring dotfiles..."
cd ./home || exit

find * -type d -exec mkdir -p "${HOME}"/.{} \;
find * -type f -exec ln -sf "${PWD}"/{} "${HOME}"/.{} \;

echo "Configuring packages..."
brew update
brew bundle install --global
brew bundle cleanup --force --global

echo "Configuring Vim..."
vim_home=$HOME/.vim
mkdir -p "${vim_home}"/swap
mkdir -p "${vim_home}"/undo

echo "Configuring Projects..."
project_home=$HOME/Projects
mkdir -p "${project_home}"/Personal/sandbox
mkdir -p "${project_home}"/Work/sandbox

echo "Done!"
