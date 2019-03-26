@echo off 
set /p ip=input IP ^ ^



echo input success

pause

netsh interface ip set address Ethernet source=static 172.16.1.%ip% 255.255.0.0 172.16.1.1 1
netsh interface ip set dns Ethernet source=static addr=114.114.114.114 
netsh interface ip add dns Ethernet addr=8.8.8.8
ipconfig /all
pause
