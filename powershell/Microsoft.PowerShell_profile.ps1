Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
#! ---PROMPT---
Invoke-Expression (&starship init powershell)

#! ---IMPORT MODULES---
Import-Module C:\Users\e4zy9\scoop\modules\Terminal-Icons\Terminal-Icons.psm1
Import-Module posh-git
Import-Module "$($(Get-Item $(Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"
Invoke-Expression -Command $(gh completion -s powershell | Out-String)
Invoke-Expression -Command $(volta completions powershell | Out-String)

#! ---ALIAS---
Set-Alias -Name 'which' -Value 'Get-Command'
Set-Alias -Name 'll' -Value 'ls'

#! ---ORIGINAL FUNCTIONS---
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

function gs() {
  git status
}
