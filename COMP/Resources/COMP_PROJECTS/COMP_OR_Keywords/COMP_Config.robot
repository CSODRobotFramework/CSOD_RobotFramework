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
    csodUtilInputText    ${comp_smoke_salary_rate_input}    ${Salary_Rate}
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
