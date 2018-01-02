::TESTING TO USE CONCEPT IN ALPHA
@echo off
cls
echo 1)Start new
echo 2)Load
echo.
set /p input=:

if %input% == 1 goto variables
if %input% == 2 goto load
goto menu

:variables
set num1=10
set num2=20
set num3=30

:start
cls
echo Number 1:%num1%
echo Number 2:%num2%
echo Number 3:%num3%
echo.
pause >nul
goto save

:save
(
echo %num1%
echo %num2%
echo %num3%
) > save.sav
goto start

:load
< save.sav (
set /p num1=
set /p num2=
set /p num3=
)
goto start