FROM archlinux:base-devel

# Updates
RUN pacman -Syyu --noconfirm 

# Install dev env
RUN pacman -S neovim zsh git lazygit unzip go neofetch ripgrep llvm clang valgrind openssh --noconfirm 

ADD ./entrypoint.sh /entrypoint.sh

WORKDIR /root

ENTRYPOINT ["bash", "-c", "/entrypoint.sh"]
