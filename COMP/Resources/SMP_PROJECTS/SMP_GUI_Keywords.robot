*** Keywords ***
smp_navigate_to_succession_management
    smp_url_concatenate    ${smp_succession_mgmt_url}
    Comment    Utility Click Element    ${comp_smoke_admin_tab}
    Comment    Utility Click Element    ${smp_succession_management}
    Utility Click Element    ${smp_tasks_link}
    Utility Wait Until Element Is Visible    ${smp_add_smp_task_link}
    Utility Click Element    ${smp_add_smp_task_link}

smp_create_smp_task
    [Arguments]    ${SMP_TEMPLATE_NAME}
    [Documentation]    *smp_create_smp_task*
    ...
    ...    Arguments:
    ...
    ...    ${SMP_TASK_TITLE}
    ...    ${SMP_TASK_DESC}
    ...    ${SMP_TEMPLATE_NAME}
    ...    ${SMP_PLAN_TYPE}
    ...    ${SMP_INC_COMP_TASK}
    ${smp_date_stamp}=    Utility Get Date Time Stamp
    Set Suite Variable    ${smp_date_stamp}    ${smp_date_stamp}
    csodUtilInputText    ${smp_task_title}    SMP_NEW_UI_MGR_1_${smp_date_stamp}
    csodUtilInputText    ${smp_task_desc}    SMP_NEW_UI_DESC_${smp_date_stamp}
    Utility Cal Handler    ${smp_from_datefield}
    Utility Cal Handler Plus Number    ${smp_to_datefield}
    smp_select_plan_type
    Utility Click Element    ${smp_search_template_btn}
    Utility Input Text    ${smp_by_name_field_input}    ${SMP_TEMPLATE_NAME}
    Utility Sleep
    Utility Click Element If Exist    ${smp_search_link}
    Utility Sleep
    Utility Click Element If Exist    ${smp_template_name_link}
    Comment    Utility Click Element    ${smp_prepopulate_task_chkbox}
    Utility Click Element    ${smp_display_inactive_successors}
    Utility Click Element    ${smp_incorporate_comptency_task}
    smp_search_competency_based_task_popup    *M-25:
    Select_Browser_Window_Comp    ${smp_next_button}    Realize Your Potential:
    Utility Click Element If Exist    ${smp_next_button}
    smp_create_smp_task_avail_page
    Select_Browser_Window_Comp    ${smp_next_button}    Realize Your Potential:
    Utility Click Element If Exist    ${smp_next_button}
    Utility Sleep    2s
    smp_co_planners    mables
    Utility Click Element If Exist    ${smp_next_button}
    Utility Sleep    2s
    Utility Click Element If Exist    ${smp_next_button}
    Utility Sleep    2s
    Utility Click Element If Exist    ${smp_datatag_save_btn}
    Utility Sleep    2s
    csodUtilInputText    ${smp_task_admin_name_field_input}    SMP_NEW_UI_MGR_1_${smp_date_stamp}
    Utility Click Element    ${smp_task_admin_search_btn}
    smp_refresh_admin_page
    Go To    ${cfg_global_login_url}
    Comment    Global Logout
    Set Suite Variable    ${cfg_global_login_username}    pkelly

smp_select_plan_type
    [Arguments]    ${SMPTaskType}=SMP Manager Task    # Default Plan Type is SMP Manager Task
    [Documentation]    *Plan type arguments: *
    ...    SMP Manager Task
    ...    SMP Assessor Task
    ...    SMP Job Pool Task
    ...    SMP Talent Conference Task
    ...
    ...    NOTE: The default argument if nothing is used will be SMP Manager Task
    ${SMPPlanTypeDictionary}=    Create Dictionary
    Comment    Adds the given key_value_pairs and items to the dictionary
    Set To Dictionary    ${SMPPlanTypeDictionary}    SMP Manager Task    SMP Manager Task
    Set To Dictionary    ${SMPPlanTypeDictionary}    SMP Assessor Task    SMP Assessor Task
    Set To Dictionary    ${SMPPlanTypeDictionary}    SMP Job Pool Task    SMP Job Pool Task
    Set To Dictionary    ${SMPPlanTypeDictionary}    SMP Talent Conference Task    SMP Talent Conference Task
    Comment    Returns a value from the given dictionary based on the given key
    ${keyValue}=    Get From Dictionary    ${SMPPlanTypeDictionary}    ${SMPTaskType}
    Log    ${keyValue}
    csodUtilComboBox    ${smp_plan_type}    ${keyValue}

smp_search_competency_based_task_popup
    [Arguments]    ${smp_competency_based_task_title}
    Utility Sleep    1s
    ${ID_Titles}=    Get Window Titles
    Select Window    title=${ID_Titles[1]}
    Utility Input Text    ${smp_title_comp_based_task}    ${smp_competency_based_task_title}
    Utility Click Element    ${smp_search_button}
    Utility Click Element If Exist    ${smp_task_name_link}

