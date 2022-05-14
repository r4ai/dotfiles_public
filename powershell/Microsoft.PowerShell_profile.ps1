Set-PSReadLineKeyHandler -Key Tab -Function Complete
#! ---PROMPT---
Invoke-Expression (&starship init powershell)

#! ---IMPORT MODULES---
Import-Module ZLocation
Import-Module PSFzf
Enable-PsFzfAliases

#! ---ORIGINAL FUNCTIONS---
function ll() {
    lsd -lA
}
function l() {
    lsd -A
}
function lt() {
    lsd -A --tree
}
function cat() {
    bat
}
function touch($file) {
    If (Test-Path $file) {
      (Get-Item $file).LastWriteTime = Get-Date
    }
    Else {
        Out-File -encoding Default $file
    }
}
function open($path) {
    explorer.exe $path
}
function reload() {
    . $profile
}
