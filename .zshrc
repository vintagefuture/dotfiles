# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
# End of lines configured by zsh-newuser-install
export MAVEN_OPTS="-Xms3072m -Xmx5120m -Djava.awt.headless=true"
export _JAVA_OPTIONS="-Duser.language=en -Duser.country=GB"
export JAVA_HOME=$HOME/nucl-workspace/workspace/tooling/jdk-17.0.1.jdk/Contents/Home/
export nuclear_config_location=$HOME/nucl-workspace/workspace/nucleus-nuclear-config/
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/nucl-workspace/workspace/tooling/apache-maven-3.8.6/bin:$PATH
# eval "$(jump shell)"
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh
source ~/.aliases
#PROMPT='%F{blue}[%T]%f %F{green}%n@%m%f %F{yellow}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}$ '

# function parse_git_branch() {
#     git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
# }

# COLOR_DEF=$'\e[0m'
# COLOR_USR=$'\e[38;5;243m'
# COLOR_DIR=$'\e[38;5;197m'
# COLOR_GIT=$'\e[38;5;39m'


source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey '^ ' autosuggest-accept


autoload -Uz vcs_info

precmd() {
  psvar=()

  vcs_info
  [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
}

PS1="%m%(1v.%F{red}%1v%f.)%# "   
PS1='%n@%m:%~$ '
autoload -Uz vcs_info
pre.html() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b%a)'
setopt PROMPT_SUBST
PROMPT='%F{blue}[%T]%f %F{green}%n@%m%f %F{yellow}%~%f %F{red}${vcs_info_msg_0_}%f%% '
