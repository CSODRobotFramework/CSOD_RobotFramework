*** Settings ***
Documentation     Suite description: This project / suite can run test on Appium Server locally as well as with Saucelabs, or and AWS.
Suite Setup       Global Test Fixture Suite Setup
Suite Teardown    Global Test Fixture Suite Teardown
Test Setup        Global Test Fixture Test Setup
Test Teardown     Global Test Fixture Test Teardown
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/CSOD_Locators.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/CSOD_Keywords.robot
Resource          ../Resources/COMP_PROJECTS/Global/GlobalKeywords.robot
Resource          ../Resources/COMP_PROJECTS/Global/GlobalObjectRepository.robot

*** Test Cases ***
PhantomJS
    [Tags]    Phantomjs
    Open Browser    https://qa01.csod.com/    phantomjs
    Maximize Browser Window
    Login_Page    QA01-AUTO-CV    JHennessy    popeye123

Copied_Comp_Code
    Comment    CompareXL.Open File Write    ${str}    Runtime_Comp_Adj.xls
    Comment    CompareXL.Excel One    Comp_Adj_OG.xls
    Comment    CompareXL.Excel Two    Runtime_Comp_Adj.xls
    Comment    ${Result1}=    CompareXL.Open File    Comp_Adj_OG.xls
    Comment    ${Result2}=    CompareXL.Open File    Runtime_Comp_Adj.xls
    Comment    ${Result3}=    Run Keyword And Ignore Error    CompareXL.Compare Content    ${Result1}    ${Result2}
    Comment    Run Keyword If    '${Result3[0]}' == 'FAIL'    Set Test Message    ${Result3[1]}
    Comment    Run Keyword If    '${Result3[0]}' == 'FAIL'    Fail    ${Result3[1]}

Create Dictionary Test
    [Documentation]    Creates and returns a dictionary based on given items
    Comment    Create a Dictionary Object
    ${COMPWageTypeDictionary}=    Create Dictionary
    Comment    Adds the given key_value_pairs and items to the dictionary
    Set To Dictionary    ${COMPWageTypeDictionary}    USD    $ USD
    Set To Dictionary    ${COMPWageTypeDictionary}    GBP    £ GBP
    Set To Dictionary    ${COMPWageTypeDictionary}    KRW    ₩ KRW
    Set To Dictionary    ${COMPWageTypeDictionary}    AUD    A$ AUD
    Set To Dictionary    ${COMPWageTypeDictionary}    EUR    € EUR
    Set To Dictionary    ${COMPWageTypeDictionary}    JPY    ¥ JPY
    Comment    Logs the size and contents of the dictionary using given level.
    Log Dictionary    ${COMPWageTypeDictionary}
    Comment    Copy Existing Dictionary to a new Dictionary
    ${MyDictionary2}=    Copy Dictionary    ${COMPWageTypeDictionary}
    Log Dictionary    ${MyDictionary2}
    Comment    Returns keys of the given dictionary
    ${Keys}=    Get Dictionary Keys    ${COMPWageTypeDictionary}
    Log    ${Keys}
    Comment    Returns a value from the given dictionary based on the given key
    ${keyValue}=    Get From Dictionary    ${COMPWageTypeDictionary}    USD
    Log    ${keyValue}
    Comment    Removes the given keys from the dictionary.
    Remove From Dictionary    ${COMPWageTypeDictionary}    KRW
    Log Dictionary    ${COMPWageTypeDictionary}
    Comment    Keeps the given keys in the dictionary and removes all other.
    Keep In Dictionary    ${COMPWageTypeDictionary}    JPY
    Log Dictionary    ${COMPWageTypeDictionary}
    Dictionary Should Contain Key    ${COMPWageTypeDictionary}    JPY

Test_Dictionary
    Comment    Currency_Dictionary    JPY
    Killall_Browser_Process

PDF_Test1
    ${fileCount1}=    Count Pdf Pages    Comp_CS_OG.pdf
    Log    ${fileCount1}
    ${fileCount2}=    Count Pdf Pages    Comp_CS_RT.pdf
    Log    ${fileCount2}
    Should Be Equal    ${fileCount2}    ${fileCount1}
    ${fileExtractedText1}    Convert Pdf To Txt    Comp_CS_OG.pdf    65 yrs / 9 mons
    Log    ${fileExtractedText1}
    ${fileExtractedText2}    Convert Pdf To Txt    Comp_CS_RT.pdf    65 yrs / 9 mons
    Log    ${fileExtractedText2}
    Should Be Equal    ${fileExtractedText1}    ${fileExtractedText2}

Kill_ChromeDriver
    Kill_Chrome_Driver

