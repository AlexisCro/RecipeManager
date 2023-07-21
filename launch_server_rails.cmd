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
set "server=C:\Users\alexi\OneDrive\Documents\Projets\RecipeManager\tmp\pids\server.pid"

rem Je définis une variable pour ma boucle de vérification du lancement du serveur
set running=0

rem J'appelle ma méthode qui me permet de trouver et/ou lancer mon serveur
call :findServer "%server%" "%project%"
goto :EOF

:findServer
if exist %1 (
	del %1
  start "" cmd.exe /k "echo launch server of RecipeManager && cd /d %2 && rails s"
) else (
  start "" cmd.exe /k "echo launch server of RecipeManager && cd /d %2 && rails s"
)
call :serverRunning "%server%"
call :launchApp
goto :EOF

:launchApp
start "" cmd.exe /k "echo launch application && call C:\Users\alexi\OneDrive\Documents\Projets\devops\script\open_app.cmd && exit"
goto :EOF

:serverRunning
:loop
if exist %1 (
  set /A running+=1
)
if %running%==0 (
  goto loop
)
goto :EOF
