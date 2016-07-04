*** Settings ***
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/COMP_Smoketest_OR.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/CSOD_Locators.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/CSOD_Keywords.robot
Resource          ../Resources/COMP_PROJECTS/Global/GlobalKeywords.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/COMP_Config.robot

*** Test Cases ***
Compensation_Admin_Side
    [Tags]    ADMINPHANTOM
    Open Browser    https://qa01.csod.com/    chrome
    Maximize Browser Window
    Login_Page    QA012-AUTO-QADEF2    JHennessy    popeye123
    comp_nav_to    ${comp_smoke_adjustment_guidelines}
    comp_create_new_adj_guideline    ${comp_smoke_name_value}
