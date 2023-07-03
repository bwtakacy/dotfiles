bindkey -v
bindkey '^R' history-incremental-search-backward

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi
eval "$(pyenv init -)"

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout git branch (including remote branches)
fbrm() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# プロンプトカスタマイズ
PROMPT='
[%F{red}%f%b:%F{green}%~%f]%F{cyan}$vcs_info_msg_0_%f
%F{yellow}$%f '

#export DOCKER_HOST=unix://${HOME}/.lima/docker_x86_64/sock/docker.sock 
#export LIMA_INSTANCE=docker_x86_64
#export DOCKER_HOST='tcp://127.0.0.1:2375'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/rls01017017/.pyenv/versions/miniforge3-4.10.3-10/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/rls01017017/.pyenv/versions/miniforge3-4.10.3-10/etc/profile.d/conda.sh" ]; then
        . "/Users/rls01017017/.pyenv/versions/miniforge3-4.10.3-10/etc/profile.d/conda.sh"
    else
        export PATH="/Users/rls01017017/.pyenv/versions/miniforge3-4.10.3-10/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rls01017017/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rls01017017/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rls01017017/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rls01017017/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="/Users/rls01017017/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.embulk/bin:$PATH"

export JAVA_HOME=`/usr/libexec/java_home -v "18"`
PATH=${JAVA_HOME}/bin:${PATH}

alias ctags='/opt/homebrew/Cellar/ctags/5.8_2/bin/ctags'
