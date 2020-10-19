param(
[switch]$setproxy,
[switch]$noinstall,
[switch]$gamesinstall,
[switch]$networktoolsinstall,
[switch]$linuxinstall,
[string]$texteditor="notepadplusplus vscodium pycharm-community",
[string]$browser="firefox vivaldi",
[string]$utility="putty microsoft-windows-terminal git gitextensions winscp mremoteng keepass sumatrapdf vlc postman",
[string]$networktools="nmap wireshark",
[string]$linux="wsl2 wsl-debiangnulinux wsl-ubuntu-2004 docker-desktop",
[string]$games="steam goggalaxy epicgameslauncher uplay origin discord"
)

#Chocolatey installation function
function InstallChocolatey{
    try {
        $command="iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
        Invoke-Expression -Command:$command
        Write-Host "[OK] Chocolatey install Done" -ForegroundColor Green
    }
    catch {
        Write-Host "[KO] : $_" -Foregroundcolor Red
    }
}

#App installation function with chocolatey. Licence accepted when installed. 
function InstallChocoApps{
param([string]$apps)
 try {
        $command="choco install $apps -y"
        Invoke-Expression -Command:$command
        Write-Host "[OK]" -ForegroundColor Green
    }

    catch {
        Write-Host "[KO] : $_" -Foregroundcolor Red
    }

} 

#Bloc for checking if we want to have a proxy set
if ( $setproxy ){
    $proxy = Read-Host -Prompt " Proxy usage selected. Please enter proxy URL: "
    try {
        [system.net.webrequest]::defaultwebproxy = new-object system.net.webproxy("${proxy}")
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'
        Write-Host "[OK] - Proxy was set without error" -ForegroundColor Green
        }
    catch{
        Write-Host "[KO] - Proxy config error" -ForegroundColor Red
       }
}


#Call to InstallChocolatey if $noinstall not set
if ( $noinstall ){
    Write-Host "Chocolatey install bypass"
    }
else{
    Write-Host "---Chocolatey installation ---" -ForegroundColor Green
  InstallChocolatey
}



#Install Text editors
Write-Host "--Install text editors --" -ForegroundColor Green
InstallChocoApps $texteditor
Start-Sleep -s 5


#Browser install
Write-Host "--Install browsers--" -ForegroundColor Green
InstallChocoApps $browser
Start-Sleep -s 5



#Utilities
Write-Host "--Install  utilities--" -ForegroundColor Green
InstallChocoApps $utility
Start-Sleep -s 5

if ( $gamesinstall) {
#Installation Games
Write-Host "--Install Games and Discord--" -ForegroundColor Green
InstallChocoApps $games
Start-Sleep -s 5
}


if ( $networktoolsinstall) {
#NEt tools
Write-Host "--Install  net tools--" -ForegroundColor Green
InstallChocoApps $networktools
Start-Sleep -s 5
}


if ( $linuxinstall) {
#Installation WSL + Docker
Write-Host "--Install WSL + Docker-" -ForegroundColor Green
InstallChocoApps $linux
Start-Sleep -s 5
}





