*** Settings ***
Suite Setup       Global Test Fixture Suite Setup
Suite Teardown    Global Test Fixture Suite Teardown with Email Attachment
Test Setup        Global Test Fixture Test Setup
Test Teardown     Global Test Fixture Go To URL Teardown
Metadata          Log of First Run    [first_run_log.html|first_run_log.html]
Metadata          Log of Second Run    [second_run_log.html|second_run_log.html]
Library           String
Resource          ../Resources/COMP_PROJECTS/COMP_ObjectsResources.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/COMP_Custom_Report_OR.robot

*** Test Cases ***
Comp_Cust_Report_Static_Report
    [Tags]    COMPCUSTREP
    Maximize Browser Window
    comp_nav_to_cust_report    CO-Planners (copy)
