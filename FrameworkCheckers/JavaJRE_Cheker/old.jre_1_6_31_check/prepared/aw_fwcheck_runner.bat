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
java -jar jre_1_6_31_checker.jar %*

rem echo "Finished"
java -version

rem 	Switch back to the original working directory
cd /d %ORIGINAL_WORKING_DIR%