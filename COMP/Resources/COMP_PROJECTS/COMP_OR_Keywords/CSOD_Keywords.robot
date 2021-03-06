*** Settings ***
Library           Selenium2Library    run_on_failure=AppiumLibrary.CapturePageScreenshot
Library           OperatingSystem
Library           String
Library           Collections
Library           Process
Library           CompareXL
Library           CompareXLCustReport

*** Keywords ***
Environment
    [Arguments]    ${ENV}=https://qa05.csod.com/    ${browserName}=chrome    # This is the keyword to pass the url.
    Open Browser    ${ENV}    ${browserName}

LoginCredentials
    [Arguments]    ${Portal}=qa05/qa05-mobile    ${UserName}=ghernandez    ${Pswd}=qwer    ${Message}=The Submit Button appears fine.
    [Tags]    CSOD
    csodUtilShake
    csodMobUtilClick    ${lnkSignIn}
    csodMobUtilClick    ${txtPort}
    csodMobUtilInputText    ${txtPort}    ${Portal}
    csodMobUtilClick    ${txtUsernameMob}
    csodMobUtilInputText    ${txtUsernameMob}    ${UserName}
    csodMobUtilClick    ${txtPswd}
    csodMobUtilInputText    ${txtPswd}    ${Pswd}
    csodMobUtilClick    ${lnkSubmit}
    csodMobUtilMessage    ${Message}

LoginPopupHandler
    [Arguments]    ${elePopupContains}    # Page Should Contains this text
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

Login_Page
    [Arguments]    ${Corp}=QA052-AUTO-CV1    ${Username}=PKelly    ${Pswd}=popeye123
    [Documentation]    *SMP*
    ...
    ...    This is the Login Keyword for CSOD login page.
    ...
    ...    _The Keywords that can be used are:_
    ...
    ...    Corp
    ...
    ...    Username
    ...
    ...    Pswd
    ...
    ...    The Default login is QA052-AUTO-CV1, PKelly, popeye123
    [Tags]    SMP
    csodUtilInputText    ${txtCorp}    ${Corp}
    csodUtilInputText    ${txtUsername}    ${Username}
    csodUtilInputText    ${txtPassword}    ${Pswd}
    csodUtilClick    ${lnkSubmitbtn}

MobileLogin
    [Tags]    CSOD
    OpenApp
    AppiumLibrary.Log Source    loglevel=INFO
    AppiumLibrary.Switch To Context    WEBVIEW_1
    AppiumLibrary.Log Source    loglevel=INFO
    Comment    LoginCredentials
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Page Should Contain Element    xpath=//div[@id="login"]
    AppiumLibrary.Click Element    xpath=//div[@id="login"]

OpenApp
    Open Application    http://127.0.0.1:4723/wd/hub    platformName=iOS    platformVersion=8.4    deviceName=iPhone 5s    app=/Users/Admin/Downloads/csod.app    autoAcceptAlerts=true

OpenMobileApp
    [Arguments]    ${remote_url}=http://127.0.0.1:4723/wd/hub    ${platformName}=iOS    ${platformVersion}=9.2    ${deviceName}=iPhone 6 Plus    ${app}=sauce-storage:csod-ios.zip    ${autoAcceptAlerts}=True
    ...    # These are the arguments for desired capabilties for testing on local and saucelabs all possible arguments are not included you're welcome to add more.
    Open Application    remote_url=${remote_url}    platformName=${platformName}    platformVersion=${platformVersion}    deviceName=${deviceName}    app=${app}    autoAcceptAlerts=${autoAcceptAlerts}

csodUtilMessage
    [Arguments]    ${Message}    # This can be any message that can be helpful to see in Test Results Report output
    Set Test Message    Message=${Message}

csodUtilClick
    [Arguments]    ${locatorclick}
    Wait Until Keyword Succeeds    2 x    5s    Selenium2Library.Click Element    ${locatorclick}

csodUtilInputText
    [Arguments]    ${locator}    ${input}
    Wait Until Keyword Succeeds    2 x    5s    Selenium2Library.Input Text    ${locator}    ${input}

csodUtilScreenshot
    [Arguments]    ${Screenshot}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Capture Page Screenshot    ${Screenshot}

csodUtilShake
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Shake

csodUtileleShouldContain
    [Arguments]    ${locatorVerify}
    Wait Until Keyword Succeeds    2 x    5s    AppiumLibrary.Page Should Contain Element    ${locatorVerify}

