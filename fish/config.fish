#! ---LOAD CONFIG FILES---
source ~/.config/fish/env.fish

#! ---PROMPT/THEME settings---
set -g fish_prompt_pwd_dir_length 0 # prompt_pwdを省略させない
starship init fish | source
export BAT_THEME="TwoDark"
zoxide init fish | source


#! ---ALIAS SETTING---
#* EXA
if type -q exa
    alias l 'exa -F --icons'
    alias ll 'exa -laF --icons'
    alias lll 'exa -lF --icons'
    alias lt 'exa -laT --icons'
end

#* EDITOR
if type -q nvim
    alias vi nvim
    alias vim nvim
end
if type -q silicon
    alias carbon silicon
end

#* PYTHON
abbr py python3
alias att atcoder-tools
if type -q poetry
    alias penv 'source (poetry env info --path)/bin/activate.fish'
end

#* GIT
alias g git
abbr gs 'git status'
abbr ga 'git add'
abbr gaa 'git add .'
abbr gc 'git commit -m'

#* SSH
abbr ssh-keygen 'ssh-keygen -t rsa -b 4096 -o -a 100'
abbr ssh-keygen-ed 'ssh-keygen -t ed25519'

#* UPDATE
if type -q topgrade
    alias update "topgrade --disable conda system"
end

#* Clipboard
switch uname
    case Darwin
        #* MAC
        alias pwdc 'pwd | tr -d "\n" | pbcopy'
        alias copy pbcopy
    case Linux
        if test (uname -r) = '.*microsoft.*'
            #* WSL
            alias pwdc 'pwd | tr -d "\n" | /mnt/c/WINDOWS/system32/clip.exe'
            alias copy '/mnt/c/WINDOWS/system32/clip.exe'
        end
end

#! ---ON_EXIT---
function on_exit --on-event fish_exit
    if type -q z
        z --clear
    end
end
