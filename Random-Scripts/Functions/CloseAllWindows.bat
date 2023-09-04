@echo off
setlocal enabledelayedexpansion

REM Close all windows except the command prompt itself
for /f "tokens=2" %%a in ('tasklist ^| findstr /v "cmd.exe"') do (
    set /a "count+=1"
    set "color[!count!]=!count!"
    taskkill /F /PID %%a
)

REM Restart Explorer
start explorer.exe

REM Display PIDs in multicolor text
for /l %%i in (1,1,%count%) do (
    call :setColors %%i
    echo PID: !color[%%i]!%%i
)

pause
exit /b

:setColors
set color[1]=^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<^<
set color[2]=^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>^>
set color[3]=^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^^^ ^
set color[4]=!color[1]!!color[2]!!color[3]!
exit /b
