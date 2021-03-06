@echo off

rem 	Store the original working dir
SET ORIGINAL_WORKING_DIR=%CD%
rem 	And the bat-dir -> which is the current working directory
SET BAT_DIR=%~dp0

rem 	Switch the working directory to the this bat file's path
cd /d %BAT_DIR%

rem 	Run and wait for termination (/WAIT)
rem		Also pass-by the given args (with %*)
rem START /min /wait java -jar JavaJREChecker.jar
START /min /wait AwAirFwChecker.exe %*

rem echo "Finished"

rem 	Switch back to the original working directory
cd /d %ORIGINAL_WORKING_DIR%