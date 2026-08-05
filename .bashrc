# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc


alias open='xdg-open'

alias movietime='node /home/aditya11/Desktop/Code/cloned/local-player/server.js'

alias windows='sudo efibootmgr -n 0003 | sudo reboot'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# opencode
export PATH=/home/aditya11/.opencode/bin:$PATH

# Added by LM Studio CLI tool (lms)
export PATH="$PATH:/home/aditya11/.lmstudio/bin"

alias lmstudio='./home/aditya11/Downloads/LM-Studio-0.4.20-1-x64.AppImage'
export PATH="$HOME/.cargo/bin:$PATH"

afetch
eval "$(starship init bash)"
