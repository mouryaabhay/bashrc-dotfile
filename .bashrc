# =============================================================================
# .bashrc (merged)
# =============================================================================

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# PATH setup (idempotent, safe)
case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) PATH="$HOME/.local/bin:$HOME/bin:$PATH" ;;
esac
export PATH

# Systemd pager optional
# export SYSTEMD_PAGER=

# Source modular bashrc files
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        [ -f "$rc" ] && . "$rc"
    done
    unset rc
fi

# =============================================================================
# Custom Prompt
# =============================================================================

VIRTUAL_ENV_DISABLE_PROMPT=1

__set_ps1() {
    local periwinkle='\[\e[38;2;129;140;248m\]'
    local periwinkle_light='\[\e[38;2;165;180;252m\]'
    local gray='\[\e[38;2;85;85;85m\]'
    local path_color='\[\e[38;2;100;100;110m\]'
    local peach='\[\e[38;2;253;186;116m\]'
    local green='\[\e[38;2;134;239;172m\]'
    local reset='\[\e[0m\]'

    local identity="LOQ • Dev • Fedora"

    PS1="${periwinkle}\u"
    PS1="${PS1}${gray}@${periwinkle_light}${identity}"
    PS1="${PS1}${gray} • ${path_color}\w"

    local branch
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ] && [ "$branch" != "HEAD" ]; then
        PS1="${PS1}${gray} • ${peach}${branch}"
    fi

    if [ -n "$VIRTUAL_ENV" ]; then
        PS1="${PS1}${gray} • ${green}($(basename "$VIRTUAL_ENV"))"
    fi

    PS1="${PS1}${reset}\n${periwinkle}❯${reset} "
}

PROMPT_COMMAND=__set_ps1
