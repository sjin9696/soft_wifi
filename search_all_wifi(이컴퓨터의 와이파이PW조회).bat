::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJG6N+kY/Pwhofx2RKG63Vecgx+b+y/iOtEhTXeEwGA==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAjk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIjIgI0
::eg0/rx1wNQPfEVWB+kM9LVsJDBeHPXm5Dood5OTE7OWKnVoUUusAaJi7
::fBEirQZwNQPfEVWB+kM9LVsJDBeHPXm5Dood5OTE7OWKnVoUUusAaJi7
::cRolqwZ3JBvQF1fEqQIjLRpGTwy9PWe2ObYT5dfs5uyOnV0KNA==
::dhA7uBVwLU+EWFOd5002PHs=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATEphJifXs=
::ZQ0/vhVqMQ3MEVWAtB9wKhpALA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnWpBBlZksMAlTUXA==
::Zh4grVQjdCyDJGyX8VAjFBBZTjimOXixEroM1Pv+7viEqnIcWO4Ab4bd0/qLOOVz
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
color 08
setlocal enabledelayedexpansion

echo.
echo [ 저장된 와이파이 목록 및 비밀번호 ]
echo ============================================================

set /a count=1

for /f "tokens=2 delims=:" %%a in ('netsh wlan show profiles ^| findstr /i /c:"모든 사용자 프로필" /c:"All User Profile"') do (
    set "ssid=%%a"
    set "ssid=!ssid:~1!"

    netsh wlan show profile name="!ssid!" key=clear > temp_wifi.txt 2>nul

    set "pw_key="
    for /f "tokens=2 delims=:" %%b in ('findstr /i /c:"키 콘텐츠" /c:"Key Content" temp_wifi.txt') do (
        set "pw_key=%%b"
    )

    if !count! LSS 10 (
        set "num_pad= !count!. "
    ) else (
        set "num_pad=!count!. "
    )

    set "ssid_pad=!ssid!                              "
    set "pw_pad=!pw_key!                              "

    echo !num_pad!!ssid_pad:~0,30! pw_key: !pw_pad:~0,30!

    del temp_wifi.txt
    set /a count+=1
)

echo ============================================================
echo 완료되었습니다.
echo.
echo [Enter 키를 누르면 창이 닫힙니다]
pause >nul
