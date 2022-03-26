#! /bin/bash

set -e

if [[ ! -d ~/.oh-my-zsh ]]
then
	# Add oh-my-zsh && auto suggestion plugins
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]
then
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [[ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]]
then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi


if [[ ! -d ~/.local/share/nvim/site/pack/packer ]]
then
	# Install nvim packer
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 		~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi


if [[ ! -d ~/.config/nvim ]]
then
	# Add neovim dotfiles
	git clone https://github.com/boyerdamien/neovim.git ~/.config/nvim
fi

neofetch && zsh

