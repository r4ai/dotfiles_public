# ---OS SETTINGS---
switch (get_os_name)
    case macos
        #* vscode
        set -x PATH "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $PATH

        #* homebrew
        eval (/opt/homebrew/bin/brew shellenv)

    case ubuntu arch
        #* homebrew
        if test -e /home/linuxbrew/.linuxbrew/bin/brew
            eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        end
end

# ---WSL SETTINGS---
if test (get_os_name -w) = true
    #* vcXsrv
    export DISPLAY=(cat /etc/resolv.conf | grep nameserver | sed 's/.* //g'):0
    if type -q tex
        set -gx MANPATH /usr/local/texlive/2022/texmf-dist/doc/man $MANPATH
        set -gx INFOPATH /usr/local/texlive/2022/texmf-dist/doc/info $INFOPATH
    end

    #* Explorer
    if test -e '/mnt/c/WINDOWS/explorer.exe'
        function open
            '/mnt/c/WINDOWS/explorer.exe' $argv
        end
    end
end


# ---UNIVERSAL SETTINGS---
#* valta(node.js version manager)
set -gx VOLTA_HOME "$HOME/.volta"
fish_add_path "$VOLTA_HOME/bin"

#* pyenv
if type -q pyenv
    set -x PYENV_ROOT $HOME/.pyenv
    pyenv init - | source
end
