*** Settings ***
Documentation     This resource file contains the configuration data for the Compensation Path keywords

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
    csodUtilInputText    ${comp_smoke_fromDate}    12/25/1980
    csodUtilInputText    ${comp_smoke_toDate}    12/25/1988
    csodUtilClick    ${comp_smoke_specific_type}
    Comment    csodUtilClick    ${comp_smoke_ouType}
    Comment    Select_Criteria
    Comment    csodUtilClick    ${comp_smoke_ou_search_img}
    Comment    PopupWindowOU
    csodUtilClick    ${comp_smoke_default_ou}
    Comment    csodUtilComboBox    ${comp_smoke_wagetype}    Annual: en-US
    csodUtilClick    ${comp_smoke_non_disc}
    csodUtilInputText    ${comp_smoke_amount_perc_txt}    5
    csodUtilClick    ${comp_smoke_save_btn}

comp_create_new_template
    [Arguments]    ${adj_guideline_name}
    csodUtilClick    ${comp_smoke_create_new_adj_guideline}
    csodUtilInputText    ${comp_smoke_name}    ${adj_guideline_name}
    csodUtilComboBox    ${comp_smoke_component_type}    Base
    csodUtilComboBox    ${comp_smoke_components}    Merit Increase
    csodUtilInputText    ${comp_smoke_fromDate}    12/25/1980
    csodUtilInputText    ${comp_smoke_toDate}    12/25/1988
    csodUtilClick    ${comp_smoke_specific_type}
    Comment    csodUtilClick    ${comp_smoke_ouType}
    Comment    Select_Criteria
    Comment    csodUtilClick    ${comp_smoke_ou_search_img}
    Comment    PopupWindowOU
    csodUtilClick    ${comp_smoke_default_ou}
    Comment    csodUtilComboBox    ${comp_smoke_wagetype}    Annual: en-US
    csodUtilClick    ${comp_smoke_non_disc}
    csodUtilInputText    ${comp_smoke_amount_perc_txt}    5
    csodUtilClick    ${comp_smoke_save_btn}
