# ***************************************************************
# ********************  basic  ********************************
# ***************************************************************
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bira"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 30

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# ***************************************************************
# ********************  customer  ********************************
# ***************************************************************


# | -------------------- autocmd --------------------------|

# for vmware-tools ..
echo 237297 | sudo -S /usr/bin/vmhgfs-fuse .host:/ /mnt/hgfs -o subtype=vmhgfs-fuse,allow_other; clear;


# | -------------------- alias  --------------------------|
alias cdwin='cd $WINSHARE_HOME'
alias cdnote='cd $NOTEBOOK_HOME'

# for java
alias jco='javac -d out'

# for lazygit
alias lg='lazygit'

# ( NOTE: 'c' for create, 'a' for attach/source, 'k' for kill/exit)

# for tmux
alias tc='tmux new -s w0'
alias tk='tmux kill-session'
alias ta='tmux attach -t'

# for pyenv ( WARNING:所用python3 + pip3)
alias vc='python3 -m venv venv'
alias va='source ./venv/bin/activate'
alias vk='deactivate'

# -------------- function 


# for config_records
sc()
{
  cp ~/.zshrc       config_records
  cp ~/.tmux.conf   config_records
}


# for proxy( WARNING:所用的是clash_for_linux)
on_proxy() {
  sudo /home/evfomoney/Downloads/clash-for-linux/start.sh
  source /etc/profile.d/clash.sh
  proxy_on
}
off_proxy(){
  sudo /home/evfomoney/Downloads/clash-for-linux/shutdown.sh
  proxy_off
}


# | --------------------  PATH  --------------------------|

# for notebook
export NOTEBOOK_HOME=/mnt/hgfs/Notebook/
# for winshare
export WINSHARE_HOME=/mnt/hgfs/

# for nodejs
export NODEJS_HOME=/usr/local/lib/node/node-v18.17.0-linux-x64
export PATH=$NODEJS_HOME/bin:$PATH

# for java
export JAVA_HOME=/usr/local/bin/jdk-17.0.7
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:./out:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

# for fcitx5 WARNING: 你还应该去设置`~/.pam_environment`
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx
