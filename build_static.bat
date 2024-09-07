@ECHO OFF

SET PATH=%PATH%;%SystemRoot%\system32
@if exist "%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin" set PATH=%PATH%;%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin

SET HomePath=%~dp0

CD DuiLib
rem 初始化VS2015编译环境
rem @CALL "%VS2015_HOME%\Common7\Tools\VsMSBuildCmd.bat"

@echo 编译32位文件
MSBuild.exe DuiLib_static.vcxproj /t:Rebuild /p:configuration=Debug /p:platform=Win32
if %ERRORLEVEL% NEQ 0 (cd /d %HomePath% & EXIT /B 1)

MSBuild.exe DuiLib_static.vcxproj /t:Rebuild /p:configuration=Release /p:platform=Win32
if %ERRORLEVEL% NEQ 0 (cd /d %HomePath% & EXIT /B 1)

MSBuild.exe DuiLib_static.vcxproj /t:Rebuild /p:configuration=UnicodeDebug /p:platform=Win32
if %ERRORLEVEL% NEQ 0 (cd /d %HomePath% & EXIT /B 1)

MSBuild.exe DuiLib_static.vcxproj /t:Rebuild /p:configuration=UnicodeRelease /p:platform=Win32
if %ERRORLEVEL% NEQ 0 (cd /d %HomePath% & EXIT /B 1)

@echo 编译64位文件
MSBuild.exe DuiLib_static.vcxproj /t:Rebuild /p:configuration=Debug /p:platform=x64
if %ERRORLEVEL% NEQ 0 (cd /d %HomePath% & EXIT /B 1)

MSBuild.exe DuiLib_static.vcxproj /t:Rebuild /p:configuration=Release /p:platform=x64
if %ERRORLEVEL% NEQ 0 (cd /d %HomePath% & EXIT /B 1)

MSBuild.exe DuiLib_static.vcxproj /t:Rebuild /p:configuration=UnicodeDebug /p:platform=x64
if %ERRORLEVEL% NEQ 0 (cd /d %HomePath% & EXIT /B 1)

MSBuild.exe DuiLib_static.vcxproj /t:Rebuild /p:configuration=UnicodeRelease /p:platform=x64
if %ERRORLEVEL% NEQ 0 (cd /d %HomePath% & EXIT /B 1)

CD /d %HomePath%