Nav_Reports_Comp
    [Arguments]    ${ReportName}
    csodUtilClick    ${eleReportsTab}
    csodUtilClick    ${ReportName}

Compensation_Report
    [Arguments]    ${CompReportName}
    csodUtilClick    ${CompReportName}

UserCriteria
    [Arguments]    ${OUcomboBox}
    csodUtilComboBox    ${lstOUtype}    ${OUcomboBox}

csodUtilComboBox
    [Arguments]    ${Locator}    ${OUType}
    Wait Until Keyword Succeeds    2 x    5s    Selenium2Library.Select From List By Label    ${Locator}    ${OUType}

Search_Task_Popup
    csodUtilClick    ${imgTaskSearch}

Add
    csodUtilClick    ${lnkAdd}

Check_Rates_Comments
    csodUtilClick    ${chkHourlyRates}
    csodUtilClick    ${chkComments}
    csodUtilClick    ${chkPerfRating}
    csodUtilClick    ${chkLumpSum}

PopupWindow
    [Arguments]    ${TaskTitle}    # This is passed from the test run.
    ${ID_Titles}=    Get Window Titles
    Select Window    title=${ID_Titles[1]}
    csodUtilInputText    ${txtSearch}    ${TaskTitle}
    csodUtilClick    ${lnkSearch}
    csodUtilClick    ${imgAddButton}
    csodUtilClick    ${lnkDone}

Wage_Type
    [Arguments]    ${WageType}
    csodUtilClick    ${WageType}

Select_Browser_Window
    [Arguments]    ${Wait_For_Locator_Visible}
    Sleep    3 seconds
    Select Window    title=Compensation Adjustment
    Wait Until Element Is Visible    ${Wait_For_Locator_Visible}    timeout=5s    error=Could not find the page.

Select_Currency
    [Arguments]    ${CurrencyType}=GBP    # Default Currency is £ GBP
    ${COMPWageTypeDictionary}=    Create Dictionary
    Comment    Adds the given key_value_pairs and items to the dictionary
    Set To Dictionary    ${COMPWageTypeDictionary}    USD    $ USD
    Set To Dictionary    ${COMPWageTypeDictionary}    GBP    £ GBP
    Set To Dictionary    ${COMPWageTypeDictionary}    KRW    ₩ KRW
    Set To Dictionary    ${COMPWageTypeDictionary}    AUD    A$ AUD
    Set To Dictionary    ${COMPWageTypeDictionary}    EUR    € EUR
    Set To Dictionary    ${COMPWageTypeDictionary}    JPY    ¥ JPY
    Comment    Returns a value from the given dictionary based on the given key
    ${keyValue}=    Get From Dictionary    ${COMPWageTypeDictionary}    ${CurrencyType}
    Log    ${keyValue}
    csodUtilComboBox    ${lstCurrency}    ${keyValue}

Excel_Save_As
    csodUtilClick    ${lnkExcel}

Move_Files
    [Arguments]    ${File1PathSource}=C:\\Users\\gfung\\Downloads\\*.xls    ${File2PathDestination}=C:\\Users\\gfung\\.jenkins\\workspace\\COMP-Smoketest-Admin-Side\\COMP\\    ${OriginalFiles}=Comp_Adj_OG.xls
    ${MovedFile}=    Move File    ${File1PathSource}    ${File2PathDestination}
    Set Test Message    ${MovedFile}    append=True
    ${str}=    Replace String    ${MovedFile}    C:\\Users\\gfung\\.jenkins\\workspace\\COMP-Smoketest-Admin-Side\\COMP\\    ${EMPTY}
    Set Test Message    ${str}    append=True
    Set Test Message    ${str}
    CompareXL.Open File Write    ${str}    Runtime_Comp_Adj.xls
    CompareXL.Excel One    ${OriginalFiles}
    CompareXL.Excel Two    Runtime_Comp_Adj.xls
    ${Result1}=    CompareXL.Open File    ${OriginalFiles}
    ${Result2}=    CompareXL.Open File    Runtime_Comp_Adj.xls
    ${Result3}=    Run Keyword And Continue On Failure    CompareXL.Compare Content    ${Result1}    ${Result2}

Wait_For_File_Removed
    [Arguments]    ${File1SourceExist}
    Wait Until Removed    ${File1SourceExist}

