*** Settings ***
Suite Setup       Global Test Fixture Suite Setup
Suite Teardown    Global Test Fixture Suite Teardown with Email Attachment
Test Setup        Global Test Fixture Test Setup
Test Teardown     Global Test Fixture Go To URL Teardown
Metadata          Log of First Run    [first_run_log.html|first_run_log.html]
Metadata          Log of Second Run    [second_run_log.html|second_run_log.html]
Library           String
Resource          ../Resources/COMP_PROJECTS/COMP_ObjectsResources.robot

*** Test Cases ***
Compensation_Admin_Side
    [Documentation]    -d TestResults -v cfg_global_login_profile:autoqadef
    [Tags]    ADMINPHANTOM
    Maximize Browser Window
    comp_nav_to    ${comp_smoke_adjustment_guidelines}
    comp_create_new_adj_guideline    ${comp_smoke_name_value}
    comp_nav_to    ${comp_smoke_templates}
    comp_create_new_template    ${comp_smoke_name_value}
    comp_nav_to    ${comp_smoke_deferral_guidelines}
    comp_create_new_def_guideline    ${comp_smoke_name_value}
    comp_nav_to    ${comp_smoke_emp_salaries}
    comp_create_emp_salary    1200.00
    comp_nav_to    ${comp_smoke_individual_targets}
    comp_create_ind_target    1000.00
    comp_nav_to    ${comp_smoke_salary_structures}
    comp_create_salary_structures
    comp_nav_to    ${comp_smoke_Share_Price}
    comp_create_share_price
    comp_nav_to    ${comp_smoke_base_types}
    comp_create_base_types
    comp_nav_to    ${comp_smoke_bonus_types}
    comp_create_bonus_types
    comp_nav_to    ${comp_smoke_currencies}
    comp_create_currencies_edit_rates    0.6403
    comp_nav_to    ${comp_smoke_custom_fields}
    comp_create_custom_fields    ${comp_smoke_name_value}
    comp_nav_to    ${comp_smoke_custom_statements}
    comp_create_custom_statements    ${comp_smoke_name_value}
    comp_nav_to    ${comp_smoke_tags}
    comp_create_tags    APPROVER
    comp_nav_to    ${comp_smoke_tasks}
    comp_create_tasks    ${comp_smoke_name_value}    DESC    INSTR

datatimetest
    ${d}=    get time
    log    {d}
    ${d}=    Get Current Date    result_format=%m/%d/%Y
    log    {d}
    ${d} =    Add Time To Date    2014-05-28 12:05:03.111    7 days
    log    {d}

Send_Test_Results_Email
    [Tags]
    Email_Test_Results
