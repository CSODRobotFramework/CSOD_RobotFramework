*** Settings ***
Documentation     This resource file contains the implementation for the Utility keywords
Resource          UtilityConfig.robot
Resource          UtilityObjectRepository.robot
Library           DateTime
Library           OperatingSystem
Library           Selenium2Library
Library           String

*** Variables ***
@{MONTHNAME}      January    February    March    April    May    June    July
...               August    September    October    November    December

*** Keywords ***
Utility Add Time To Current Date
    [Arguments]    ${time}=0 day
    ${currentDate}=    Get Current Date    result_format=datetime
    ${date}=    Add Time To Date    ${currentDate}    ${time}
    ${date}=    Convert Date    ${date}    result_format=%m/%d/%Y
    [Return]    ${date}

Utility Alert Handler
    Choose Ok On Next Confirmation
    ${alertHandlerReturn1}=    Run Keyword And Ignore Error    Wait Until Keyword Succeeds    3 times    1 sec    Alert Should Be Present
    Return From Keyword If    '${alertHandlerReturn1[0]}'=='PASS'
    ${alertHandlerReturn2}=    Run Keyword And Ignore Error    Wait Until Keyword Succeeds    3 times    1 sec    Dismiss Alert
    Return From Keyword If    '${alertHandlerReturn2[0]}'=='PASS'
    ${alertHandlerReturn3}=    Run Keyword And Ignore Error    Wait Until Keyword Succeeds    3 times    1 sec    Get Alert Message
    Return From Keyword If    '${alertHandlerReturn3[0]}'=='PASS'
    ${alertHandlerReturn4}=    Run Keyword And Ignore Error    Wait Until Keyword Succeeds    3 times    1 sec    Confirm Action

Utility Click Element
    [Arguments]    ${locator}    ${timeout}=1 min
    Utility Sync Element    ${locator}    ${timeout}
    Wait Until Keyword Succeeds    2 x    5s    Click Element    ${locator}

Utility Click Element By Text
    [Arguments]    ${linkText}
    ${xpath}=    Catenate    SEPARATOR=    xpath=//*[normalize-space(text())='    ${linkText}    ']
    Utility Sync Element    ${xpath}
    Click Element    ${xpath}

Utility Click Element By Title
    [Arguments]    ${title}    ${timeout}=1 min
    ${xpath}=    Catenate    SEPARATOR=    xpath=//*[normalize-space(@title)='    ${title}    ']
    Utility Sync Element    ${xpath}    ${timeout}
    Click Element    ${xpath}

Utility Click Element If Exist
    [Arguments]    ${locator}    ${timeout}=3 sec
    ${elementFound}=    Run Keyword And Ignore Error    Utility Page Should Contain Element    ${locator}    ${timeout}
    Run Keyword If    '${elementFound[0]}'=='PASS'    Utility Click Element    ${locator}

Utility Get Date Time Stamp
    [Documentation]    Generates and returns a unique date time stamp
    ${dateTimeStamp}=    Get Time    epoch    NOW
    ${dateTimeStamp}=    Convert To String    ${dateTimeStamp}
    [Return]    ${dateTimeStamp}

Utility Input Text
    [Arguments]    ${locator}    ${inputText}
    Utility Sync Element    ${locator}
    Input Text    ${locator}    ${inputText}

Utility Page Should Contain
    [Arguments]    ${text}    ${timeout}=1 min
    ${pgShouldContainRet1}=    Wait Until Page Contains    ${text}    ${timeout}

Utility Page Should Contain Element
    [Arguments]    ${locator}    ${timeout}=1 min
    ${pgShouldContainEleRet1}=    Wait Until Page Contains Element    ${locator}    ${timeout}

Utility Page Should Not Contain
    [Arguments]    ${text}    ${timeout}=1 min
    ${pgShouldNotContainRet1}=    Wait Until Page Does Not Contain    ${text}    ${timeout}

Utility Page Should Not Contain Element
    [Arguments]    ${locator}    ${timeout}=1 min
    ${pgShouldNotContainEleRet1}=    Wait Until Page Does Not Contain Element    ${locator}    ${timeout}

Utility Select Checkbox
    [Arguments]    ${locator}
    Utility Sync Element    ${locator}
    Wait Until Keyword Succeeds    5 sec    1 sec    Element Should Be Enabled    ${locator}
    Select Checkbox    ${locator}

Utility Select Frame
    [Arguments]    ${locator}    ${timeout}=1 min
    Utility Sync Element    ${locator}    ${timeout}
    Select Frame    ${locator}

Utility Select From List By Index
    [Arguments]    ${locator}    ${index}
    Utility Sync Element    ${locator}
    Select From List By Index    ${locator}    ${index}

Utility Select From List By Label
    [Arguments]    ${locator}    ${label}
    Utility Sync Element    ${locator}
    Select From List By Label    ${locator}    ${label}

Utility Select From List By Value
    [Arguments]    ${locator}    ${listValue}
    Utility Sync Element    ${locator}
    ${selectedListValue}=    Get Selected List Value    ${locator}
    Return From Keyword If    '${selectedListValue}'=='${listValue}'
    Select From List By Value    ${locator}    ${listValue}

