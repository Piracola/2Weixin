@echo off
:: ���ÿ���̨����ҳΪ��������GBK
chcp 936 > nul
setlocal enabledelayedexpansion
echo ���ڲ���΢�Ű�װ·��...
:: ������ܵ�΢�Ű�װ·��
set "FOUND_WECHAT="
set "SCRIPT_FILE=%~f0"
set "TEMP_FILE=%TEMP%\temp_wechat_script.bat"
:: ����Ƿ�ʹ���Ը��²���
if "%~1"=="/update" (
echo ���ڸ��½ű�...
call :UPDATE_SCRIPT
goto :END
)
:: ��鳣����װλ��
if exist "%ProgramFiles(x86)%\Tencent\WeChat\WeChat.exe" (
set "FOUND_WECHAT=%ProgramFiles(x86)%\Tencent\WeChat\WeChat.exe"
) else if exist "%ProgramFiles%\Tencent\WeChat\WeChat.exe" (
set "FOUND_WECHAT=%ProgramFiles%\Tencent\WeChat\WeChat.exe"
) else if exist "%LOCALAPPDATA%\Programs\Tencent\WeChat\WeChat.exe" (
set "FOUND_WECHAT=%LOCALAPPDATA%\Programs\Tencent\WeChat\WeChat.exe"
) else if exist "D:\Tools\Weixin\Weixin.exe" (
set "FOUND_WECHAT=D:\Tools\Weixin\Weixin.exe"
)
:: ���δ�ҵ������Դ�ע����ѯ
if "D:\Tools\Weixin\Weixin.exe"=="" (
echo ���Դ�ע����ѯ΢��·��...
for /f "tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Tencent\WeChat" /v InstallPath 2^>nul') do (
set "REG_PATH=%%b\WeChat.exe"
if exist "" (
set "FOUND_WECHAT="
)
)
)
:: ����Ƿ��ҵ�΢��
if "D:\Tools\Weixin\Weixin.exe"=="" (
echo ����δ�ҵ�΢�Ű�װ·��
goto :END
) else (
echo �ҵ�΢��: D:\Tools\Weixin\Weixin.exe
)
:: ����΢��ʵ��
echo ��������΢��...
start "" "D:\Tools\Weixin\Weixin.exe"
start "" "D:\Tools\Weixin\Weixin.exe"
:: ѯ���Ƿ���½ű�
echo.
echo �Ƿ�Ҫ���½ű��е�΢��·��? (Y/N)
set /p UPDATE_CHOICE=
if /i "y"=="Y" (
call :UPDATE_SCRIPT
)
goto :END
:UPDATE_SCRIPT
(
for /f "tokens=*" %%a in ('type "I:\JBCode\BAT\Open2Weixin.bat"') do (
set "line=%%a"
if "set "line=%%a"" neq "set "line=%%a"" (
SET WECHAT_PATH="D:\Tools\Weixin\Weixin.exe"
) else (
echo ) else (
)
)
) > "C:\Users\17719\AppData\Local\Temp\temp_wechat_script.bat"
move /y "C:\Users\17719\AppData\Local\Temp\temp_wechat_script.bat" "I:\JBCode\BAT\Open2Weixin.bat" > nul
echo �ű��Ѹ���
goto :eof
:END
echo �ű�ִ�����
endlocal
