# Directions for setup on Windows

## Dependencies
* Git - `winget install Git.Git`
* Powershell 7 - `winget install Microsoft.Powershell`
* Windows Terminal (preview) - From Microsoft Store
* Chocolately (optional) - https://chocolatey.org/install
* Nerd Fonts - Hasklug & Caskaydia https://community.chocolatey.org/packages
* Neovim 0.9+ (nightly) - winget, Chocolately, or download from Neovim site
* LazyVim - https://github.com/LazyVim/LazyVim

## Configuration
#### Remove old nvim config (Powershell)
```shell
Remove-Item $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim-data
```

#### Pull config from Github
```shell
git clone https://github.com/patrickmoore/nvim-config.git $env:LOCALAPPDATA\nvim
```

## Windows Terminal Setup
* Create a new profile named `Neovim`, copying the settings from Powershell
* Change icon to `%LOCALAPPDATA%/nvim/install/neovim.png`
* Change font to Hasklug and Font Size to 8
* Text AntiAliasing to ClearType


## Create shortcut and Windows Explorer menu items
* Run `%LOCALAPPDATA%/nvim/install/setup.ps1` in an Administrator Powershell


## Cleanup
* To remove the shortcut and Windows Explorer menu items, run `%LOCALAPPDATA%/nvim/install/uninstall.ps1`