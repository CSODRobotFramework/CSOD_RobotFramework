*** Settings ***
Documentation     This resource file contains the configuration data for the Compensation Path keywords
Library           DateTime

*** Variables ***

*** Keywords ***
comp_nav_to
    [Arguments]    ${Compensation_AdminLink}
    csodUtilClick    ${comp_smoke_admin_tab}
    csodUtilClick    ${comp_smoke_compensation_link}
    csodUtilClick    ${Compensation_AdminLink}

comp_create_new_adj_guideline
    [Arguments]    ${adj_guideline_name}
    csodUtilClick    ${comp_smoke_create_new_adj_guideline}
    csodUtilInputText    ${comp_smoke_name}    ${adj_guideline_name}
    csodUtilComboBox    ${comp_smoke_component_type}    Base
    csodUtilComboBox    ${comp_smoke_components}    Merit Increase
    csodUtilInputText    ${comp_smoke_fromDate}    1/1/2016
    csodUtilInputText    ${comp_smoke_toDate}    12/25/2016
    csodUtilClick    ${comp_smoke_specific_type}
    csodUtilClick    ${comp_smoke_default_ou}
    csodUtilClick    ${comp_smoke_non_disc}
    csodUtilInputText    ${comp_smoke_amount_perc_txt}    5
    csodUtilClick    ${comp_smoke_save_btn}
    csodUtilClick    ${comp_smoke_adjustment_guideline_okPopup}
    Utility Sleep

comp_create_new_template
    [Arguments]    ${template_name}
    csodUtilClick    ${comp_smoke_create_template}
    csodUtilInputText    ${comp_smoke_template_name}    ${template_name}
    csodUtilComboBox    ${comp_smoke_template_type}    Base
    csodUtilClick    ${comp_smoke_add_components}
    csodUtilClick    ${comp_smoke_component_popup}
    csodUtilClick    ${comp_smoke_save_btn_popup}
    csodUtilComboBox    ${comp_smoke_budget_combobox}    Fixed Amount
    csodUtilInputText    ${comp_smoke_fixed_amount_value}    1000
    csodUtilClick    ${comp_smoke_allow_lump_sum}
    csodUtilClick    ${comp_smoke_next_and_save_btn}
    csodUtilClick    ${comp_smoke_next_and_save_btn}

comp_nav_to_subtab
    [Arguments]    ${Compensation_AdminLink}
    Wait Until Element Is Visible    ${comp_smoke_subtab_link}    timeout=10 Sec
    csodUtilClick    ${comp_smoke_subtab_link}
    csodUtilClick    ${comp_smoke_compensation_link}
    csodUtilClick    ${Compensation_AdminLink}

comp_create_new_def_guideline
    [Arguments]    ${template_name}
    csodUtilClick    ${comp_smoke_create_def_guideline}
    csodUtilInputText    ${comp_smoke_def_name}    ${template_name}
    csodUtilComboBox    ${comp_smoke_component_select}    Bonus
    csodUtilInputText    ${comp_smoke_fromDate}    1/25/2016
    csodUtilInputText    ${comp_smoke_toDate}    12/25/2016
    csodUtilComboBox    ${comp_smoke_def_avail}    All Users
    csodUtilClick    ${comp_smoke_add_all}
    csodUtilClick    ${comp_smoke_condition_popup}
    csodUtilInputText    ${comp_smoke_name_field_popup}    SALARY
    csodUtilClick    ${comp_smoke_search_popup_btn}
    csodUtilClick    ${comp_smoke_search_popup_btn}
    Utility Page Should Contain Element    ${comp_smoke_field_add_popup_btn}
    csodUtilClick    ${comp_smoke_field_add_popup_btn}
    csodUtilClick    ${comp_smoke_payoutschedule_add}
    csodUtilInputText    ${comp_smoke_method1}    Method-1
    csodUtilInputText    ${comp_smoke_method2}    Method-2
    csodUtilInputText    ${comp_smoke_eff_date}    1/20/2016
    csodUtilClick    ${comp_smoke_def_save_btn}

