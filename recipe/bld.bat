cd w%ARCH%
copy config_VC config.h

:: Get the major minor version info (e.g. `4_60`)
set MAJ_MIN_VER="4_65"
nmake /f Makefile_VC
nmake /f Makefile_VC_DLL

set MAJ_MIN_VER="4_65"
copy glpsol.exe %LIBRARY_BIN%
copy ..\src\glpk.h %LIBRARY_INC%
copy glpk.lib %LIBRARY_LIB%
copy glpk_%MAJ_MIN_VER%.dll %LIBRARY_BIN%
copy glpk_%MAJ_MIN_VER%.dll %LIBRARY_BIN%\glpk.dll

if errorlevel 1 exit 1
