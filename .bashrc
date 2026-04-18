# =============================================================================
# Custom Bash Prompt — works on Linux & Git Bash
# Colors: Periwinkle username/host · Gray separators · Peach git branch · Green venv
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

    PS1="${periwinkle}\u"
    PS1="$PS1${gray}@"
    PS1="$PS1${periwinkle_light}LOQ · Dev · Win11"
    PS1="$PS1${gray} · "
    PS1="$PS1${path_color}\w"

    # git branch
    if command -v git &>/dev/null; then
        local branch
        branch=$(git symbolic-ref --short HEAD 2>/dev/null)
        if [ -n "$branch" ]; then
            PS1="$PS1${gray} · ${peach}${branch}"
        fi
    fi

    # python venv
    if [ -n "$VIRTUAL_ENV" ]; then
        local venv_name
        venv_name=$(basename "$VIRTUAL_ENV")
        PS1="$PS1${gray} · ${green}(${venv_name})"
    fi

    PS1="$PS1${reset}\n${periwinkle}❯${reset} "
}
PROMPT_COMMAND=__set_ps1
