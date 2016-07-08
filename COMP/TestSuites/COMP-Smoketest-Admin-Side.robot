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