comp_create_emp_salary
    [Arguments]    ${Salary_Rate}
    SummerSet_Users    AAbbasi    ${comp_smoke_userid_field}
    csodUtilClick    ${comp_smoke_emp_salary_search}
    csodUtilClick    ${comp_smoke_emp_salary_edit}
    csodUtilClick    ${comp_smoke_add_salary_rate}
    Utility Sync Element    ${comp_smoke_salary_rate_input}
    csodUtilPressKey    ${comp_smoke_salary_rate_input}    ${Salary_Rate}
    csodUtilClick    ${comp_smoke_salary_rate_input}
    Utility Sync Element    ${comp_smoke_date_field}
    ${d}=    Get Time
    log    {d}
    ${d}=    Get Current Date    result_format=%m/%d/%Y
    csodUtilInputText    ${comp_smoke_date_field}    ${d}
    csodUtilClick    ${comp_smoke_emp_salary_save_icon}
    csodUtilClick    ${comp_smoke_emp_salary_back_btn}

comp_create_ind_target
    [Arguments]    ${Target_Value}
    SummerSet_Users    AAbbasi    ${comp_smoke_ind_target_userid}
    csodUtilClick    ${comp_smoke_ind_target_searchbtn}
    csodUtilClick    ${comp_smoke_edit_ind_target}
    csodUtilClick    ${comp_smoke_ind_target_addTargetBtn}
    Utility Sync Element    ${comp_smoke_ind_targets_value}
    csodUtilInputText    ${comp_smoke_ind_targets_value}    ${Target_Value}
    csodUtilClick    ${comp_smoke_ind_targets_saveimg}

comp_create_salary_structures
    Select_OU_Name    Mascot
    csodUtilClick    ${comp_smoke_emp_salary_search}
    csodUtilClick    ${comp_smoke_def_save_btn}

comp_create_share_price
    csodUtilClick    ${comp_smoke_add_shareprice}
    csodUtilInputText    ${comp_smoke_shareprice_txt}    39.50
    csodUtilClick    ${comp_smoke_shareprice_saveimg}

comp_create_base_types
    csodUtilClick    ${comp_smoke_base_types_edit}
    csodUtilClick    ${comp_smoke_base_types_saveimg}

comp_create_bonus_types
    csodUtilClick    ${comp_smoke_bonus_types_edit}
    csodUtilClick    ${comp_smoke_bonus_types_cancel}

comp_create_currencies_edit_rates
    [Arguments]    ${RateAmount}
    Utility Page Should Contain Element    ${comp_smoke_currencies_editRate}
    csodUtilClick    ${comp_smoke_currencies_editRate}
    Utility Page Should Contain Element    ${comp_smoke_currencies_new_rate}
    csodUtilInputText    ${comp_smoke_currencies_new_rate}    ${RateAmount}
    csodUtilClick    ${comp_smoke_currencies_saveRateBtn}

comp_create_custom_fields
    [Arguments]    ${CustomFieldName}
    csodUtilClick    ${comp_smoke_custom_field_addlink}
    csodUtilInputText    ${comp_smoke_custom_field_title}    ${CustomFieldName}
    csodUtilComboBox    ${comp_smoke_custom_field_types_combobox}    Date Field
    csodUtilComboBox    ${comp_smoke_custom_fields_select_criteria}    All Users
    csodUtilClick    ${comp_smoke_custom_field_add_btn}
    csodUtilClick    ${comp_smoke_custom_field_save}

comp_create_custom_statements
    [Arguments]    ${Custom_Statement_Field_Name}
    csodUtilClick    ${comp_smoke_cust_stmts_createlink}
    csodUtilInputText    ${comp_smoke_cust_stmts_name_field}    ${Custom_Statement_Field_Name}
    csodUtilClick    ${comp_smoke_AddSectionbtn}
    csodUtilClick    ${comp_smoke_cust_stmts_design_mode}
    csodUtilClick    ${comp_smoke_cust_stmts_rad_editor}
    csodUtilPressKey    ${comp_smoke_cust_stmts_rad_editor}    ${Custom_Statement_Field_Name}
    csodUtilClick    ${comp_smoke_cust_stmts_add_cond}
    csodUtilClick    ${comp_smoke_cust_stmts_condition_addBtn}
    csodUtilClick    ${comp_smoke_cust_stmts_saveBtn}
    csodUtilClick    ${comp_smoke_cust_stmts_save_stmt}

