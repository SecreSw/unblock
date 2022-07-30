@echo off && color 0b

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
	pushd "%CD%" && CD /D "%~dp0" && GOTO :INITIALIZE
)

:INITIALIZE (
	cd /d %SystemRoot%\System32\Drivers\etc\
 
	echo.
	echo "Discord	: Alvian#1434"
	echo "IG		: _alvi.an"
	echo.
	echo ==   Hidup Kebebasan  ==
	echo.
	

)

:CEK (
	set server=www.google.com
	echo. && echo sedang memeriksa ada tidaknya koneksi internet 5 .
	timeout 1 >nul && echo. && echo  sedang memeriksa ada tidaknya koneksi internet 4 . .
	timeout 1 >nul && echo. && echo  sedang memeriksa ada tidaknya koneksi internet 3 . . .
	timeout 1 >nul && echo. && echo  sedang memeriksa ada tidaknya koneksi internet 2 . . . .
	timeout 1 >nul && echo. && echo  sedang memeriksa ada tidaknya koneksi internet 1 . . . . .
	echo.
	ping %server% > NUL
	if %ERRORLEVEL%==0 (
		echo =======================
		echo Terkoneksi ke internet
		echo =======================
		goto pasang
	) else (
		echo =============================
		echo Tidak terkoneksi ke internet
		echo =============================
		echo. && echo Pastikan kamu terkoneksi ke internet

		echo. && echo Tekan tombol apa saja untuk keluar
		pause >nul
		exit
	)
)

:pasang (
	powershell -command "Invoke-WebRequest 'https://raw.githubusercontent.com/SecreSw/unblock/main/hosts' -OutFile 'hosts'"
	
	ipconfig /flushdns > nul
	ipconfig /release > nul
	ipconfig /renew > nul

	cls
	echo.
	echo "Discord	: Alvian#1434"
	echo "IG		: _alvi.an"
	echo.
	echo ==   Hidup Kebebasan  ==
	echo.
	echo  berhasil terpasang
	echo.
	echo Tekan tombol apa saja untuk keluar
	pause >nul
	start chrome %url%
	exit
)

