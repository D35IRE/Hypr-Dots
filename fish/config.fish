set fish_greeting

if status is-interactive
    echo " /\_/\  Welcome DESIRE.."
    echo "( o.o ) "
    echo " > ^ <  "
end

# --- Prompt (Starship) ---
if type -q starship
    starship init fish | source
end

# --- Aliases ---
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias cat='bat --style=plain --paging=never' 2>/dev/null

# --- Environment ---
set -gx EDITOR nvim
set -gx PAGER less
set -gx LANG en_US.UTF-8

# --- Autosuggestions & Syntax Highlighting ---
# Built-in, just enable autosuggestions
set -g fish_autosuggestion_enabled 1

# --- History search with fzf (Ctrl+R) ---
if type -q fzf
    function fish_user_key_bindings
        bind \cr fzf_history
    end
end

# --- ASCII Art Banner ---
# if test -f ~/.config/fish/ascii.fish
#     source ~/.config/fish/ascii.fish
# end

# --- Useful Functions ---
# mkcd → make a dir and cd into it
function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

# extract → auto-detect archive type
function extract
    if test -f $argv[1]
        switch $argv[1]
            case '*.tar.bz2'
                tar xjf $argv[1]
            case '*.tar.gz'
                tar xzf $argv[1]
            case '*.tar.xz'
                tar xJf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.rar'
                unrar x $argv[1]
            case '*'
                echo "don't know how to extract '$argv[1]'"
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end
