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
...               -d TestResults -i SMPMGR1 -v cfg_global_login_profile:autocv5qa03 --listener TestRailListener:420
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
SMP_Manager_Completes_Task-TEST
    Maximize Browser Window
    smp_navigate_to_scheduled_task
