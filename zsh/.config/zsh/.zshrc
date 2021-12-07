if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

export DISPLAY=:0.0
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export WORKON_HOME="$HOME/code/.virtualenvs"
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export ZDOTDIR="$HOME/.config/zsh"
export EDITOR="nvim"
export CHROME_EXECUTABLE="/usr/bin/chromium"

# NPM without sudo
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/jeff/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
# End of lines configured by zsh-newuser-install

# Oh my zsh + antigen
source /usr/share/zsh/share/antigen.zsh

## Use oh-my-zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle docker
antigen bundle kubernetes
antigen bundle pyenv
antigen theme cloud
antigen theme romkatv/powerlevel10k

antigen apply

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias spotify="spotify --force-device-scale-factor=2 & "

alias monitor_connect='xrandr \
                        --output DP-1-1 --scale 2x2 --mode 1920x1080 --fb 6000x3840 --rotate normal \
                        --output DP-1-2 --scale 2x2 --mode 1920x1080  --rotate left'

alias opennewterm="st >/dev/null 2>&1 & disown"
bindkey -s "^[n" "opennewterm\n"

alias packages="comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base -g base-devel | sort | uniq)"
alias x="extract.sh"
export MESA_LOADER_DRIVER_OVERRIDE=i965
alias cat="bat"
export TERMINAL="st"
alias o="open.sh"
alias z="zathura"
alias mnt_pi="sshfs pi@raspberrypi:/home/pi/Desktop/capstone ~/code/capstone"
alias ssh_pi="sshpass -p capstone ssh pi@raspberrypi"
alias matlab="~/programs/matlab/bin/./matlab"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
