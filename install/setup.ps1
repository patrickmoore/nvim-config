#Requires -RunAsAdministrator

param(
    [switch]$Cleanup
)

# Shortcut to open nvim in a Windows Terminal with the Neovim profile
function CreateShortcut {
    $shell = New-Object -ComObject ("WScript.Shell")
    $shortcut = $shell.CreateShortcut($env:APPDATA + '\Microsoft\Windows\Start Menu\Programs\' + '\nvim.lnk')
    $shortcut.TargetPath = 'wt' 
    $shortcut.Arguments = '-p "Neovim" C:\Program Files\Neovim\bin\nvim.exe'
    $shortcut.IconLocation = 'C:\Program Files\Neovim\bin\nvim-qt.exe,0'
    $shortcut.Save()
}

function DeleteShortcut {
    Remove-Item -Path "$($env:APPDATA)\Microsoft\Windows\Start Menu\Programs\nvim.lnk" -Force
}

# Add 'Neovim Here' and 'Open with Neovim' to Windows Explorer
function CreateExplorerCommands {
    # Shell
    New-Item -Path 'Registry::HKCR\`*\shell' -Name 'nvim' -Force
    Set-ItemProperty -Path 'Registry::HKCR\`*\shell\nvim' -Name '(Default)' -Value 'Edit with Neovim' -Force
    Set-ItemProperty -Path 'Registry::HKCR\`*\shell\nvim' -Name 'Icon' -Value '"C:\Program Files\Neovim\bin\nvim-qt.exe"' -Force

    New-Item -Path 'Registry::HKCR\`*\shell\nvim' -Name 'command' -Force
    Set-ItemProperty -Path 'Registry::HKCR\`*\shell\nvim\command' -Name '(Default)' -Value 'wt -p "Neovim" C:\Program Files\Neovim\bin\nvim.exe "%1"' -Force

    # Directory Shell
    New-Item -Path 'Registry::HKCR\directory\shell' -Name 'nvim' -Force
    Set-ItemProperty -Path 'Registry::HKCR\directory\shell\nvim' -Name '(Default)' -Value 'Neovim Here' -Force
    Set-ItemProperty -Path 'Registry::HKCR\directory\shell\nvim' -Name 'Icon' -Value '"C:\Program Files\Neovim\bin\nvim-qt.exe"' -Force

    New-Item -Path 'Registry::HKCR\directory\shell\nvim' -Name 'command' -Force
    Set-ItemProperty -Path 'Registry::HKCR\directory\shell\nvim\command' -Name '(Default)' -Value 'wt -p "Neovim" C:\Program Files\Neovim\bin\nvim.exe "%v"' -Force

    # Directory Background
    New-Item -Path 'Registry::HKCR\directory\background\shell' -Name 'nvim' -Force
    Set-ItemProperty -Path 'Registry::HKCR\directory\background\shell\nvim' -Name '(Default)' -Value '&Neovim Here' -Force
    Set-ItemProperty -Path 'Registry::HKCR\directory\background\shell\nvim' -Name 'Icon' -Value '"C:\Program Files\Neovim\bin\nvim-qt.exe"' -Force

    New-Item -Path 'Registry::HKCR\directory\background\shell\nvim' -Name 'command' -Force
    Set-ItemProperty -Path 'Registry::HKCR\directory\background\shell\nvim\command' -Name '(Default)' -Value 'wt -p "Neovim" C:\Program Files\Neovim\bin\nvim.exe "%v"' -Force
}

function DeleteExplorerCommands {
    Remove-Item -Path 'Registry::HKCR\`*\shell\nvim' -Recurse -Force
    Remove-Item -Path 'Registry::HKCR\directory\shell\nvim' -Recurse -Force
    Remove-Item -Path 'Registry::HKCR\directory\background\shell\nvim' -Recurse -Force
}

if ($Cleanup) {
    DeleteShortcut > $null
    DeleteExplorerCommands > $null
}
else {
    CreateShortcut > $null
    CreateExplorerCommands > $null
}