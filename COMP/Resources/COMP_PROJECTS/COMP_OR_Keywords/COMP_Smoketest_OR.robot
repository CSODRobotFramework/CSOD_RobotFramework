*** Variables ***
${comp_smoke_admin_tab}    xpath=//label[.='Admin']    #css=label[id*='ctl10']
${comp_smoke_compensation_link}    xpath=//a[.='Compensation']//self::a[@title='Compensation']
${comp_smoke_adjustment_guidelines}    css=div a[title='Adjustment Guidelines']
${comp_smoke_create_new_adj_guideline}    css=span.text
${comp_smoke_name}    id=ctl00_ContentPlaceHolder1_matrixName
${comp_smoke_name_value}    Comp_Smoketest
${comp_smoke_component_type}    id=ctl00_ContentPlaceHolder1_templateSelect
${comp_smoke_component_value}    css=option[value="1"]
${comp_smoke_components}    id=ctl00_ContentPlaceHolder1_componentSelect
${comp_smoke_components_value}    xpath=//option[.='Merit Increase']
${comp_smoke_fromDate}    id=ctl00_ContentPlaceHolder1_fromDate_textboxDate
${comp_smoke_toDate}    id=ctl00_ContentPlaceHolder1_toDate_textboxDate
${comp_smoke_specific_amount}    id=ctl00_ContentPlaceHolder1_adjustmentSpecific
${comp_smoke_ouType}    id=ctl00_ContentPlaceHolder1_ouType
${comp_smoke_select_criteria}    id=ctl00_ContentPlaceHolder1_userFilter_OrgUnitTypeList
${comp_smoke_specific_type}    id=ctl00_ContentPlaceHolder1_adjustmentSpecific
${comp_smoke_ou_search_img}    css=#selectOrgUnitHref > img
${comp_smoke_name_field}    id=NameField
${comp_smoke_wagetype}    id=ctl00_ContentPlaceHolder1_wageType
${comp_smoke_non_disc}    id=ctl00_ContentPlaceHolder1_nonDiscretionary
${comp_smoke_default_ou}    id=ctl00_ContentPlaceHolder1_defaultType
${comp_smoke_amount_perc_txt}    id=ctl00_ContentPlaceHolder1_specificAmountPercentTxt
${comp_smoke_save_btn}    id=ctl00_ContentPlaceHolder1_submit
${comp_smoke_templates}    css=div a[title='Compensation Templates']
${comp_smoke_create_template}    id=ctl00_ContentPlaceHolder1_AddTemplate
