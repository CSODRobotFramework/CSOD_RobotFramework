*** Settings ***
Test Setup        Open test browser
Test Teardown     Close test browser
Library           Selenium2Library
Library           ../Resources/Libraries/Sauce.py

*** Variables ***
${BROWSER}        chrome
${REMOTE_URL}     http://gfung:3e42e523-3f0e-4d5b-b68a-6a474253aacb@ondemand.saucelabs.com:80/wd/hub
${DESIRED_CAPABILITIES}    platform:OS X 10.9,browserName:chrome
${LOGIN_FAIL_MSG}    Incorrect username or password.
${TEST_NAME}      Test Saucelabs Login
${SUITE_NAME}     SauceTestSuiteChrome

*** Test Cases ***
Incorrect username or password
    [Tags]    Login
    Go To    https://saucelabs.com/login
    Page should contain element    id=username
    Page should contain element    id=password
    Input text    id=username    anonymous
    Input text    id=password    secret
    Click button    id=submit
    Page Should Contain    ${LOGIN_FAIL_MSG}

SauceLabsReportTest
    Go To    https://qa05.csod.com
    Page Should Contain    ${LOGIN_FAIL_MSG}

*** Keywords ***
Open test browser
    Open Browser    about:    ${BROWSER}    remote_url=${REMOTE_URL}    desired_capabilities=${DESIRED_CAPABILITIES}

Close test browser
    Comment    Run keyword if    '${REMOTE_URL}' != ''    Report Sauce Status    ${SUITE_NAME} | ${TEST_NAME}    ${TEST_STATUS}    @{TEST_TAGS}
    ...    ${REMOTE_URL}
    Comment    Log    ${REMOTE_URL}
    Sauce.Set Test Status    self    QA Build 16.0.23.90    Passed
    Sauce.Tear Down    self
    Comment    Run keyword if    '${REMOTE_URL}' =="    SauceLabsReport.Report Saucelabs Status    ${SUITE_NAME} | ${TEST_NAME}    ${TEST_STATUS}    @{TEST_TAGS}
    ...    ${REMOTE_URL}
    Close all browsers
