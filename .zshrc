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
export REPOS=/Users/gscara/nucl-workspace/workspace
if [ "$(uname -s)" = "Linux" ]; then
	SHARE_DIR=/usr/share
else
	if [ "$(arch)" = "i386" ]; then
		SHARE_DIR=/usr/local/share
		export PATH=/usr/local/Homebrew/bin:$PATH
	else
		SHARE_DIR=/opt/homebrew/share
		export PATH=/opt/homebrew/bin:$PATH
	fi
fi	

export PATH=$HOME/nucl-workspace/workspace/tooling/apache-maven-3.9.9/bin:$PATH

# Aliases
source ~/.aliases

# Zsh tools
source $SHARE_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $SHARE_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey '^ ' autosuggest-accept

# Prompt
autoload -Uz vcs_info add-zsh-hook
precmd() {
  psvar=()

  vcs_info
  [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
}
pre.html() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b%a) '
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +i'
setopt prompt_subst
setopt INC_APPEND_HISTORY
export PROMPT_DIRTRIM=1
PROMPT='%F{green}%*%f %F{blue}%1~ %F{red}${vcs_info_msg_0_}%f'
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# Make autocompletion case-insensitive
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info

# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c) '
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c) '
eval "$(direnv hook zsh)"

# Created by `pipx` on 2024-06-27 13:40:16
export PATH="$PATH:/Users/gscara/.local/bin"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
 
function https-server() {
  http-server --ssl --cert ~/.localhost-ssl/localhost.crt --key ~/.localhost-ssl/localhost.key
}

# Helper function to speed up creating new worktrees
wt() {
    if [ $# -ne 2 ]; then
        echo "Usage: wt <new-branch-name> <remote-branch>"
        echo "Example: wt feature-login origin/develop"
        return 1
    fi
    
    local NEW_BRANCH=$1
    local REMOTE_BRANCH=$2
    
    echo "Creating branch '$NEW_BRANCH' from '$REMOTE_BRANCH'..."
    git branch ${NEW_BRANCH} ${REMOTE_BRANCH}

    

    if [ $? -eq 0 ]; then
        echo "Creating worktree at $HOME/worktrees/${NEW_BRANCH}..."
        git worktree add $HOME/worktrees/${NEW_BRANCH} ${NEW_BRANCH}

        if [ $? -eq 0 ]; then
		echo -n "Open the new worktree in VSCode? (don't forget to run yarn) [Y/n]: "
            read -r response
            if [[ "$response" =~ ^[Yy]$ ]] || [[ -z "$response" ]]; then
                code $HOME/worktrees/${NEW_BRANCH}/nuclear-web-frontend/javascript
            fi
        fi
    else
        echo "Failed to create branch. Aborting worktree creation."
        return 1
    fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#export DOCKER_HOST=docker
drush() {
  docker exec -it -w /var/www/html drupal drush "$@"
}
export HISTCONTROL=ignoreboth
