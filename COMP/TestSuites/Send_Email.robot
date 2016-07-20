*** Settings ***
Test Teardown     Global Test Fixture Test Teardown
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/COMP_Smoketest_OR.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/CSOD_Locators.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/CSOD_Keywords.robot
Resource          ../Resources/COMP_PROJECTS/Global/GlobalKeywords.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/COMP_Config.robot
Library           GmailEmailLibrary

*** Test Cases ***
Send Email Has Attachment Test
    Comment    Send Mail With Attachment    geeslimmy@gmail.com    popeye123    geefung@gmail.com    Python Email Test    This is python test
    ...    C:\\Users\\gfung\\.jenkins\\workspace\\COMP\\report.html
    Comment    Send Mail With Attachment    geeslimmy@gmail.com    popeye123    gfung@csod.com    Python Email Test    This is python test
    ...    C:\\Users\\gfung\\.jenkins\\workspace\\COMP\\report.html
    Send Mail With Attachment    geefung@gmail.com    popeye123    gfung@csod.com    ${comp_status} ${comp_smoke_test_status}    This is the Compensation Smoketest please take the time to review the Test Suite results    C:\\Users\\gfung\\.jenkins\\workspace\\COMP\\TestResults\\report.html

Send Email No Attachment Test
    Send Mail No Attachment    geeslimmy@gmail.com    popeye123    geefung@gmail.com    This is a test, this is a test    Test is in progress
