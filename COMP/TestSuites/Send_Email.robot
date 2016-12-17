*** Settings ***
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/COMP_Smoketest_OR.robot    # Test Teardown | Global Test Fixture Test Teardown
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/CSOD_Locators.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/CSOD_Keywords.robot
Resource          ../Resources/COMP_PROJECTS/Global/GlobalKeywords.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/COMP_Config.robot
Library           GmailEmailLibrary
Resource          ../../../SMP-API-Talent_Pool/COMP/Resources/SMP_PROJECTS/SMP_OR/SMP_Object_Repository.robot

*** Test Cases ***
Send Email Has Attachment Test
    Comment    Send Mail With Attachment    geeslimmy@gmail.com    popeye123    geefung@gmail.com    Python Email Test    This is python test
    ...    C:\\Users\\gfung\\.jenkins\\workspace\\COMP\\report.html
    Comment    Send Mail With Attachment    geeslimmy@gmail.com    popeye123    gfung@csod.com    Python Email Test    This is python test
    ...    C:\\Users\\gfung\\.jenkins\\workspace\\COMP\\report.html
    Send Mail With Attachment    geefung@gmail.com    popeye123    gfung@csod.com    SMP TEST SUITE API:    This is the SMP API Test Suite please take the time to review the Test Suite results    C:\\Users\\gfung\\.jenkins\\\workspace\\COMP-Smoketest-Admin-Side\\COMP\\TestResults\\report.html

Send Email No Attachment Test
    Send Mail No Attachment    geeslimmy@gmail.com    popeye123    geefung@gmail.com    This is a test, this is a test    Test is in progress
