@echo off
rem Documentation du script : 
rem Je crée un script dynamique pour le moment pour lancer localement le serveur de l'application choisie
rem pour cela je test également si un PID de server est déjà en cours via la méthode :findServer
rem si oui alors je le supprime dans un premier temps 
rem si non je lance directement le serveur et ensuite je lance le navigateur web à l'adresse de l'application
rem via la méthode :launchServer

rem Définition des variables

rem Je définis le chemin de l'application
set "project=C:\Users\alexi\OneDrive\Documents\Projets\RecipeManager"

rem Je définis une variable pour vérifier la présence ou non d'un PID pour un server qui n'aurait pas été stoppé
set "server=C:\Users\alexi\OneDrive\Documents\Projets\%app%\tmp\pids\server.pid"

rem J'appelle ma méthode qui me permet de trouver et/ou lancer mon serveur
call :findServer "%server%" "%app%" "%project%"
goto :EOF

:findServer
if exist %1 (
	del %1
  start "" cmd.exe /k "echo launch server of %2 && cd /d %3 && rails s"
  timeout /t 25 > null
  call :launchApp
  curl "http://127.0.0.1:3000/"
) else (
  start "" cmd.exe /k "echo launch server of %2 && cd /d %3 && rails s"
	timeout /t 25 > null
  call :launchApp
  curl "http://127.0.0.1:3000/"
)
goto :EOF

:launchApp
start "" cmd.exe /k "echo launch application && call C:\Users\alexi\OneDrive\Documents\Projets\devops\script\open_app.cmd && exit"
goto :EOF
