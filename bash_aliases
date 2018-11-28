# Add colors if supported
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Make ls fancy
alias la='ls -A'
alias ll='ls -l'
#alias ll='ls -l --time-style="+%F %X %z"'

# Maven stuff
alias mci='mvn clean install'
alias mcis='mvn clean install -DskipTests'

# Use neovim instead of vim
#alias vim='nvim'

