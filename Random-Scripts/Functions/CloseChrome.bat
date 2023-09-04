@echo off
color 05
tasklist /fi "imagename eq chrome.exe" /fo table /nh > temp.txt
for /f "skip=3 tokens=1,2 delims= " %%A in (temp.txt) do (
    echo %%A
    taskkill /f /pid %%B
)
del temp.txt

echo.
echo All Chrome browsers have been closed.
pause