File_Exist
    [Arguments]    ${File1SourceDirectory}
    Sleep    10 sec
    : FOR    ${INDEX}    IN RANGE    1    120
    \    ${Exist}=    Run Keyword And Ignore Error    File Should Exist    path=${File1SourceDirectory}    msg=The file does NOT exists
    \    Run Keyword If    '${Exist[0]}'=='PASS'    Exit For Loop
    \    Sleep    2 sec
    \    Log    ${File1SourceDirectory}

Excel_Compare
    [Arguments]    ${SourceFile}    ${SourceCopyFile}    ${DestinationOGFile}    # Three Arguments required: 1. The Runtime File 2. The Runtime File that's copied and renamed 3. The Original File we compare against.
    CompareXL.Open File Write    ${MovedFile}    Runtime_Comp_Adj.xls
    CompareXL.Excel One    Comp_Adj_OG.xls
    CompareXL.Excel Two    Runtime_Comp_Adj.xls
    ${Result1}=    CompareXL.Open File    Comp_Adj_OG.xls
    ${Result2}=    CompareXL.Open File    Runtime_Comp_Adj.xls
    ${Result3}=    Run Keyword And Ignore Error    CompareXL.Compare Content    ${Result1}    ${Result2}
    Run Keyword If    '${Result3[0]}' == 'FAIL'    Set Test Message    ${Result3[1]}
    Run Keyword If    '${Result3[0]}' == 'FAIL'    Fail    ${Result3[1]}

Archive_Files
    [Arguments]    ${File1PathSource}    ${File2PathDestination}    # This is to archive files so no files is in the RobotFramework Project folder
    ${MovedFile}=    Move File    ${File1PathSource}    ${File2PathDestination}
    Set Test Message    ${MovedFile}    append=Files have been archived.

Test_Tear_Down
    Run Keyword If    '${TEST_STATUS}'=='FAIL'    Set Test Message    The Excel has some differences.    append=True

Test_Setup
    Run Keyword And Continue On Failure    Archive_Files    /Users/Admin/PycharmProjects/RobotProject/Compensation*    /Users/Admin/PycharmProjects/RobotProject/ExcelArchived/
    Run Keyword And Continue On Failure    Archive_Files    /Users/Admin/PycharmProjects/RobotProject/Runtime_Comp_Adj.xls    /Users/Admin/PycharmProjects/RobotProject/ExcelArchived/

Currency_Dictionary
    [Arguments]    ${CurrencyDict}=GBP
    Comment    Create a Dictionary Object
    ${COMPWageTypeDictionary}=    Create Dictionary
    Comment    Adds the given key_value_pairs and items to the dictionary
    Set To Dictionary    ${COMPWageTypeDictionary}    USD    $ USD
    Set To Dictionary    ${COMPWageTypeDictionary}    GBP    £ GBP
    Set To Dictionary    ${COMPWageTypeDictionary}    KRW    ? KRW
    Set To Dictionary    ${COMPWageTypeDictionary}    AUD    A$ AUD
    Set To Dictionary    ${COMPWageTypeDictionary}    EUR    € EUR
    Set To Dictionary    ${COMPWageTypeDictionary}    JPY    ¥ JPY
    Comment    Returns a value from the given dictionary based on the given key
    ${keyValue}=    Get From Dictionary    ${COMPWageTypeDictionary}    ${CurrencyDict}
    Log    ${keyValue}

Killall_Browser_Process
    [Arguments]    ${killBrowser}=TASKKILL /IM chrome.exe /F    # To kill browsers:(MAC) killall -9 "Google Chrome", killall firefox, killall Safari, (PC) TASKKILL /IM iexplore.exe /F, TASKKILL /IM firefox.exe /F
    Run    ${killBrowser}

Login_To_Portal
    Environment
    Maximize Browser Window
    Login_Page    QA052-AUTO-COMP2    ssmith    popeye123

Navigate_To_Report
    Nav_Reports_Comp    ${lnkRepCompensation}
    Compensation_Report    ${lnkCompensationAdj}

Select_Task_And_Criteria
    [Arguments]    ${UserCriteria}=All employees    ${SelectCurrency}=GBP    ${TaskTitle}=UC_005_201510281905070    # Please provide: User Criteria, Currency, and Task Title
    [Documentation]    Please provide: User Criteria, Currency, and Task Title
    UserCriteria    ${UserCriteria}
    Add
    Search_Task_Popup
    PopupWindow    ${TaskTitle}
    Select_Browser_Window    ${rdoWageHourly}
    Wage_Type    ${rdoWageHourly}
    Check_Rates_Comments
    Select_Currency    ${SelectCurrency}

