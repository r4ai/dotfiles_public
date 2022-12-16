#! ---LOAD CONFIG FILES---
source ~/.config/fish/env.fish

#! ---PROMPT/THEME settings---
set -g fish_prompt_pwd_dir_length 0 # prompt_pwdを省略させない
if type -q starship
    starship init fish | source
end
if type -q z
    zoxide init fish | source
end


#! ---ALIAS SETTING---
#* YAY
if type -q yay
    abbr yay-update 'yay -Syu'
end

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

#* PYTHON
abbr py python3
alias att atcoder-tools
if type -q poetry
    alias penv 'source (poetry env info --path)/bin/activate.fish'
end

#* NODE
if type -q volta
    abbr nvm volta
end

#* GIT
if type -q git
    abbr g git
    abbr gs 'git status'
    abbr ga 'git add'
    abbr gaa 'git add .'
    abbr gcm 'git commit -m'
end

#* SILICON(CARBON)
if type -q silicon
    alias carbon silicon
    abbr carbon 'carbon -f HackGen'
    abbr silicon 'silicon -f HackGen'
end

#* SSH
abbr ssh-keygen 'ssh-keygen -t rsa -b 4096 -o -a 100'
abbr ssh-keygen-ed 'ssh-keygen -t ed25519'

#* UPDATE
if type -q topgrade
    alias update "topgrade --disable conda system"
end

#* ATCODER
if type -q oj
    alias atcoder-test "oj test -c 'python3 ./main.py' -d ./tests"
end
if type -q acc
    alias atcoder-submit "acc submit main.py"
end

if [ (get_os_name) = macos ]
    abbr sed gsed
end

#! ---ON_EXIT---
function on_exit --on-event fish_exit
    if type -q z
        z --clear
    end
end
