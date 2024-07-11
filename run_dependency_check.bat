@echo off

set DC_VERSION="latest"
set DC_DIRECTORY=%USERPROFILE%\OWASP-Dependency-Check
SET DC_PROJECT="dependency-check scan: %CD%"
set DATA_DIRECTORY="%DC_DIRECTORY%\data"
set CACHE_DIRECTORY="%DC_DIRECTORY%\data\cache"
set NVD_API_KEY=%1

IF NOT EXIST %DATA_DIRECTORY% (
    echo Initially creating persistent directory: %DATA_DIRECTORY%
    mkdir %DATA_DIRECTORY%
)
IF NOT EXIST %CACHE_DIRECTORY% (
    echo Initially creating persistent directory: %CACHE_DIRECTORY%
    mkdir %CACHE_DIRECTORY%
)
IF NOT EXIST %CD%\odc-reports (
	echo Initially creating persistent directory: %CD%\odc-reports
	mkdir %CD%\odc-reports
)

podman machine start

rem Make sure we are using the latest version
podman image pull owasp/dependency-check:%DC_VERSION%

podman container run --rm ^
    --volume %CD%:/src ^
    --volume %DATA_DIRECTORY%:/usr/share/dependency-check/data ^
    --volume %CD%/odc-reports:/report ^
    owasp/dependency-check:%DC_VERSION% ^
    --scan /src ^
    --format "ALL" ^
    --project "%DC_PROJECT%" ^
	--nvdApiKey "%NVD_API_KEY%" ^
    --out /report
    rem Use suppression like this: (where /src == %CD%)
    rem --suppression "/src/security/dependency-check-suppression.xml"