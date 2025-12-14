set -U fish_greeting

set -x LESS "-R"

if command -v nvim &> /dev/null
    set -x EDITOR "nvim"
end

if command -v ghostty &> /dev/null
    set -x TERMINAL "ghostty"
end

set -x QT_QPA_PLATFORMTHEME "gtk3"

if test -e "$HOME/.local/scripts"
    fish_add_path "$HOME/.local/scripts"
    bind ctrl-f find-session
    bind ctrl-s search-session
end

bind ctrl-space accept-autosuggestion

alias clear "clear -x"
alias sail "sh $([ -f sail ] && echo sail || echo vendor/bin/sail)"
alias git-nuke "git reset --hard HEAD && git clean -fd"
alias git-auto-commit "git add -A && git commit -m"
alias git-log-pretty "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"

if command -v zoxide &> /dev/null
    zoxide init fish | source
end

if command -v starship &> /dev/null
    set -x STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
    starship init fish | source
end

if command -v fzf &> /dev/null
    set -x FZF_DEFAULT_OPTS '
      --color=fg:#d0d0d0,fg+:#d0d0d0
      --color=hl:#6db760,hl+:#ff9c5e,info:#afaf87,marker:#6db760
      --color=prompt:#cd9bff,spinner:#ff48ad,pointer:#cd9bff,header:#87afaf
      --color=border:#262626,label:#aeaeae,query:#d9d9d9
      --prompt="> " --marker=">" --pointer="◆" --separator="─" --scrollbar="│"'
    fzf --fish | source
end

if command -v niri &> /dev/null && command -v auto-niri &> /dev/null
    auto-niri
end
