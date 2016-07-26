*** Settings ***
Documentation     This resource file contains the implementation for the Global keywords
Resource          GlobalConfig.robot
Resource          GlobalObjectRepository.robot
Resource          ../Utility/UtilityKeywords.robot

*** Variables ***

*** Keywords ***
Global Go To
    [Arguments]    ${moduleName}
    Run Keyword And Ignore Error    Utility Click Element    ${obj_global_moreTabsMenu}    3 sec
    Utility Click Element By Text    ${moduleName}

Global Go To Assignments
    Global Go To    Assignments

Global Go To Home
    Utility Click Element By Text    Home
    Utility Sleep
    Utility Page Should Contain    ${cfg_global_default_pagesync}

Global Login
    [Arguments]    ${corp}    ${username}    ${password}
    [Documentation]    Log into the CSOD application
    Utility Input Text    ${obj_global_login_corp}    ${corp}
    Utility Input Text    ${obj_global_login_username}    ${username}
    Utility Input Text    ${obj_global_login_password}    ${password}
    Utility Click Element    ${obj_global_login_loginButton}
    Utility Page Should Contain    ${cfg_global_home_pagesync}

Global Logout
    [Documentation]    Logout of the CSOD application
    Select Window
    Utility Click Element No Focus    ${obj_global_logout_button}
    Utility Click Element No Focus    ${obj_global_link_logout}
    Comment    Utility Page Should Contain    ${cfg_global_login_pagesync}

Global Open Application
    [Arguments]    ${url}    ${browser}
    [Documentation]    Opens a browser session in the specified browser, navigates to the specified URL, and maximizes the browser window. \ http://robotframework.org/Selenium2Library/doc/Selenium2Library.html#Open%20Browser
    Open Browser    ${url}    ${browser}    remote_url=${cfg_sauceLabs_remoteUrl}    desired_capabilities=${cfg_sauceLabs_desiredCapabilities}
    Maximize Browser Window

Global Test Fixture Suite Setup
    [Documentation]    Test fixture that handles suite setup
    Append To Environment Variable    PATH    ${cfg_global_resource_webdrivers}
    Global Open Application    ${cfg_global_login_url}    ${cfg_global_login_browser}

Global Test Fixture Suite Teardown
    [Documentation]    Test fixture that handles suite teardown
    Close All Browsers
    Comment    Send Mail With Attachment    geeslimmy@gmail.com    popeye123    gfung@csod.com    Compensation Smoke Test    This is the Compensation Smoketest please take the time to review the Test Suite results
    ...    C:\\Users\\gfung\\.jenkins\\workspace\\COMP\\report.html

Global Test Fixture Test Setup
    [Documentation]    Test fixture that handles test setup
    Global Login    ${cfg_global_login_corp}    ${cfg_global_login_username}    ${cfg_global_login_password}

Global Test Fixture Test Teardown
    [Documentation]    Test fixture that handles test teardown
    Run Keyword If    '${TEST_STATUS}'=='FAIL'    Log Source
    Global Logout
    Run Keyword If    '${TEST_STATUS}'=='FAIL'    Global Test Fixture Suite Teardown
    Run Keyword If    '${TEST_STATUS}'=='FAIL'    Global Test Fixture Suite Setup

Global Test Fixture Suite Setup with Kill Browser
    [Arguments]    ${killBrowser}=killall -9 "Google Chrome"    # To kill browsers: killall -9 "Google Chrome", killall firefox, killall Safari
    Comment    Run    ${killBrowser}
    Comment    Append To Environment Variable    PATH    ${cfg_global_resource_webdrivers}
    Comment    ${cfg_global_login_url}    ${cfg_global_login_browser}

Global Open Application with SauceLabs
    [Documentation]    Opens a browser session in the specified browser, navigates to the specified URL, and maximizes the browser window. \ http://robotframework.org/Selenium2Library/doc/Selenium2Library.html#Open%20Browser
    Open Browser    https://qa05.csod.com/    chrome    remote_url=http://gfung:3e42e523-3f0e-4d5b-b68a-6a474253aacb@ondemand.saucelabs.com:80/wd/hub    desired_capabilities=platform:OS X 10.9,browserName:chrome
    Maximize Browser Window

Global Test Fixture Suite Teardown with Email Attachment
    [Documentation]    Test fixture that handles suite teardown
    Close All Browsers
    ${comp_status}=    Set Variable    ${SUITE_STATUS}
    ${comp_suite_name}=    Set Variable    ${SUITE_NAME}
    Send Mail With Attachment    geefung@gmail.com    popeye123    gfung@csod.com    ${comp_smoke_test_status} ${comp_suite_name} ${cfg_global_login_profile} ${comp_status}    This is the Compensation Smoketest please take the time to review the Test Suite results attached html file.    C:\\Users\\gfung\\Documents\\RobotFrameworkTeam\\CSOD_RobotFramework\\COMP\\TestResults\\report.html

Global Test Fixture Go To URL Teardown
    Run Keyword If    '${TEST_STATUS}'=='FAIL'    Log Source
    Utility Go To URL    ${cfg_global_login_url}
    Run Keyword If    '${TEST_STATUS}'=='FAIL'    Global Test Fixture Suite Teardown
    Run Keyword If    '${TEST_STATUS}'=='FAIL'    Global Test Fixture Suite Setup
