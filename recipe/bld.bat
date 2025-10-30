@echo on
cd w%ARCH%

copy /Y config_VC config.h
set "MAJ_MIN_VER=%PKG_VERSION:.=_%"

REM build static
nmake /f Makefile_VC
if errorlevel 1 exit 1

REM build shared
nmake /f Makefile_VC_DLL
if errorlevel 1 exit 1

if not exist "%LIBRARY_BIN%" mkdir "%LIBRARY_BIN%"
if not exist "%LIBRARY_INC%" mkdir "%LIBRARY_INC%"
if not exist "%LIBRARY_LIB%" mkdir "%LIBRARY_LIB%"

copy /Y glpsol.exe "%LIBRARY_BIN%"
copy /Y ..\src\glpk.h "%LIBRARY_INC%"
copy /Y "glpk_%MAJ_MIN_VER%.dll" "%LIBRARY_BIN%\"
copy /Y "%LIBRARY_BIN%\glpk_%MAJ_MIN_VER%.dll" "%LIBRARY_BIN%\glpk.dll"

REM import and static libs:
REM current glpk.lib = static => save like glpk_static.lib
REM import glpk_%MAJ_MIN_VER%.lib => save like glpk.lib
copy /Y glpk.lib "%LIBRARY_LIB%\glpk_static.lib"
copy /Y "glpk_%MAJ_MIN_VER%.lib" "%LIBRARY_LIB%\glpk.lib"

REM (optional) PDB, if debug needed
if exist "glpk_%MAJ_MIN_VER%.pdb" copy /Y "glpk_%MAJ_MIN_VER%.pdb" "%LIBRARY_BIN%\"

exit /b 0