comp_create_tags
    [Arguments]    ${Tag_Name}
    csodUtilInputText    ${comp_smoke_tag_name_field}    ${Tag_Name}
    csodUtilClick    ${comp_smoke_tags_btnSearch}
    Utility Element Should Contain    ${comp_smoke_tags_verify_tag_amount}
    csodUtilClick    ${comp_smoke_tags_collapse}
    csodUtilClick    ${comp_smoke_tags_backBtn}

comp_create_tasks
    [Arguments]    ${Task_Name}    ${Task_Desc}    ${Task_Inst}
    csodUtilClick    ${comp_smoke_tasks_create_comp_plan}
    csodUtilInputText    ${comp_smoke_tasks_txtTitle}    ${Task_Name}
    csodUtilInputText    ${comp_smoke_tasks_desc}    ${Task_Desc}
    csodUtilInputText    ${comp_smoke_tasks_inst}    ${Task_Inst}
    csodUtilInputText    ${comp_smoke_tasks_FromTaskPeriod}    1/20/2020
    csodUtilInputText    ${comp_smoke_tasks_ToTaskPeriod}    12/30/2020
    csodUtilInputText    ${comp_smoke_tasks_FromCompPeriod}    1/20/2008
    csodUtilInputText    ${comp_smoke_tasks_ToCompPeriod}    12/30/2008
    csodUtilClick    ${comp_smoke_tasks_add_base_template}
    csodUtilClick    ${comp_smoke_tasks_addButton}
    Utility Page Should Contain Element    ${comp_smoke_tasks_baseEffdate}
    csodUtilInputText    ${comp_smoke_tasks_baseEffdate}    1/1/2009
    csodUtilInputText    ${comp_smoke_tasks_StatementDate}    1/2/2021
    csodUtilClick    ${comp_smoke_tasks_btnNext}
    csodUtilComboBox    ${comp_smoke_tasks_select_criteria}    Division
    Utility Page Should Contain Element    ${comp_smoke_tasks_searchimg}
    csodUtilClick    ${comp_smoke_tasks_searchimg}
    PopupWindowOU
    Select_Browser_Window_Comp    ${comp_smoke_tasks_btnNext}    title=Realize Your Potential:
    csodUtilClick    ${comp_smoke_tasks_btnNext}
    Utility Page Should Contain Element    ${comp_smoke_tasks_btnNext}
    csodUtilClick    ${comp_smoke_tasks_btnNext}
    Utility Page Should Contain Element    ${comp_smoke_tasks_SelectApprovals}
    csodUtilClick    ${comp_smoke_tasks_SelectApprovals}
    Utility Page Should Contain Element    ${comp_smoke_tasks_mgr_approver}
    csodUtilClick    ${comp_smoke_tasks_mgr_approver}
    Utility Page Should Contain Element    ${comp_smoke_tasks_approval_doneBtnPopup}
    Utility Sleep
    csodUtilClick    ${comp_smoke_tasks_approval_doneBtnPopup}
    Utility Page Should Contain Element    ${comp_smoke_tasks_approver_mgr_nametext}
    Utility Page Should Contain Element    ${comp_smoke_tasks_btnNext}
    csodUtilClick    ${comp_smoke_tasks_btnNext}
    csodUtilClick    ${comp_smoke_tasks_saveBtn}

comp_nav_to_with_should_contain_ele
    [Arguments]    ${Compensation_AdminLink}
    Sleep    2s
    Utility Element Should Contain    ${comp_smoke_admin_tab}
    csodUtilClick    ${comp_smoke_admin_tab}
    csodUtilClick    ${comp_smoke_compensation_link}
    csodUtilClick    ${Compensation_AdminLink}
