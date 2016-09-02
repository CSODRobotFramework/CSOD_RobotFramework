*** Settings ***
Documentation     To Run this dynamically add the following line to the Run tab arguments text box area.
...
...
...               -d TestResults -i COMPCUSTREP -v cfg_global_login_profile:autoqadef
Suite Setup       Global Test Fixture Suite Setup
Suite Teardown    Global Test Fixture Suite Teardown with Email Attachment    # Global Test Fixture Suite Teardown with Email Attachment
Test Setup        Global Test Fixture Test Setup
Test Teardown     Global Test Fixture Go To URL Teardown    #Global Test Fixture Go To URL Teardown
Metadata          Log of First Run    [first_run_log.html|first_run_log.html]
Metadata          Log of Second Run    [second_run_log.html|second_run_log.html]
Library           String
Resource          ../Resources/COMP_PROJECTS/COMP_ObjectsResources.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/COMP_Custom_Report_OR.robot
Library           CompareXLCustReport

*** Test Cases ***
Comp_Cust_Report_Static_Report_GBP
    [Documentation]    This is the workflow for testing compensation custom report using GBP currency.
    ...
    ...    To run this Test alone please use GBP in the Run tab 'Only run tests with these tags' area. Optionally you can provide more than one tag like GBP, JPY
    [Tags]    COMPCUSTREP    GBP
    Maximize Browser Window
    comp_nav_to_cust_report    UC-001: 16.03 Standard Planning Use Case - 3
    comp_refresh_processed    ${report.last_run}
    comp_export_excel    UC-001: 16.03 Standard Planning Use Case - 3    1 sec
    Download_Excel_And_Compare_Custom_Reports    Comp_Custom_GBP_OG.xls

Comp_Cust_Report_Static_Report_JPY
    [Documentation]    This is the workflow for testing compensation custom report using JPY currency.
    ...
    ...    To run this Test alone please use GBP in the Run tab 'Only run tests with these tags' area. Optionally you can provide more than one tag like GBP, JPY
    [Tags]    COMPCUSTREP    JPY
    Maximize Browser Window
    comp_nav_to_cust_report_for_edit    UC-001: 16.03 Standard Planning Use Case - 3    50 sec
    comp_refresh_processed    ${report.last_run}
    comp_edit_after_processed    UC-001: 16.03 Standard Planning Use Case - 3    JPY
    comp_export_excel_click_twice    UC-001: 16.03 Standard Planning Use Case - 3    1 sec
    Download_Excel_And_Compare_Custom_Reports    Comp_Custom_JPY_OG.xls

Comp_Cust_Report_Static_Report_USER
    [Documentation]    This is the workflow for testing compensation custom report using USER currency.
    ...
    ...    To run this Test alone please use GBP in the Run tab 'Only run tests with these tags' area. Optionally you can provide more than one tag like GBP, JPY
    [Tags]    COMPCUSTREP    USER
    Maximize Browser Window
    comp_nav_to_cust_report_for_edit    UC-001: 16.03 Standard Planning Use Case - 3    40 sec
    comp_refresh_processed    ${report.last_run}
    comp_edit_to_users_currency    UC-001: 16.03 Standard Planning Use Case - 3    USER
    comp_export_excel    UC-001: 16.03 Standard Planning Use Case - 3    1 sec
    Download_Excel_And_Compare_Custom_Reports    Comp_Custom_USER_OG.xls

Comp_Cust_Report_Static_Report_RESET
    [Documentation]    This is the workflow for testing compensation custom report using RESET currency.
    ...
    ...    To run this Test alone please use GBP in the Run tab 'Only run tests with these tags' area. Optionally you can provide more than one tag like GBP, JPY
    [Tags]    COMPCUSTREP    RESET
    Maximize Browser Window
    comp_nav_to_cust_report_for_edit    UC-001: 16.03 Standard Planning Use Case - 3    40 sec
    comp_refresh_processed    ${report.last_run}
    comp_edit_to_reset_currency    UC-001: 16.03 Standard Planning Use Case - 3
