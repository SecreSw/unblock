@echo off

set url="https://www.instagram.com/_alvi.an/"

:ARCHITECTURE_VALIDATION (
	if "%PROCESSOR_ARCHITECTURE%" EQU "amd64" ( >nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
	) else ( >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" )
)

:ADMINISTRATOR_VALIDATION (
	if '%ErrorLevel%' NEQ '0' ( echo.
		echo bebasid sedang meminta hak akses administrator 5 .
		timeout 1 >nul && echo. && echo bebasid sedang meminta hak akses administrator 4 . .
		timeout 1 >nul && echo. && echo bebasid sedang meminta hak akses administrator 3 . . .
		timeout 1 >nul && echo. && echo bebasid sedang meminta hak akses administrator 2 . . . .
		timeout 1 >nul && echo. && echo bebasid sedang meminta hak akses administrator 1 . . . . .
			GOTO :UAC_PROMPT
	) else ( GOTO :GOT_ADMIN )
)

:UAC_PROMPT (
	set params= %*

	echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

	"%temp%\getadmin.vbs" && del "%temp%\getadmin.vbs"
 
	exit /b
) 

:GOT_ADMIN (
	pushd "%CD%" && CD /D "%~dp0" && GOTO :pasang
)

:pasang (
set hostspath=%windir%\System32\drivers\etc\hosts
   	 ECHO 103.10.124.162   cm1-sgp1.cm.steampowered.com>> %hostspath%
   	 ECHO 23.53.122.84     store.akamai.steamstatic.com>> %hostspath%
   	 ECHO 23.53.122.83     cdn.akamai.steamstatic.com>> %hostspath%
   	 ECHO 104.18.37.23     cdn.cloudflare.steamstatic.com store.cloudflare.steamstatic.com>> %hostspath%
   	 ECHO 104.101.153.239  steamcommunity.com api.steampowered.com help.steampowered.com>> %hostspath%
   	 ECHO 23.3.84.108      store.steampowered.com>> %hostspath%
   	 ECHO 104.101.152.167  steamgames.com steampowered.com>> %hostspath%
   	 ECHO 211.152.128.14   down.gameloop.com>> %hostspath%
   	 ECHO 23.216.55.46     community.akamai.steamstatic.com>> %hostspath%
   	 ECHO 23.216.55.62     community.akamai.steamstatic.com>> %hostspath%
   	 ECHO 96.7.129.14      store.akamai.steamstatic.com>> %hostspath%
   	 ECHO 96.7.129.23      store.akamai.steamstatic.com>> %hostspath%
   	 ECHO 96.7.129.39      cdn.akamai.steamstatic.com>> %hostspath%
   	 ECHO 96.7.129.35      cdn.akamai.steamstatic.com>> %hostspath%
   	 ECHO 103.10.124.162   cm1-sgp1.cm.steampowered.com>> %hostspath%
   	 ECHO 103.10.124.163   cm2-sgp1.cm.steampowered.com>> %hostspath%
   	 ECHO 103.10.124.165   cm4-sgp1.cm.steampowered.com>> %hostspath%
   	 ECHO 103.10.124.121   cm6-sgp1.cm.steampowered.com>> %hostspath%
   	 ECHO 104.101.152.167  steam-chat.com>> %hostspath%
   	 ECHO 104.18.37.23     cdn.cloudflare.steamstatic.com store.cloudflare.steamstatic.com community.cloudflare.steamstatic.com>> %hostspath%
   	 ECHO 172.64.150.233   cdn.cloudflare.steamstatic.com store.cloudflare.steamstatic.com community.cloudflare.steamstatic.com>> %hostspath%
   	 ECHO 96.7.129.36      avatars.akamai.steamstatic.com>> %hostspath%
   	 ECHO 96.7.129.15      avatars.akamai.steamstatic.com>> %hostspath%

	call :FLUSH
	cls
	call :credit
	echo  berhasil terpasang
	echo.
	echo Tekan tombol apa saja untuk keluar
	pause >nul
	start chrome %url%
	exit
)

:flush(
	ipconfig /flushdns > nul
	ipconfig /release > nul
	ipconfig /renew > nul
	exit /b 0
)
:credit(
	echo.
	echo "Discord	: Alvian#1434"
	echo "IG		: _alvi.an"
	echo.
	echo ==   Hidup Kebebasan  ==
	echo.
	exit /b 0
)

