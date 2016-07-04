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
    csodUtilClick    ${comp_smoke_component_type}
    csodUtilClick    ${comp_smoke_component_value}
    csodUtilClick    ${comp_smoke_components}
    csodUtilClick    ${comp_smoke_components_value}
