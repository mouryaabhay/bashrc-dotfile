# =============================================================================
# .bashrc
# =============================================================================

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# =============================================================================
# PATH
# =============================================================================

case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) PATH="$HOME/.local/bin:$HOME/bin:$PATH" ;;
esac
export PATH

# =============================================================================
# Source modular bashrc files
# =============================================================================

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

__custom_ps1() {
    local periwinkle='\[\e[38;2;129;140;248m\]'
    local periwinkle_light='\[\e[38;2;165;180;252m\]'
    local gray='\[\e[38;2;85;85;85m\]'
    local path_color='\[\e[38;2;100;100;110m\]'
    local peach='\[\e[38;2;253;186;116m\]'
    local green='\[\e[38;2;134;239;172m\]'
    local reset='\[\e[0m\]'

    local identity="LOQ • Dev • Fedora"

    local prompt="${periwinkle}\u"
    prompt="${prompt}${gray}@${periwinkle_light}${identity}"
    prompt="${prompt}${gray} • ${path_color}\w"

    local branch
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    if [ -n "$branch" ] && [ "$branch" != "HEAD" ]; then
        prompt="${prompt}${gray} • ${peach}${branch}"
    fi

    if [ -n "$VIRTUAL_ENV" ]; then
        prompt="${prompt}${gray} • ${green}($(basename "$VIRTUAL_ENV"))"
    fi

    prompt="${prompt}${reset}\n${periwinkle}❯${reset} "

    printf '%s' "$prompt"
}

# Store our normal prompt separately.
__NORMAL_PS1="$(__custom_ps1)"

# Set normal prompt initially.
PS1="$__NORMAL_PS1"

# Only restore our prompt when PS1 has not been intentionally changed.
__prompt_update() {
    if [[ "$PS1" == "$__NORMAL_PS1" ]]; then
        return
    fi

    # If PS1 was deliberately changed, stop touching it.
    PROMPT_COMMAND=
}

PROMPT_COMMAND=__prompt_update

# =============================================================================
# NVM
# =============================================================================

export NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
fi

if [ -s "$NVM_DIR/bash_completion" ]; then
    . "$NVM_DIR/bash_completion"
fi

# =============================================================================
# Java
# =============================================================================

export JAVA_HOME=/usr/lib/jvm/java-25-openjdk
export PATH="$JAVA_HOME/bin:$PATH"