smp_create_smp_task_avail_page
    [Arguments]    ${OU_Criteria}=Division
    Utility Wait Until Element Is Visible    ${smp_availability}
    csodUtilComboBox    ${smp_availability}    ${OU_Criteria}
    Utility Wait Until Element Is Visible    ${smp_search_ou_button}
    Utility Click Element    ${smp_search_ou_button}
    smp_search_ou_popup    Fire

smp_create_smp_task_filter_avail_page
    [Arguments]    ${OU_Criteria}=Division
    Utility Wait Until Element Is Visible    ${smp_availability}
    csodUtilComboBox    ${smp_filter}    ${OU_Criteria}
    Utility Click Element If Exist    ${smp_next_button}

smp_search_ou_popup
    [Arguments]    ${OU_Title}
    ${ID_Url}=    Get Window Names
    Select Window    name=Search
    Maximize Browser Window
    Wait Until Element Is Visible    ${smp_namefield_popup}    timeout=10 Sec
    Utility Input Text    ${smp_namefield_popup}    ${OU_Title}
    Utility Click Element    ${smp_select_ou_searchPopup_btn}
    Utility Click Element    ${smp_add_btn_popup}
    Utility Click Element    ${smp_done_btn_popup}

smp_co_planners
    [Arguments]    ${smp_default_coplannername}
    Utility Click Element    ${smp_select_coplanners}
    Utility Click Element    ${smp_add_default_coplanner}
    smp_add_coPlanner_Avail    All Users
    Utility Sleep    3s
    Utility Click Element If Visible    ${smp_add_btn_coplanner_popup}
    Utility Sleep    2s
    Utility Click Element If Visible    ${smp_add_coplanner_btn_popup}
    Utility Wait Until Element Is Visible    ${smp_id_field_popup}
    Utility Input Text    ${smp_id_field_popup}    ${smp_default_coplannername}
    Utility Click Element    ${smp_datatag_search_btn}
    Utility Sleep    2s
    Utility Click Element If Visible    ${smp_datatag_name_link}
    Utility Sleep    1s
    Utility Click Element If Visible    ${smp_add_btn_coplanner_popup}
    Utility Click Element If Visible    ${smp_datatag_save_btn}

smp_add_coPlanner_Avail
    [Arguments]    ${OU_AVAIL_POPUP}
    ${SMPAddCoPlannerDictionary}=    Create Dictionary
    Comment    Adds the given key_value_pairs and items to the dictionary
    Set To Dictionary    ${SMPAddCoPlannerDictionary}    All employees    All employees
    Set To Dictionary    ${SMPAddCoPlannerDictionary}    All Users    All Users
    Set To Dictionary    ${SMPAddCoPlannerDictionary}    Division    Division
    Set To Dictionary    ${SMPAddCoPlannerDictionary}    Position    Position
    Set To Dictionary    ${SMPAddCoPlannerDictionary}    Grade    Grade
    Set To Dictionary    ${SMPAddCoPlannerDictionary}    Cost Center    Cost Center
    Set To Dictionary    ${SMPAddCoPlannerDictionary}    Location    Location
    Set To Dictionary    ${SMPAddCoPlannerDictionary}    Group    Group
    Set To Dictionary    ${SMPAddCoPlannerDictionary}    Users    Users
    Comment    Returns a value from the given dictionary based on the given key
    ${keyValue}=    Get From Dictionary    ${SMPAddCoPlannerDictionary}    ${OU_AVAIL_POPUP}
    Log    ${keyValue}
    csodUtilComboBox    ${smp_avaiability_list_popup}    ${keyValue}

smp_task_review_page
    [Arguments]    ${smp_task_review_name}    ${smp_task_review_desc}

smp_task_admin_search_status
    [Arguments]    ${smp_task_name}

smp_refresh_admin_page
    : FOR    ${INDEX}    IN RANGE    1    25
    \    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Contain    ${smp_task_status}    Not Started
    \    log    ${INDEX}
    \    log    ${status}
    \    Utility Sleep    1s
    \    Utility Click Element    ${smp_task_admin_search_btn}
    \    Exit For Loop If    '${status}'=='PASS'

smp_navigate_to_scheduled_task
    smp_url_concatenate    ${smp_scheduled_task_url}
    Utility Input Text    ${smp_search_task_input}    ${smp_date_stamp}
    Utility Click Element    ${scheduled_task_search_btn}
    Utility Sleep    2s
    Utility Click Element    ${smp_scheduled_task_link}

smp_current_org_step
    [Arguments]    ${FULLNAME}
    Utility Wait Until Element Is Visible    ${smp_fullname_textsearch}
    Utility Input Text    ${smp_fullname_textsearch}    ${FULLNAME}
    Comment    Utility Click Element    ${smp_current_org_search_btn}
    Comment    Utility Wait Until Element Is Visible    ${smp_include_chkbox}
    Comment    Utility Click Element    ${smp_include_chkbox}
    smp_options_and_coplanner    mables

