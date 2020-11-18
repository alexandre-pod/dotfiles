IS_MAC=false
IS_LINUX=false

case "$(uname -s)" in
  Darwin*)
    IS_MAC=true
    ;;
  Linux*)
    IS_LINUX=true
    ;;
esac

# if [[ "$IS_MAC" == 'true' ]]; then
#   export PATH="/usr/local/opt/ruby/bin:$PATH"
# fi

# if [ -d '/usr/local/opt/ruby/bin' ];
#   export PATH="/usr/local/opt/ruby/bin:$PATH"
# fi

prepend_path() {
  if [ -d "$1" ]; then
    export PATH="$1:$PATH"
  fi
}

prepend_path_always() {
  export PATH="$1:$PATH"
}
# prepend_path ~/.local/go/bin

if [ -f ~/.dotfiles/aliases.sh ]; then
  source ~/.dotfiles/aliases.sh
fi

# ZSH prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%{%F{red}%}(%b)%{%f%} '
PROMPT='%{%F{green}%}%n@%m:%{%F{cyan}%}%~%{%f%} ${vcs_info_msg_0_}$ '