Utility Select Window
    [Arguments]    ${locator}=${EMPTY}
    ${selectWindowReturn1}=    Run Keyword And Continue On Failure    Wait Until Keyword Succeeds    10 sec    1 sec    Select Window    ${locator}
    ${windowIds}=    Run Keyword If    '${selectWindowReturn1}'=='None'    Get Window Identifiers
    ${windowNames}=    Run Keyword If    '${selectWindowReturn1}'=='None'    Get Window Names
    ${windowTitles}=    Run Keyword If    '${selectWindowReturn1}'=='None'    Get Window Titles
    Run Keyword If    '${selectWindowReturn1}'=='None'    Fail    Select Window FAILED. \ ${locator} was not found.

Utility Set Global Dynamic Object
    [Arguments]    ${object}    ${replace1}=default    ${replace2}=default
    [Return]    ${locator}=null

Utility Sleep
    [Arguments]    ${time}=3 sec
    Sleep    ${time}

Utility Sync Element
    [Arguments]    ${locator}    ${timeout}=1 min
    ${syncElementReturn1}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${locator}    ${timeout}
    Focus    ${locator}

Utility Wait Until Element Is Visible
    [Arguments]    ${locator}    ${timeout}=1 min
    ${waitUntilElementIsVisibleRet}=    Wait Until Element Is Visible    ${locator}    ${timeout}

Utility Set Test Message
    [Arguments]    ${testMsg}    ${append}=True
    Set Test Message    ${testMsg}    ${append}

Utility Sync Element No Focus
    [Arguments]    ${locator}    ${timeout}=1 min
    ${syncElementReturn1}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${locator}    ${timeout}

Utility Click Element No Focus
    [Arguments]    ${locator}    ${timeout}=1 min
    Utility Sync Element No Focus    ${locator}    ${timeout}
    Wait Until Keyword Succeeds    2 x    5s    Click Element    ${locator}

Utility Input Cal Mon Date Year
    ${d}=    Get Time
    log    {d}
    ${d}=    Get Current Date    result_format=%m/%d/%Y
    ${d}
    [Return]    ${d}

Utility Element Should Contain
    [Arguments]    ${tag_locator}
    Element Should Contain    ${tag_locator}    User Tags(1)    The text appears fine.

Utility Select Window Title
    ${str}=    Catenate    title=Realize Your Potential:    ${cfg_global_login_corp_default}
    [Return]    ${str}

Utility Click Element If Visible
    [Arguments]    ${locator}    ${timeout}=3 sec
    ${elementFound}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${locator}    ${timeout}
    Run Keyword If    '${elementFound[0]}'=='PASS'    Utility Click Element    ${locator}

Utility Email Report
    Comment    Send Mail With Attachment    ${email_from}    popeye123    ${email_to}    ${email_sub}    ${email_body}
    ...    ${path_to_report}
    Send Mail With Attachment    geeslimmy@gmail.com    popeye123    gfung@csod.com    Python Email Test    This is python test    C:\\Users\\gfung\\.jenkins\\workspace\\COMP\\report.html

Utility Go To URL
    [Arguments]    ${GoToURL}
    Run Keyword And Ignore Error    Go To    ${GoToURL}

Utility Element Should Contain Text
    [Arguments]    ${tag_locator}    ${expected_text}
    Element Should Contain    ${tag_locator}    ${expected_text}    The text appears fine.

Utility Element Should Contain Comp
    [Arguments]    ${tag_locator}
    Element Should Contain    ${tag_locator}    Processing...    The text appears fine.

Utility Select Window and Close Window
    [Arguments]    ${locator}=${EMPTY}
    Comment    ${selectWindowReturn1}=    Run Keyword And Continue On Failure    Wait Until Keyword Succeeds    10 sec    1 sec    Select Window
    ...    ${locator}
    Comment    ${windowIds}=    Run Keyword If    '${selectWindowReturn1}'=='None'    Get Window Identifiers
    Comment    ${windowNames}=    Run Keyword If    '${selectWindowReturn1}'=='None'    Get Window Names
    Comment    ${windowTitles}=    Run Keyword If    '${selectWindowReturn1}'=='None'    Get Window Titles
    Comment    Run Keyword If    '${selectWindowReturn1}'=='None'    Fail    Select Window FAILED. \ ${locator} was not found.
    Close Window

Utility Cal Handler
    [Arguments]    ${locator}
    ${d}=    Get Current Date    result_format=%m/%d/%Y
    log    ${d}
    Set Suite Variable    ${d}    ${d}
    Utility Sync Element    ${locator}
    Input Text    ${locator}    ${d}

Utility Cal Handler Plus Number
    [Arguments]    ${locator}    ${plusNumber}=+ 1 days
    ${d}=    Get Current Date    result_format=%m/%d/%Y
    log    ${d}
    Set Suite Variable    ${d}    ${d}
    Utility Sync Element    ${locator}
    ${d1}=    Get Current Date    UTC    ${plusNumber}    result_format=%m/%d/%Y
    log    ${d1}
    Input Text    ${locator}    ${d1}