Download_Excel_And_Compare
    [Arguments]    ${OriginalFile}    # Example:USD_OG1.xls
    [Documentation]    The Downloaded Excel File is always being Downloaded to the Downloads folder therefore the path for the keywords: File_Exist, Move_Files, and Wait_For_File_Removed needs to point to the Downloads default folder on your Mac or PC system.
    Excel_Save_As
    File_Exist    C:\\Users\\gfung\\Downloads\\*.xls
    Move_Files    C:\\Users\\gfung\\Downloads\\*.xls    C:\\Users\\gfung\\.jenkins\\workspace\\COMP-Smoketest-Admin-Side\\COMP\\    ${OriginalFile}
    Wait_For_File_Removed    C:\\Users\\gfung\\Downloads\\*.xls
    Archive_Files    ${EXECDIR}\\Compensation*    ${EXECDIR}\\Resources\\Uploads\\Comp_Excel_Archived_Files\\
    Archive_Files    ${EXECDIR}\\Runtime_Comp_Adj.xls    ${EXECDIR}\\Resources\\Uploads\\Comp_Excel_Archived_Files\\
    Comment    Killall_Browser_Process

SauceLabs_Login
    Open Browser    ${cfg_sauceLabs_remoteUrl}

Kill_Chrome_Driver
    [Arguments]    ${killDriver}=TASKKILL /IM chromedriver.exe /F
    Run    ${killDriver}

Select_Criteria
    [Arguments]    ${OUType}=Division    # Default OU is Division
    ${OUTypeDictionary}=    Create Dictionary
    Comment    Adds the given key_value_pairs and items to the dictionary
    Set To Dictionary    ${OUTypeDictionary}    Division    Division
    Set To Dictionary    ${OUTypeDictionary}    Position    Position
    Set To Dictionary    ${OUTypeDictionary}    Grade    Grade
    Set To Dictionary    ${OUTypeDictionary}    Users    Users
    Set To Dictionary    ${OUTypeDictionary}    Location    Location
    Set To Dictionary    ${OUTypeDictionary}    Cost Center    Cost Center
    Comment    Returns a value from the given dictionary based on the given key
    ${keyValue}=    Get From Dictionary    ${OUTypeDictionary}    ${OUType}
    Log    ${keyValue}
    csodUtilComboBox    ${comp_smoke_select_criteria}    ${keyValue}

PopupWindowOU
    [Arguments]    ${comp_smoke_OU}=Fire    # This is passed from the test run.
    ${ID_Titles}=    Get Window Titles
    Select Window    title=${ID_Titles[1]}
    Maximize Browser Window
    Wait Until Element Is Visible    ${comp_smoke_name_field}    timeout=10 Sec
    csodUtilInputText    ${comp_smoke_name_field}    ${comp_smoke_OU}
    csodUtilClick    ${comp_smoke_tasks_avail_srch_Popup}
    csodUtilClick    ${comp_smoke_tasks_addBtn_Popup}
    csodUtilClick    ${comp_smoke_tasks_DoneBtnPopup}

