��� 
cls
@echo off
dism>nul 2>&1||powershell start \"%0\" -verb runas&&exit||exit
echo GET: [BYTE]Page*Addr / [UINT]Paddr
echo SET: [BYTE]Page*Addr / [UINT]Paddr=[BYTE]Data
echo;
echo NOTE: PMC66/62=Page4
echo;
echo Paddr:
echo Office-Game/Turbo
echo PL1=1844-1840
echo PL2=1845-1841
echo PL4=1846-1842
:re
echo;
set /p in=ECRAM:
echo %in%|find "*">nul&&(set "page=$page"&set "val=[bitconverter]::touint16([byte[]]($addr,$page),0)")||(set page=&set "val=$addr")
echo %in%|find "=">nul&&(set "arg=(([int]$data-shl16)+$paddr)).nul")||(set "arg=(1tb+$paddr)).return -band 0xff")
powershell %page%,$addr,[byte]$data='%in%'.split('*,=');[uint16]$paddr=%val%;if (!$error){(iwmi -p """root\wmi:acpitest_mulong.instancename='acpi\pnp0c14\1_1'""" getsetulong -args %arg%}
timeout 2 /nobreak>nul
goto re