COMP_BDD_Adj_Report_GBP
    [Tags]    COMPADJ
    Navigate_To_Report
    Select_Task_And_Criteria    All employees    GBP
    Download_Excel_And_Compare    GBP_OG1.xls

COMP_BDD_Adj_Report_USD
    [Tags]    COMPADJ
    Navigate_To_Report
    Select_Task_And_Criteria    All employees    USD
    Download_Excel_And_Compare    USD_OG1.xls

COMP_BDD_Adj_Report_AUD
    [Tags]    COMPADJ
    Navigate_To_Report
    Select_Task_And_Criteria    All employees    AUD
    Download_Excel_And_Compare    AUD_OG1.xls

COMP_BDD_Adj_Report_EUR
    [Tags]    COMPADJ
    Navigate_To_Report
    Select_Task_And_Criteria    All employees    EUR
    Download_Excel_And_Compare    EUR_OG1.xls

COMP_BDD_Adj_Report_KRW
    [Tags]    COMPADJ
    Navigate_To_Report
    Select_Task_And_Criteria    All employees    KRW
    Download_Excel_And_Compare    KRW_OG1.xls

*** Keywords ***
Backup
    Comment    Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    platformVersion=4.4.2    deviceName=/Users/Admin/.android/avd/Nexus_S.avd    app=/Users/Admin/Downloads/android-release.apk
    ...    appPackage=com.csod.mobile.CSOD    appActivity=com.csod.mobile.CSOD.MainActivity
    Comment    Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    platformVersion=4.4.2    deviceName=/Users/Admin/.android/avd/Nexus_S.avd    app=/Users/Admin/Downloads/JSC_Salon.apk
    ...    appPackage=com.example.jscbopal.myapplicationtbl    appActivity=com.example.jscbopal.view.MainActivity
    Comment    Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    platformVersion=5.1.1    deviceName=/Users/Admin/.android/avd/Galaxy_Nexus.avd    app=/Users/Admin/Downloads/android-release.apk
    ...    appPackage=com.csod.mobile.CSOD    appActivity=com.csod.mobile.CSOD.MainActivity
    Comment    Query
    Comment    Open Application    http://127.0.0.1:4723/wd/hub    platformName=Android    platformVersion=5.0    deviceName=/Users/Admin/.android/avd/Nexus_One.avd    app=/Users/Admin/Downloads/android-release.apk
    ...    appPackage=com.csod.mobile.CSOD    appActivity=com.csod.mobile.CSOD.MainActivity
    Comment    Open Application    http://gfung:3e42e523-3f0e-4d5b-b68a-6a474253aacb@ondemand.saucelabs.com:80/wd/hub    platformName=Android    platformVersion=4.4    deviceName=Samsung Galaxy S4 Emulator    app=/Users/Admin/Downloads/android-release.apk
    ...    build=QA-Device-Test-2    name=Android Device Test    tag=Android-App-Samsung-Galaxy-S4    passed=TRUE
    Open Application    http://gfung:3e42e523-3f0e-4d5b-b68a-6a474253aacb@ondemand.saucelabs.com:80/wd/hub    platformName=iOS    platformVersion=9.2    deviceName=iPhone 6 Plus    app=sauce-storage:csod-ios.zip    build=QA-Device-Test-3
    ...    name=iOS Device Test    tag=iPhone 6 Plus    passed=TRUE    deviceOrientation=portrait    appiumVersion=1.5.1    autoAcceptAlerts=true
    ...    browerName=""
    Comment    sleep    10 sec
    Comment    Open Application    http://gfung:3e42e523-3f0e-4d5b-b68a-6a474253aacb@ondemand.saucelabs.com:80/wd/hub    platformName=Android    platformVersion=4.4    deviceName=Samsung Galaxy S4 Emulator    app=sauce-storage:android-release.apk
    ...    build=QA-Device-Test-2    name=Android Device Test    tag=Android-App-Samsung-Galaxy-S4    passed=TRUE    autoAcceptAlerts=true    browerName=""
    Comment    Open Application    http://127.0.0.1:4723/wd/hub    platformName=iOS    platformVersion=8.4    deviceName=iPhone 5s    app=/Users/Admin/Library/Developer/Xcode/DerivedData/UICatalog-dottiknfukhtddfztqrfyuzcabwv/Build/Products/Debug-iphonesimulator/UICatalog.app
    Comment    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    xpath=//UIAButton[1][@name=‘UICatalog’][1]
    Comment    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    xpath=//UIATableCell[1][@name=‘Date Picker’][1]
    Comment    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    IosUIAutomation=UIATarget.localTarget().target.frontMostApp().navigationBar().leftButton()
    Comment    Open Application    http://127.0.0.1:4723/wd/hub    platformName=iOS    platformVersion=8.4    deviceName=iPhone 5s    app=/Users/Admin/Downloads/csod.app
    ...    autoAcceptAlerts=true
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    xpath=//UIAStaticText[1][@name='Sign In'][1]
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Shake
    sleep    4s
    Comment    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Hide Keyboard    key_name=None
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    xpath=//UIATextField[1][@value='Portal'][1]
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Input Text    xpath=//UIATextField[1][@value='Portal'][1]    qa05/qa05-mobile
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    xpath=//UIATextField[2][@value='Username'][1]
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Input Text    xpath=//UIATextField[2][@value='Username'][1]    ghernandez
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    xpath=//UIASecureTextField[1][@value='Password'][1]
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Input Text    xpath=//UIASecureTextField[1][@value='Password'][1]    qwer
    Comment    Wait Until Keyword Succeeds    2 x    5s    Element Text Should Be    xpath=//UIAStaticText[2][contains(text(),'Submit')]    Submit
    AppiumLibrary.Page Should Contain Element    xpath=//UIAStaticText[2][@name='Submit'][1]
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    xpath=//UIAStaticText[2][@name='Submit'][1]
    Comment    Wait Until Element Is Visible    xpath=//UIAStaticText[5][@name='OK'][1]    timeout=20s
    Comment    ${var1}=    Run Keyword If    ${lnkOKConfirm.m} == '    Wait Until Element Is Visible    xpath=//UIAStaticText[5][@name='OK'][1]    timeout=20s
    Comment    @{ITEMS}    Create List
    Comment    Wait Until Keyword Succeeds    2 x    20s    AppiumLibrary.Click Element    xpath=//UIAStaticText[5][@name='OK'][1]
    Comment    Wait Until Keyword Succeeds    2 x    20s    AppiumLibrary.Input Text    xpath=//UIASecureTextField[1][@value='Password'][1]    qwer
    : FOR    ${INDEX}    IN RANGE    1    6
    \    ${status}    ${value}=    Run Keyword And Ignore Error    Page Should Contain Link    xpath=//UIAStaticText[5][@name='OK'][1]
    \    log    ${INDEX}
    \    log    ${status}
    \    Run Keyword If    '${status}'=='PASS'    AppiumLibrary.Click Element    xpath=//UIAStaticText[5][@name='OK'][1]    Exit for Loop
    : FOR    ${INDEX}    IN RANGE    1    3
    \    ${status}    ${value}=    Run Keyword And Ignore Error    Page Should Contain Link    xpath=//UIASecureTextField[1][@value='Password'][1]
    \    log    ${INDEX}
    \    log    ${status}
    \    Run Keyword If    '${status}'=='PASS'    AppiumLibrary.Input Text    xpath=//UIASecureTextField[1][@value='Password'][1]    qwer    Exit for Loop
    \    Comment    Run Keyword And Ignore Error    Run Keyword If    '${status}'=='PASS'    AppiumLibrary.Click Element    xpath=//UIAStaticText[2][@name='Submit'][1]
    : FOR    ${INDEX}    IN RANGE    1    2
    \    ${status}    ${value}=    Run Keyword And Ignore Error    Page Should Contain Link    xpath=//UIAStaticText[2][@name='Submit'][1]
    \    log    ${INDEX}
    \    log    ${status}
    \    Run Keyword If    '${status}'=='PASS'    AppiumLibrary.Click Element    xpath=//UIAStaticText[2][@name='Submit'][1]    Exit for Loop
    Comment    \    Wait Until Element Is Visible    xpath=//UIAStaticText[5][@name='OK'][1]    20s
    Comment    \    Log    ${ELEMENT}
    Comment    \    Run Keyword If    '${ELEMENT}' == 'Break On Me'    Exit For Loop
    Comment    \    Log    Do more actions here ...
    Comment    Wait Until Keyword Succeeds    2 x    20s    AppiumLibrary.Click Element    xpath=//UIAStaticText[2][@name='Submit'][1]
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Capture Page Screenshot    ${Screenshot}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    xpath=//UIAStaticText[13][@name='Team'][1]
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Page Should Contain Element    xpath=//UIAApplication[1]/UIAWindow[1]/UIAScrollView[1]/UIAWebView[1]/UIAImage[1]
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    xpath=//UIAApplication[1]/UIAWindow[1]/UIAScrollView[1]/UIAWebView[1]/UIAImage[1]
    sleep    4 sec
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Page Should Contain Element    xpath=//UIAStaticText[14][@name='Gabriel0 Hernandez0'][1]
    Comment    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    xpath=//UIAStaticText[17]
    Comment    Wait Until Keyword Succeeds    2 x    5s    Swipe    10    0
    ...    10    0    1000
    Comment    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Click Element    xpath=//UIAStaticText[21][@name='Feedback'][1]

SauceLabs
    Setup system under test
    Reset Application
