*** Settings ***
Documentation     This Suite is for running Test Cases on SauceLabs
Test Setup        Global Open Application with SauceLabs
Test Teardown     Test Tear Down
Resource          ../Resources/COMP_PROJECTS/COMP_ObjectsResources.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/CSOD_Locators.robot
Library           CompareXL
Library           OperatingSystem
Library           String
Library           Collections
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/CSOD_Keywords.robot

*** Test Cases ***
COMP_BDD_Adj_Report_Sauce_GBP
    [Tags]    COMPSAUCE
    Login_Page    QA052-AUTO-COMP2    ssmith    popeye123
    Navigate_To_Report
    Select_Task_And_Criteria    All employees    GBP
    Download_Excel_And_Compare    GBP_OG1.xls