SummerSet_Users
    [Arguments]    ${SummerSetUser}    ${textfieldlocator}    # Default user is aabbasi
    [Documentation]    *Purpose:*
    ...    This is a dictionary that can be used to type the username id into any textbox field across the application.
    ${SummerSetDictionary}=    Create Dictionary
    Comment    Adds the given key_value_pairs and items to the dictionary
    Set To Dictionary    ${SummerSetDictionary}    AAbbasi    AAbbasi
    Set To Dictionary    ${SummerSetDictionary}    ACanarry    ACanarry
    Set To Dictionary    ${SummerSetDictionary}    AStructure    AStructure
    Set To Dictionary    ${SummerSetDictionary}    BBee    BBee
    Set To Dictionary    ${SummerSetDictionary}    COverman    COverman
    Set To Dictionary    ${SummerSetDictionary}    CSeasons    CSeasons
    Set To Dictionary    ${SummerSetDictionary}    DArrington    DArrington
    Set To Dictionary    ${SummerSetDictionary}    DElkind    DElkind
    Set To Dictionary    ${SummerSetDictionary}    DWan    DWan
    Set To Dictionary    ${SummerSetDictionary}    DWatson    DWatson
    Set To Dictionary    ${SummerSetDictionary}    ELynne    ELynne
    Set To Dictionary    ${SummerSetDictionary}    ERogers    ERogers
    Set To Dictionary    ${SummerSetDictionary}    EScott    EScott
    Set To Dictionary    ${SummerSetDictionary}    EYoung    EYoung
    Set To Dictionary    ${SummerSetDictionary}    FRich    FRich
    Set To Dictionary    ${SummerSetDictionary}    GKneey    GKneey
    Set To Dictionary    ${SummerSetDictionary}    JBrewster    JBrewster
    Set To Dictionary    ${SummerSetDictionary}    JCatty    JCatty
    Set To Dictionary    ${SummerSetDictionary}    JGhosty    JGhosty
    Set To Dictionary    ${SummerSetDictionary}    JHennessy    JHennessy
    Set To Dictionary    ${SummerSetDictionary}    JJohnson    JJohnson
    Set To Dictionary    ${SummerSetDictionary}    JKness    JKness
    Set To Dictionary    ${SummerSetDictionary}    JOsaka    JOsaka
    Set To Dictionary    ${SummerSetDictionary}    JRodrigo    JRodrigo
    Set To Dictionary    ${SummerSetDictionary}    JSpade    JSpade
    Set To Dictionary    ${SummerSetDictionary}    KKohn    KKohn
    Set To Dictionary    ${SummerSetDictionary}    KLewis    KLewis
    Set To Dictionary    ${SummerSetDictionary}    KRiger    KRiger
    Set To Dictionary    ${SummerSetDictionary}    LNordman    LNordman
    Set To Dictionary    ${SummerSetDictionary}    MAbles    MAbles
    Set To Dictionary    ${SummerSetDictionary}    MPleus    MPleus
    Set To Dictionary    ${SummerSetDictionary}    NJackson    NJackson
    Set To Dictionary    ${SummerSetDictionary}    PFormance    PFormance
    Set To Dictionary    ${SummerSetDictionary}    PKelly    PKelly
    Set To Dictionary    ${SummerSetDictionary}    POsofer    POsofer
    Set To Dictionary    ${SummerSetDictionary}    PPompus    PPompus
    Set To Dictionary    ${SummerSetDictionary}    RWinters    RWinters
    Set To Dictionary    ${SummerSetDictionary}    SBear    SBear
    Set To Dictionary    ${SummerSetDictionary}    SJuan    SJuan
    Set To Dictionary    ${SummerSetDictionary}    SSewright    SSewright
    Set To Dictionary    ${SummerSetDictionary}    SSmith    SSmith
    Set To Dictionary    ${SummerSetDictionary}    STurnbull    STurnbull
    Comment    Returns a value from the given dictionary based on the given key
    ${keyValue}=    Get From Dictionary    ${SummerSetDictionary}    ${SummerSetUser}
    Log    ${keyValue}
    csodUtilInputText    ${textfieldlocator}    ${keyValue}

Select_OU_Name
    [Arguments]    ${OUName}=Assistant City Manager    # Default OU is Division
    ${OUNameTypeDictionary}=    Create Dictionary
    Comment    Adds the given key_value_pairs and items to the dictionary
    Set To Dictionary    ${OUNameTypeDictionary}    Bike Lead    Bike Lead
    Set To Dictionary    ${OUNameTypeDictionary}    Bike Officer    Bike Officer
    Set To Dictionary    ${OUNameTypeDictionary}    Bike Supervisor    Bike Supervisor
    Set To Dictionary    ${OUNameTypeDictionary}    Captain    Captain
    Set To Dictionary    ${OUNameTypeDictionary}    Fire Inspector    Fire Inspector
    Set To Dictionary    ${OUNameTypeDictionary}    Mascot    Mascot
    Comment    Returns a value from the given dictionary based on the given key
    ${keyValue}=    Get From Dictionary    ${OUNameTypeDictionary}    ${OUName}
    Log    ${keyValue}
    csodUtilInputText    ${comp_smoke_salary_str_searchfield}    ${keyValue}

csodUtilPressKey
    [Arguments]    ${locator}    ${input}
    Wait Until Keyword Succeeds    2 x    5s    Selenium2Library.Press Key    ${locator}    ${input}

Select_Browser_Window_Comp
    [Arguments]    ${Wait_For_Locator_Visible}    ${Window_Title_No_Corp}
    Sleep    3 seconds
    ${str}=    Catenate    ${Window_Title_No_Corp}    ${cfg_global_login_corp}
    Select Window    ${str}
    Wait Until Element Is Visible    ${Wait_For_Locator_Visible}    timeout=5s    error=Could not find the page.

