@echo off
cd %~dp0
start jre\bin\javaw.exe -Xmx512M -p lib --add-modules ALL-MODULE-PATH -Djava.library.path=".;lib" -Di2p.dir.base=. -DloggerFilenameOverride=logs/log-router-@.txt net.i2p.router.RouterLaunch
exit
