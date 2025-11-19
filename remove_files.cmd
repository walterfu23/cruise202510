@echo off
REM ============================================
REM Delete files/folders listed in .gitignore
REM ============================================

setlocal enabledelayedexpansion

REM Read each line of .gitignore
for /f "usebackq tokens=* delims=" %%i in (".gitignore") do (
    set "pattern=%%i"

    REM Skip empty lines and comments
    if not "!pattern!"=="" if "!pattern:~0,1!" NEQ "#" (
        echo Removing pattern: !pattern!

        REM Delete matching files
        del /s /q "!pattern!" 2>nul

        REM Delete matching directories
        rmdir /s /q "!pattern!" 2>nul
    )
)

echo Done cleaning ignored files.
endlocal
pause
