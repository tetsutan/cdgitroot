
Script saving git/hg root to ~/.cdgitroot

# Install to Zsh

``` sh
# on .zsh
[ -f $ZSH/cdgitroot.zsh ] && source $ZSH/cdgitroot.zsh

function chpwd() {
  _reg_pwd_gitroot
}

```
Call `_echo_gitroot`


# Use with peco

``` sh
function peco-cdgitroot() {
    local selected_dir=$(_echo_gitroot | peco )
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}

zle -N peco-cdgitroot

bindkey '^@' peco-cdgitroot
```

