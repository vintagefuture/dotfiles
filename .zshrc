# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
# End of lines configured by zsh-newuser-install

# Environment variables
export MAVEN_OPTS="-Xms3072m -Xmx5120m -Djava.awt.headless=true"
export _JAVA_OPTIONS="-Duser.language=en -Duser.country=GB"
export JAVA_HOME=$HOME/nucl-workspace/workspace/tooling/jdk-17.0.1.jdk/Contents/Home/
export nuclear_config_location=$HOME/nucl-workspace/workspace/nucleus-nuclear-config/
if [ "$(arch)" = "i386" ]; then
	SHARE_DIR=/usr/local/share
	export PATH=/usr/local/Homebrew/bin:$PATH
else
	SHARE_DIR=/opt/homebrew/share
	export PATH=/opt/homebrew/bin:$PATH
fi
export PATH=$HOME/nucl-workspace/workspace/tooling/apache-maven-3.8.6/bin:$PATH

# Aliases
source ~/.aliases

# Zsh tools
source $SHARE_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $SHARE_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey '^ ' autosuggest-accept

# Prompt
autoload -Uz vcs_info
precmd() {
  psvar=()

  vcs_info
  [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
}
pre.html() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b%a)'
setopt PROMPT_SUBST
export PROMPT_DIRTRIM=1
PROMPT='%F{green}%*%f %F{blue}%1~ %F{red}${vcs_info_msg_0_}%f '
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#export DOCKER_HOST=docker
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# Make autocompletion case-insensitive
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
