@echo off
title B&R Wlan configure Tool
color 2F
set a=28
set b=1
:re
set /a a+=2
set /a b+=2
mode con:cols=%a% lines=%b%
if %a% lss 46 goto re
:start
cls
echo,
echo, Easy Buckup and Restore Wlan configure Tool
echo,
echo,
echo,
echo, (B) for backup your wlan configure
echo,
echo, (R) for restore your wlan configure
echo,
echo, (E) to exitl
echo,
echo,
echo,
echo,                        Created by KingShui.
echo,
echo,
if not exist Wlan_Configure_Backup md Wlan_Configure_Backup
set /p key=Press a key then enter:
if "%key%" equ "b" goto backup
if "%key%" equ "r" goto restore
if "%key%" equ "e" exit
goto start
	

:backup
cls
netsh wlan export profile folder=.\Wlan_Configure_Backup key=clear>nul
echo,
echo, Easy Buckup and Restore Wlan configure Tool
echo,
echo, Successful Backup.
echo,
echo, Press any key to return to the menu
pause>nul&goto start

:restore
cls
for %%i in (.\Wlan_Configure_Backup\*.xml) do netsh wlan add profile filename=%%i>nul
echo,
echo, Easy Buckup and Restore Wlan Settings Tool
echo,
echo, Successful Restore.
echo,
echo, Press any key to return to the menu
pause>nul&goto start