# Directions for setup on Windows

## Dependencies
* Powershell 7 - From the Microsoft Store
* Windows Terminal (preview) - From Microsoft Store
* Chocolately - https://chocolatey.org/install
* Nerd Fonts - Hasklug & Caskaydia https://community.chocolatey.org/packages
* Neovim 0.9+ (nightly) - winget, Chocolately, or download from Neovim site
* LazyVim - https://github.com/LazyVim/LazyVim


## Windows Terminal Setup
* Create a new profile named `Neovim`, copying the settings from Powershell
* Change icon to `./neovim.png`
* Change font to Hasklug and Font Size to 8
* Text AntiAliasing to ClearType


## Windows Explorer Setup
* Run `./nvimshell.reg` to add a Neovim entry into the right-click menu (`./nvimshell - remove.reg` to uninstall)


## Configuration
#### Remove old nvim config
```shell
Remove-Item $env:LOCALAPPDATA\nvim
Remove-Item $env:LOCALAPPDATA\nvim-data
```

#### Pull config from Github
```shell
git clone https://github.com/patrickmoore/nvim-config.git $env:LOCALAPPDATA\nvim
```