smp_refresh_admin_try
    : FOR    ${INDEX}    IN RANGE    1    25
    \    ${status}    ${value}=    Run Keyword And Ignore Error    Element Should Contain    ${smp_task_status}    Not Started
    \    log    ${INDEX}
    \    log    ${status}
    \    Utility Sleep    1s
    \    Utility Click Element    ${smp_task_admin_search_btn}
    \    Run Keyword If    '${status}'=='PASS'    Element Should Contain    ${smp_task_status}    Not Started    Exit For Loop

smp_task_navigation

smp_url_concatenate
    [Arguments]    ${Url_String}
    ${str1}=    Catenate    SEPARATOR=    ${cfg_global_login_url}    ${Url_String}
    Go to    ${str1}

smp_options_and_coplanner
    [Arguments]    ${coplanner_name}
    Utility Click Element    ${smp_options_btn_dropdown}

smp_overview_step
    Utility Wait Until Element Is Visible    ${smp_overview_desc}
    Utility Page Should Contain Element    ${smp_overview_desc}
    Utility Click Element    ${smp_save_and_continue}

smp_survey_step
    [Arguments]    ${smp_survey_question1}
    Utility Wait Until Element Is Visible    ${smp_survey_testbox_iframe}
    Select Frame    ${smp_survey_testbox_iframe}
    Utility Sleep    2s
    Utility Input Text    ${smp_inside_iframe}    ${smp_survey_question1}
    Unselect Frame
    Utility Click Element    ${smp_save_and_continue}

smp_metric_substep
    Utility Wait Until Element Is Visible    ${smp_overall_progress}
    Utility Page Should Contain Element    ${smp_overall_progress}
    Utility Wait Until Element Is Visible    ${smp_save_and_continue}
    Utility Click Element    ${smp_save_and_continue}
    Utility Sleep    2s
    Utility Page Should Contain Element    ${smp_validation_field}
    Utility Click Element    ${smp_rating_scale_metric1}
    Utility Sleep    2s
    Utility Click Element    ${smp_2_Rating}
    Utility Sleep    1s
    Utility Click Element    ${smp_rating_scale_metric2}
    Utility Click Element    ${smp_2_Rating}
    Utility Sleep    1s
    Utility Click Element    ${smp_save_and_continue}

smp_formula_metric_substep
    Utility Wait Until Element Is Visible    ${smp_calc_metric}
    Utility Click Element    ${smp_calc_metric}
    Utility Sleep    2s
    Utility Page Should Contain Element    ${smp_verify_formula_metric_calc}
    smp_comments_substep    Comment for SB.

smp_comments_substep
    [Arguments]    ${CommentsSubStep}
    Utility Wait Until Element Is Visible    ${smp_subtask_iframe}
    Select Frame    ${smp_subtask_iframe}
    Utility Sleep    2s
    Utility Input Text    ${smp_inside_iframe}    ${CommentsSubStep}
    Unselect Frame
    Utility Click Element    ${smp_save_and_continue}

smp_metric_grid_substep
    [Arguments]    ${smp_target_drag}    ${smp_source_drop}
    Utility Wait Until Element Is Visible    ${smp_target_drag}
    Drag And Drop    ${smp_target_drag}    ${smp_source_drop}
    Utility Sleep    3s
    smp_comments_substep    Comment for SB Metric Grid.
    Utility Click Element    ${smp_save_and_continue}

smp_dev_plan_substep
    [Arguments]    ${ActionStepName}    ${SearchTraining}
    Utility Click Element If Visible    ${smp_add_action_step}
    Utility Sleep    3s
    Utility Input Text    ${smp_add_action_step_text}    ${ActionStepName}
    Utility Click Element    ${smp_add_action_save_btn}
    Utility Sleep    2s
    Utility Click Element If Visible    ${smp_add_training_btn}
    Utility Sleep    2s
    Utility Input Text    ${smp_search_training_input}    ${SearchTraining}
    Utility Click Element    ${smp_search_training_srch_btn}
    Utility Sleep    4s
    Utility Click Element    ${smp_search_training_chkbox}
    Utility Sleep    2s
    Utility Click Element If Visible    ${smp_add_selected_btn}
    Utility Sleep    2s
    Utility Click Element If Visible    ${smp_update_primaryPlan_btn}
    Utility Click Element If Visible    ${smp_yes_update_primary_btn}
    Utility Sleep    2s
    Utility Click Element    ${smp_save_and_continue}
    Utility Sleep    3s

smp_based_competency_task_substep
    [Arguments]    ${smp_based_comp_score}    ${smp_based_comp_comments}
    Utility Click Element If Visible    ${smp_save_and_continue}
    Utility Sleep    3s
    Utility Page Should Contain Element    ${smp_validation_field}
    Utility Click Element If Exist    ${smp_based_comp_score}
    Utility Sleep    2s
    Utility Click Element    ${smp_competencyItem_comment}
    Utility Sleep    3s
    Utility Wait Until Element Is Visible    ${smp_competency_textbox_iframe}
    Select Frame    ${smp_competency_textbox_iframe}
    Utility Sleep    2s
    Utility Input Text    ${smp_inside_iframe}    ${smp_based_comp_comments}
    Unselect Frame
    Utility Click Element    ${smp_save_and_continue}
