@echo off

for %%a in ("%~dp0\.") do set "parent=%%~nxa"

set AppCmdLine="notepad.exe"
set ProcessCmd=wmic process call create %AppCmdLine%
for /f "tokens=3 delims=; " %%a in ('%ProcessCmd% ^| find "ProcessId"') do set PID=%%a

frida --enable-jit -p %PID% -l %~dp0\%parent%.compiled.js