Email_Test_Results
    ${comp_status}=    Set Variable    ${PREV_TEST_STATUS}
    ${comp_suite_name}=    Set Variable    ${SUITE_NAME}
    Send Mail With Attachment    geefung@gmail.com    popeye123    gfung@csod.com    ${comp_smoke_test_status} ${comp_suite_name} ${cfg_global_login_profile} ${comp_status}    This is the Compensation Smoketest please take the time to review the Test Suite results attached html file.    C:\\Users\\gfung\\Documents\\RobotFrameworkTeam\\CSOD_RobotFramework\\COMP\\TestResults\\report.html

Download_Excel_And_Compare_Custom_Reports
    [Arguments]    ${OriginalFile}    # Example:USD_OG1.xls
    [Documentation]    The Downloaded Excel File is always being Downloaded to the Downloads folder therefore the path for the keywords: File_Exist, Move_Files, and Wait_For_File_Removed needs to point to the Downloads default folder on your Mac or PC system.
    File_Exist    C:\\Users\\gfung\\Downloads\\*.xls
    Move_Files_Custom_Report    C:\\Users\\gfung\\Downloads\\*.xls    C:\\Users\\gfung\\.jenkins\\workspace\\COMP-Smoketest-Admin-Side\\COMP\\    ${OriginalFile}
    Wait_For_File_Removed    C:\\Users\\gfung\\Downloads\\*.xls
    Archive_Files    ${EXECDIR}\\UC-*    ${EXECDIR}\\Resources\\Uploads\\Comp_Excel_Archived_Files\\
    Archive_Files    ${EXECDIR}\\Runtime_Comp_Custom.xls    ${EXECDIR}\\Resources\\Uploads\\Comp_Excel_Archived_Files\\

Move_Files_Custom_Report
    [Arguments]    ${File1PathSource}=C:\\Users\\gfung\\Downloads\\*.xls    ${File2PathDestination}=C:\\Users\\gfung\\.jenkins\\workspace\\COMP-Smoketest-Admin-Side\\COMP\\    ${OriginalFiles}=Comp_Adj_OG.xls
    ${MovedFile}=    Move File    ${File1PathSource}    ${File2PathDestination}
    Set Test Message    ${MovedFile}    append=True
    ${str}=    Replace String    ${MovedFile}    C:\\Users\\gfung\\.jenkins\\workspace\\COMP-Smoketest-Admin-Side\\COMP\\    ${EMPTY}
    Set Test Message    ${str}    append=True
    Set Test Message    ${str}
    CompareXLCustReport.Open File Write    ${str}    Runtime_Comp_Custom.xls
    CompareXLCustReport.Excel One    ${OriginalFiles}
    CompareXLCustReport.Excel Two    Runtime_Comp_Custom.xls
    ${Result1}=    CompareXLCustReport.Open File    ${OriginalFiles}
    ${Result2}=    CompareXLCustReport.Open File    Runtime_Comp_Custom.xls
    ${Result3}=    Run Keyword And Continue On Failure    CompareXLCustReport.Compare Content    ${Result1}    ${Result2}

Select_Currency_Custom_Reports
    [Arguments]    ${CurrencyType}=GBP    # Default Currency is £ GBP
    ${COMPWageTypeDictionary}=    Create Dictionary
    Comment    Adds the given key_value_pairs and items to the dictionary
    Set To Dictionary    ${COMPWageTypeDictionary}    USD    $ USD
    Set To Dictionary    ${COMPWageTypeDictionary}    GBP    £ GBP
    Set To Dictionary    ${COMPWageTypeDictionary}    KRW    ₩ KRW
    Set To Dictionary    ${COMPWageTypeDictionary}    AUD    A$ AUD
    Set To Dictionary    ${COMPWageTypeDictionary}    EUR    € EUR
    Set To Dictionary    ${COMPWageTypeDictionary}    JPY    ¥ JPY
    Comment    Returns a value from the given dictionary based on the given key
    ${keyValue}=    Get From Dictionary    ${COMPWageTypeDictionary}    ${CurrencyType}
    Log    ${keyValue}
    csodUtilComboBox    ${report.currency_combobox}    ${keyValue}

PopupWindowComp
    ${ID_Titles}=    Get Window Titles
    Select Window    title=${ID_Titles[1]}
