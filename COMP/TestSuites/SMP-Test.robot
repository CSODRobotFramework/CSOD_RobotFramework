*** Settings ***
Library           SQLlibrary
Library           HttpLibrary.HTTP
Resource          ../Resources/SMP_PROJECTS/SMP_Resources.robot

*** Test Cases ***
SQL-TestCase
    [Documentation]    *Name*
    ...    API_Talent_Pool_Create_Success_Return_Name.
    ...
    ...    *Description:*
    ...    verify new talent pool returns correct name
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    InnocentName    Title
