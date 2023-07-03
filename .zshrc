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
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/nucl-workspace/workspace/tooling/apache-maven-3.8.6/bin:$PATH

# Aliases
source ~/.aliases

# Zsh tools
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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
PROMPT='%F{blue}%f%F{green}%n@%m%f %F{yellow}%~%f %F{red}${vcs_info_msg_0_}%f%% '
