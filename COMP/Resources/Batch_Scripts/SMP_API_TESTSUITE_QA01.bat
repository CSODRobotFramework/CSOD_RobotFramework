::C:\Users\gfung\.jenkins\workspace\SMP-API-Talent_Pool
@echo off
::cd C:\Users\gfung\.jenkins\workspace\COMP-Smoketest-Admin-Side\COMP\TestSuites\robotframework-rerunfailed-master\
::cd C:\Users\gfung\.jenkins\workspace\SMP-API-Talent_Pool\COMP\TestSuites\robotframework-rerunfailed-master\
cd C:\Users\gfung\.jenkins\workspace\SMP-API-Talent_Pool_QA01\COMP\TestSuites\
::cd C:\Users\gfung\.jenkins\workspace\SMP-API-Talent_Pool\COMP\TestSuites\
rd /s /q OG_TEST_RESULTS
::del output.xml

echo #######################################
echo # Running tests first time #
echo #######################################
::pybot --outputdir OG_TEST_RESULTS unstable_suite.robot
::cmd /c pybot --outputdir OG_TEST_RESULTS ReRunTest.robot

cmd /c pybot --outputdir OG_TEST_RESULTS  -i POST -i PUT -i GET -i DELETE -v RNOAUTH_HOST:QA01 -v api_global_parameter_profile:qa01  --listener TestRailListener:2386 SMP-API-Talent_Pool.robot
::cmd /c pybot –outputdir C:\Users\gfung\.jenkins\workspace\COMP\TestSuites\ %*

:: we stop the script here if all the tests were OK
:: if errorlevel 1 echo # FAILED Going to Rerun now! #
if errorlevel 1 goto DGTFO
echo #######################################
echo # Tests passed, no rerun #
echo #######################################
exit /b
:: otherwise we go for another round with the failing tests
:DGTFO
:: we keep a copy of the first log file to first_run_log.html
copy OG_TEST_RESULTS\log.html OG_TEST_RESULTS\first_run_log.html /Y

:: we launch the tests that failed
echo #######################################
echo # Running again the tests that failed #
echo #######################################
::cmd /c pybot --outputdir OG_TEST_RESULTS --nostatusrc --rerunfailed OG_TEST_RESULTS/output.xml --output rerun.xml ReRunTest.robot
cmd /c pybot --nostatusrc --outputdir OG_TEST_RESULTS --rerunfailed OG_TEST_RESULTS/output.xml --output rerun.xml %*
::--output.xml rerun.xml %*
:: Robot Framework generates file rerun.xml

:: we keep a copy of the second log file
copy OG_TEST_RESULTS\log.html OG_TEST_RESULTS\second_run_log.html /Y


:: Merging output files
echo ########################
echo # Merging output files #
echo ########################
cmd /c rebot --nostatusrc --outputdir OG_TEST_RESULTS --output output.xml --merge OG_TEST_RESULTS/output.xml OG_TEST_RESULTS/rerun.xml