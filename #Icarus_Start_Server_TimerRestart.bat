@echo off
:start

	:: DELTA Server Script for Icarus
	:: PLEASE CHANGE ALL NEEDED VALUES TO YOURS
	:: Window Title
	set title=Icarus
	
	:: Steam Login Info
	set SteamLogin=anonymous
	
	:: Steam Gamne ID
	set GameBranch=2089300
	
	:: SteamCMD Location
	set SteamCMDPath="D:\Game_Server\SteamCMD"

	:: Server Location
	set serverLocation="D:\Game_Server\Server_Icarus"

	:: Server.exe
	set exe=IcarusServer.exe
	
	:: Server Port
	set Port=17777
	
	:: Query Port
	set QueryPort=27015
	
	:: Server Name (show in Server Browser)
	set ServerName="The Hideout Community Server"
	
	:: Coutdown in seconds for Server Taskkill (3600 = 1 hour)
	set Countdown=10800
	
	:: Config Location (not tested)
	:: set UserDir="C:\Users\USER\Documents\Icarus\config"
	:: ___________________________________________________


:: BELOW THIS LINE YOU HAVE NOTHING TO CHANGE ! ! !
:: ________________________________________________
:: Set title for terminal
title %title% Server

echo.
:: start Server Update Check
echo Checking for %title% update
echo.
%SteamCMDPath%\steamcmd.exe +force_install_dir %serverLocation% +login %SteamLogin% +"app_update %GameBranch%" +quit
echo.
echo Your %title% is up to date !

echo.
:: the batch call the server start
echo Starting %title% Server
echo.
:: the batch call the time where the server started
echo (%time%) %title% Server started.
echo.
:: say the batch where they have to execute
cd %serverLocation%
:: launch parameter
start %exe% -log

echo time to close the Server
:: Server Kill Countdown
timeout %Countdown%
taskkill /im IcarusServer-Win64-Shipping.exe /F
echo.

:: the batch call the Restart time
echo (%time%) %title% Server closed.
echo.
echo %title% Server Restart in.
:: Time in seconds to wait before go to start
timeout 60

:: Go back to the top and repeat the whole cycle again
goto start