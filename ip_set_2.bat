@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )

echo **********************
echo 1. DHCP 
echo 2. Static IP
echo **********************
set /p choice=select 1 or 2 ^ ^


if %choice% equ 1 goto DHCP
if %choice% equ 2 goto Static 



:DHCP
netsh interface ip set address Ethernet source=DHCP
echo DHCP
echo **********************
ipconfig /all 
pause
exit


:Static 
echo Static IP	
echo **********************
set /p network=input a number x(range of 0 1 2  eg:172.16.x.**) ^ ^


set /p ip=input a number y(range of 10-254   eg:172.16.*.y) ^ ^


echo input success

netsh interface ip set address Ethernet source=static 172.16.%network%.%ip% 255.255.0.0 172.16.2.1 1
netsh interface ip set dns Ethernet source=static addr=114.114.114.114 
netsh interface ip add dns Ethernet addr=8.8.8.8
ipconfig /all
pause
exit

