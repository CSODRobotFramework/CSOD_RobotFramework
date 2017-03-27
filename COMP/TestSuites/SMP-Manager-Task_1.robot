*** Settings ***
Documentation     This is an end to end SMP Manager Task for the new ui may release 2017
...
...               *INSTRUCTIONS: To Run this dynamically add the following line to the Run tab arguments text box area.*
...
...
...               -d TestResults -v cfg_global_login_profile:autocv5qa03
...
...               *To Use with TestRail use the following:*
...
...
...               *Next Release Run*
...               -d TestResults -i SMPMGR1 -v cfg_global_login_profile:autocv5qa03 --listener TestRailListener:420
...
...
...               *Release Run*
...               -d TestResults -i SMPMGR1 -v cfg_global_login_profile:autocv5qa052 --listener TestRailListener:420
Suite Setup       Global Test Fixture Suite Setup
Suite Teardown    Global Test Fixture Suite Teardown
Test Setup        Global Test Fixture Test Setup
Test Teardown     Global Test Fixture Go To URL Teardown
Force Tags        SMPMGR1
Library           String
Library           CompareXLCustReport
Resource          ../Resources/COMP_PROJECTS/COMP_ObjectsResources.robot
Resource          ../Resources/SMP_PROJECTS/SMP_GUI_Keywords.robot
Resource          ../Resources/SMP_PROJECTS/SMP_OR/SMP_Object_Repository.robot

*** Test Cases ***
Admin_Creates_SMP_MGR_Task
    [Tags]    testrailid=30401
    Maximize Browser Window
    smp_navigate_to_succession_management
    smp_create_smp_task    SMP-Based Competency

SMP_Manager_Completes_Task
    [Tags]    testrailid=34782
    Maximize Browser Window
    smp_navigate_to_scheduled_task
    smp_current_org_step    Smokey Bear
    Utility Click Element    ${smp_save_and_continue}
    smp_overview_step
    smp_survey_step    Not so good very brittle.
    smp_metric_substep
    smp_formula_metric_substep
    smp_metric_grid_substep    ${smp_metric_grid_guy1}    ${smp_drop_guy_source}
    smp_dev_plan_substep    SB Action Step    LO-49
    smp_based_competency_task_substep    ${smp_radio_btn_1}    SB Comment Competency
