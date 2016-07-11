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
${comp_smoke_subtab_link}    xpath=//a[.='Compensation'][1]
${comp_smoke_template_name}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_templateName
${comp_smoke_template_type}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_templateType
${comp_smoke_add_components}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_shBudgets_componentAdd
${comp_smoke_component_popup}    id=tdComponent_1    # xpath=//td[.='Merit Increase'][1]//preceding::a[1]
${comp_smoke_save_btn_popup}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_compControl_dlgComponent_saveBtn
${comp_smoke_budget_combobox}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_budgetRepeater_ctl01_budgetType
${comp_smoke_fixed_amount_value}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_budgetRepeater_ctl01_amount
${comp_smoke_allow_lump_sum}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_allowLumpSum
${comp_smoke_next_and_save_btn}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_submitBtn
${comp_smoke_available_field1}    xpath=//span[.='Available fields']/following::span[.='Bi-Weekly: en-US'][1]    # xpath=//span[.='Available fields']/following::span[.='Bi-Weekly: en-US'][1]
${comp_smoke_move_rt_top}    css=.rlbMoveFieldsRight.CsImageButton.wdt-lf
${comp_smoke_deferral_guidelines}    css=div a[title='Deferral Guidelines']
${comp_smoke_create_def_guideline}    id=ctl00_ContentPlaceHolder1_btnCreateGuideline
${comp_smoke_def_name}    id=ctl00_ContentPlaceHolder1_txtName
${comp_smoke_component_select}    id=ctl00_ContentPlaceHolder1_ddlComponents
${comp_smoke_def_avail}    id=ctl00_ContentPlaceHolder1_ouFilterAvailability_ddlTypesList
${comp_smoke_add_all}    id=ctl00_ContentPlaceHolder1_ouFilterAvailability_btnAddEverybody
${comp_smoke_condition_popup}    xpath=//span[.='Condition'][1]//following::a[1]
${comp_smoke_name_field_popup}    id=ctl00_ContentPlaceHolder1_importFieldsPopUp_dlgImportFields_tagNameSearch
${comp_smoke_search_popup_btn}    id=ctl00_ContentPlaceHolder1_importFieldsPopUp_dlgImportFields_btnSearch
${comp_smoke_field_add_popup_btn}    xpath=//td[.='Annual Salary and PR section scores and Salary Midpoint: en-US']//preceding::img[1]
${comp_smoke_payoutschedule_add}    xpath=//span[.='Payout Schedule'][1]//following::a[1]
${comp_smoke_method1}    id=ctl00_ContentPlaceHolder1_rptSchedule_ctl01_txtMethod
${comp_smoke_method2}    id=ctl00_ContentPlaceHolder1_rptSchedule_ctl02_txtRemainingMethod
${comp_smoke_eff_date}    id=ctl00_ContentPlaceHolder1_rptSchedule_ctl01_dtEffective_textboxDate
${comp_smoke_def_save_btn}    xpath=//b[.='Save']/ancestor::a[1]
${comp_smoke_emp_salaries}    css=div a[title='Employee Salaries']
${comp_smoke_userid_field}    css=input[placeholder="User ID"]
${comp_smoke_emp_salary_search}    xpath=//a[.='Search']
${comp_smoke_emp_salary_edit}    css=a[title=Edit]
${comp_smoke_add_salary_rate}    css=a[title="Add Salary/Rate"]
${comp_smoke_salary_rate_input}    xpath=//label[@title='Salary/Rate']//following::input[1]    # xpath=//span[.='Salary/Rate']//following::div[@class='clsUIBaseInput'][1]
${comp_smoke_date_field}    css=input[placeholder="Select a date"]
${comp_smoke_emp_salary_save_icon}    css=span.cso-btn-icon-save
${comp_smoke_emp_salary_back_btn}    css=a[title=Back]
${comp_smoke_individual_targets}    css=div a[title='Individual Targets']
${comp_smoke_ind_target_userid}    id=ctl00_ContentPlaceHolder1_txtUserID
${comp_smoke_ind_target_searchbtn}    id=ctl00_ContentPlaceHolder1_searchBtn
${comp_smoke_edit_ind_target}    id=ctl00_ContentPlaceHolder1_searchRepeater_ctl00_btnEdit
${comp_smoke_ind_target_addTargetBtn}    id=ctl00_ContentPlaceHolder1_addTargetBtn
${comp_smoke_ind_targets_value}    id=ctl00_ContentPlaceHolder1_TargetsRepeater_ctl00_newAbsoluteTargetValue
${comp_smoke_ind_targets_saveimg}    id=ctl00_ContentPlaceHolder1_TargetsRepeater_ctl00_saveNewTarget
${comp_smoke_salary_structures}    css=div a[title='Salary Structures']
${comp_smoke_salary_str_searchfield}    id=ctl00_ContentPlaceHolder1_txtSearch
${comp_smoke_Share_Price}    css=div a[title='Share Price']
${comp_smoke_add_shareprice}    id=ctl00_ContentPlaceHolder1_btnAdd
${comp_smoke_shareprice_txt}    id=ctl00_ContentPlaceHolder1_rptSharePrice_ctl01_txtPrice
${comp_smoke_shareprice_saveimg}    id=ctl00_ContentPlaceHolder1_rptSharePrice_ctl01_btnSave
