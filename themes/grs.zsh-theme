#cal ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo "%{$fg_bold[blue]%}(%{$fg_bold[green]%}"`basename $VIRTUAL_ENV`"%{$fg_bold[blue]%})"
}

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function battery_charge() {
    if [ -e ~/bin/batcharge.py ]
    then
        echo `python ~/batcharge.py`
    else
        echo '';
    fi
}

PROMPT=' $fg[yellow]$(get_pwd) $(git_prompt_info) $(virtualenv_info) $(battery_charge)
%{$reset_color%}→ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[blue]%}) %{$fg_bold[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue]%})"
