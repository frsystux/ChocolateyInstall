# ChocolateyInstall

Powershell script to install apps on windows with Chocolatey.

***

## HOW TO USE

* Copy the script file or clone the git repository

* Launch a powershell prompt as adminstrator 

* Run the script :

```
.\ChocoInstall.ps1
```

Bypasse the powershell security : 

```
powershell.exe -ExecutionPolicy Bypass -File .\ChocoInstall.ps1

```


***

### SCRIPT OPTIONS

-setproxy : Set a proxy if you use one
-noinstall : Bypass the chocolatey install phase if already installed
-gamesinstall : Install game launchers such as Steam or GOG and Discord. 
-networktoolsinstall : Install nmap and wireshark
-linuxinstall : Install Wsl2 + wsl-ubtunu + Docker-Desktop

