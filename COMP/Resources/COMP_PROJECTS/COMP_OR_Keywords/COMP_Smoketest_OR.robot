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
${comp_smoke_base_types}    css=div a[title='Base Types']
${comp_smoke_base_types_edit}    id=edit_1
${comp_smoke_base_types_saveimg}    id=save_1
${comp_smoke_bonus_types}    css=div a[title='Bonus Types']
${comp_smoke_bonus_types_edit}    id=edit_16
${comp_smoke_bonus_types_cancel}    id=cancel_16
${comp_smoke_currencies}    css=div a[title='Currencies']
${comp_smoke_currencies_editRate}    id=ctl00_ContentPlaceHolder1_ratesRepeater_ctl00_editRate
${comp_smoke_currencies_new_rate}    id=ctl00_ContentPlaceHolder1_editRateDlg_newRateTxt
${comp_smoke_currencies_saveRateBtn}    id=ctl00_ContentPlaceHolder1_editRateDlg_saveRateBtn
${comp_smoke_custom_fields}    css=div a[title='Custom Fields']
${comp_smoke_custom_field_addlink}    id=ctl00_ctl00_ContentPlaceHolder1_insidepanel_shFields_lnkAddField
${comp_smoke_custom_field_title}    id=ctl00_ctl00_ContentPlaceHolder1_insidepanel_txtTitle
${comp_smoke_custom_field_types_combobox}    id=ctl00_ctl00_ContentPlaceHolder1_insidepanel_ddlFieldTypes
${comp_smoke_custom_fields_select_criteria}    id=ctl00_ctl00_ContentPlaceHolder1_insidepanel_ouFilter_ouFilterSelector_ddlTypesList
${comp_smoke_custom_field_add_btn}    id=ctl00_ctl00_ContentPlaceHolder1_insidepanel_ouFilter_ouFilterSelector_btnAddEverybody
${comp_smoke_custom_field_save}    id=ctl00_ctl00_ContentPlaceHolder1_insidepanel_btnSave
${comp_smoke_custom_statements}    css=div a[title='Custom Statements']
${comp_smoke_cust_stmts_createlink}    css=span.text
${comp_smoke_cust_stmts_name_field}    id=ctl00_ContentPlaceHolder1_txtName
${comp_smoke_AddSectionbtn}    id=ctl00_ContentPlaceHolder1_btnAddSection
${comp_smoke_cust_stmts_rad_editor}    id=ctl00_ContentPlaceHolder1_CsodRadEditor1_contentIframe    # ctl00_ContentPlaceHolder1_CsodRadEditor1Center
${comp_smoke_cust_stmts_saveBtn}    id=ctl00_ContentPlaceHolder1_saveBtn
${comp_smoke_cust_stmts_design_mode}    css=a.reMode_design > span
${comp_smoke_cust_stmts_add_cond}    id=ctl00_ContentPlaceHolder1_customFormulaControl_hdrLayout0_addNewOptionLayout0
${comp_smoke_cust_stmts_condition_addBtn}    css=td.CsLinkButton > img
${comp_smoke_cust_stmts_save_stmt}    id=ctl00_ContentPlaceHolder1_btnSaveStatement
${comp_smoke_tags}    css=div a[title='Tags']
${comp_smoke_tag_name_field}    id=ctl00_ContentPlaceHolder1_txtSearch
${comp_smoke_tags_btnSearch}    id=ctl00_ContentPlaceHolder1_btnSearch
${comp_smoke_tags_verify_tag_amount}    css=#ctl00_ContentPlaceHolder1_rptType_ctl01_pnlType_titleMiddle > h2
${comp_smoke_tags_collapse}    id=ctl00_ContentPlaceHolder1_rptType_ctl01_pnlType_lnkExpandCollapse
${comp_smoke_tags_backBtn}    xpath=//b[.='« Back']
${comp_smoke_tasks}    css=div a[title='Tasks']
${comp_smoke_tasks_create_comp_plan}    css=span.text
${comp_smoke_tasks_txtTitle}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_txtTitle
${comp_smoke_tasks_desc}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_txtDescription
${comp_smoke_tasks_inst}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_txtInstructions_viewEditTextBox
${comp_smoke_tasks_FromTaskPeriod}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_dtFromTaskPeriod_textboxDate
${comp_smoke_tasks_ToTaskPeriod}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_dtToTaskPeriod_textboxDate
${comp_smoke_tasks_FromCompPeriod}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_dtFromCompPeriod_textboxDate
${comp_smoke_tasks_ToCompPeriod}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_dtToCompPeriod_textboxDate
${comp_smoke_tasks_add_base_template}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_rptTemplate_ctl00_shTemplate_btnShowTemplate
${comp_smoke_tasks_addButton}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_csdTemplate_templateControl_TemplateList_ctl01_addButton
${comp_smoke_tasks_baseEffdate}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_rptTemplate_ctl00_dtEffective_textboxDate
${comp_smoke_tasks_base_tab_title}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_rptTemplate_ctl00_txtTabTitle
${comp_smoke_tasks_StatementDate}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_dtStatementDate_textboxDate
${comp_smoke_tasks_btnNext}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_btnNext
${comp_smoke_tasks_select_criteria}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_OrgUnitFilter_OrgUnitTypeList
${comp_smoke_tasks_searchimg}    id=selectOrgUnitHref
${comp_smoke_tasks_NameFieldPopup}    id=NameField
${comp_smoke_tasks_searchbtnPopup}    id=cmdSearch
${comp_smoke_tasks_addBtn_Popup}    id=ResultsListOU_ctl01_SelectResultsItem
${comp_smoke_tasks_DoneBtn}    id=DoneButton
${comp_smoke_tasks_avail_srch_Popup}    id=cmdSearch
${comp_smoke_tasks_addImgBtn}    id=ResultsListOU_ctl01_SelectResultsItem
${comp_smoke_tasks_DoneBtnPopup}    id=DoneButton
${comp_smoke_tasks_SelectApprovals}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_shApprovals_btnSelectApprovals
${comp_smoke_tasks_mgr_approver}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_csdApprover_ApproverControl_rptApprover_ctl01_btnAdd
${comp_smoke_tasks_approval_doneBtnPopup}    xpath=//b[.='Done']/ancestor::a[1]
${comp_smoke_tasks_saveBtn}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_btnSave
${comp_smoke_tasks_approver_mgr_nametext}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_rptApprover_ctl01_lblApproverName
${comp_smoke_adjustment_guideline_okPopup}    id=ctl00_ContentPlaceHolder1_confirmCtrl_btnYes
${comp_smoke_test_status}    Compensation Test Suite:
${comp_status}    ${EMPTY}
