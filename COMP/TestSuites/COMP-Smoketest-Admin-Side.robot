*** Settings ***
Suite Setup       Global Test Fixture Suite Setup
Suite Teardown    Global Test Fixture Suite Teardown
Test Setup        Global Test Fixture Test Setup
Test Teardown     Global Test Fixture Test Teardown
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/COMP_Smoketest_OR.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/CSOD_Locators.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/CSOD_Keywords.robot
Resource          ../Resources/COMP_PROJECTS/Global/GlobalKeywords.robot
Resource          ../Resources/COMP_PROJECTS/COMP_OR_Keywords/COMP_Config.robot
Library           GmailEmailLibrary

*** Test Cases ***
Compensation_Admin_Side
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
    Comment    Utility Email Report

datatimetest
    ${d}=    get time
    log    {d}
    ${d}=    Get Current Date    result_format=%m/%d/%Y
    log    {d}
    ${d} =    Add Time To Date    2014-05-28 12:05:03.111    7 days
    log    {d}
