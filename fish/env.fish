# ---OS SETTINGS---
switch (uname)
    case Darwin
        #* vscode
        set -x PATH "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $PATH
        #* homebrew
        eval (/opt/homebrew/bin/brew shellenv)

    case Linux
        #* homebrew
        eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end


# ---WSL SETTINGS---
if [ (string match -r -- "\d*-microsoft-standard-WSL2" (uname -r)) ]
    #* vcXsrv
    export DISPLAY=(cat /etc/resolv.conf | grep nameserver | sed 's/.* //g'):0
    if type -q tex
        set -gx MANPATH /usr/local/texlive/2022/texmf-dist/doc/man $MANPATH
        set -gx INFOPATH /usr/local/texlive/2022/texmf-dist/doc/info $INFOPATH
    end
end


# ---UNIVERSAL SETTINGS---
#* valta(node.js version manager)
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

#* pyenv
if type -q pyenv
    set -x PYENV_ROOT $HOME/.pyenv
    pyenv init - | source
end
