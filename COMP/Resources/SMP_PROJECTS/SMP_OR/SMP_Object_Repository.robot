*** Variables ***
${smp_tasks_link}    css=div a[title='Tasks']
${tab_admin}      css=label[id*='_ctl02_textContainer']
${smp_succession_management}    css=div a[title='Succession Management']
${smp_add_smp_task_link}    css=a[data-tag='addTaskBtn']
${smp_task_title}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_txtTitle
${smp_task_desc}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_txtDescription
${smp_from_datefield}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_dtFromTaskPeriod_textboxDate
${smp_to_datefield}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_dtToTaskPeriod_textboxDate
${smp_plan_type}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_ddlComponent
${smp_search_template_btn}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_template_csSelect_button
${smp_by_name_field_input}    id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_template_dlgTemplate_txtSearch
${smp_search_link}    css=a[id*='_template_dlgTemplate_btnSearch']
${smp_prepopulate_task_chkbox}    css=input[id*='_chkPrePopluate']    # id=ctl00_ctl00_ContentPlaceHolder1_ContentPlaceHolder1_chkPrePopluate
${smp_template_name_link}    css=a[id*='_rptTemplate_ctl01_lnkSelect']
${smp_display_inactive_successors}    css=input[id*='_chkDisplayInactive']
${smp_incorporate_comptency_task}    css=span[id*='_selTask_button']
${smp_title_comp_based_task}    id=SearchText
${smp_search_button}    id=SearchButton
${smp_task_name_link}    xpath=//a[contains(text(),'*M-25: Comp SMP Based :English (US)')]
${smp_next_button}    css=a[id*='_btnNext']
${smp_availability}    css=select[id*='_userFilter_OrgUnitTypeList']
${smp_filter}     css=select[id*='_userSmpFilter_OrgUnitTypeList']
${smp_search_ou_button}    id=selectOrgUnitHref
${smp_namefield_popup}    id=NameField
${smp_select_ou_searchPopup_btn}    id=cmdSearch
${smp_add_btn_popup}    css=input[id*='_ctl01_SelectResultsItem']
${smp_done_btn_popup}    id=DoneButton
${smp_add_default_coplanner}    css=a[id*='_shCoPlanner_lnkAdd']
${smp_select_coplanners}    css=input[id*='_chkCoPlanner']
${smp_add_coplanner_btn_popup}    css=span[id*='_coPlannerSelector_csSelect_button']
${smp_avaiability_list_popup}    css=select[id*='_availability_OrgUnitTypeList']
${smp_add_btn_coplanner_popup}    css=a[id*='_dlgCoPlanner_availability_AddItem']
${smp_id_field_popup}    css=input[id*='_ouSearchControl_txtRefID']
${smp_datatag_search_btn}    css=a[data-tag='btnSearch']
${smp_datatag_name_link}    css=a[data-tag='lnkOUName']
${smp_datatag_save_btn}    css=a[data-tag='btnSave']
${smp_datatag_add_task_review_btn}    css=a[data-tag='btnTaskReviewAdd']
${smp_task_admin_name_field_input}    id=ctl00_ContentPlaceHolder1_SearchText
${smp_task_admin_search_btn}    css=[data-tag='SearchButton']
${smp_task_status}    css=table.CsList > tbody > tr:nth-of-type(2) > td:nth-of-type(5)
${scheduled_task_link}    css=a[href^="/EPM/scheduler/TaskReview.aspx"]
${smp_search_task_input}    id=ctl00_ContentPlaceHolder1_ucTLC_SearchText
${scheduled_task_search_btn}    css=a[id*='_SearchButton']
${smp_scheduled_task_title_link}    css=a[id*='_ctl01_lkPerform']
${smp_fullname_textsearch}    css=input[placeholder='Full Name']
${smp_current_org_search_btn}    css=a[ct='Button'][title='Search']
${smp_include_chkbox}    css=input[type="checkbox"]
${smp_scheduled_task_link}    css=a[id*='lkPerform']
${smp_save_and_continue}    css=a[title*='Save and Continue']
${smp_save_and_exit}    css=a[title*='Save and Exit']
${smp_options_btn}    css=a[title*='Options']
${smp_print_succession_task}    css=a[title*='Print Succession Task']
${smp_succession_mgmt_url}    phnx/driver.aspx?routename=Admin/Links&linkId=9&tab_page_id=-40
${smp_scheduled_task_url}    EPM/scheduler/TaskReview.aspx?tab_page_id=-220
${smp_options_btn_dropdown}    css=a[aria-label='Options']
${smp_wait_spiinner}    css=div[class='modal_wait']
${smp_overview_desc}    xpath=//div[contains(text(),'Overview Directions')]
${smp_survey_testbox_iframe}    css=iframe[id='mf0v_frame']    # \ \ xpath=//body[@class='cke_editable cke_editable_themed cke_contents_ui']
${smp_inside_iframe}    css=body[class*='cke_editable cke_editable']
${smp_overall_progress}    css= div[data-percent='33']
${smp_validation_field}    xpath=//span[contains(text(),'One or more fields')]
${smp_1_Rating}    css=body > .cso-dropdown-menu.cso-corner > li:nth-of-type(3) > a.csod-ellipsis > label > .csod-ellipsis
${smp_NA_Rating}    css=body > .cso-dropdown-menu.cso-corner > li:nth-of-type(2) > a.csod-ellipsis > label > .csod-ellipsis
${smp_2_Rating}    css=body > .cso-dropdown-menu.cso-corner > li:nth-of-type(4) > a.csod-ellipsis > label > .csod-ellipsis
${smp_3_Rating}    css=body > .cso-dropdown-menu.cso-corner > li:nth-of-type(5) > a.csod-ellipsis > label > .csod-ellipsis
${smp_rating_scale_metric1}    xpath=//b[.='SMP Rating Scale Metric X Axis']/following::a[contains(@class,'cso-btn')][1]
${smp_rating_scale_metric2}    xpath=//b[.='SMP Rating Scale Metric Y Axis']/following::a[contains(@class,'cso-btn')][1]
${smp_calc_metric}    css=a[data-tag='btnMetricCalculate']
${smp_verify_formula_metric_calc}    xpath=//span[contains(text(),'2 Rating')][1]
${smp_subtask_iframe}    css=iframe[id='_cg_frame']
${smp_metric_grid_guy1}    css=li[class*='c-metricgrid-item']
${smp_drop_guy_source}    css=span[title*='5 employee']
${smp_add_action_step}    css=a[data-tag*='DevPlanAddActionStep']
${smp_add_action_step_text}    css=[data-tag*='DevPlanActionStepName']
${smp_add_training_btn}    css=a[title='Add Training']
${smp_add_action_save_btn}    css=a[data-tag='btnDevPlanActionStepSave']
${smp_search_training_input}    css=input[class='c-shortTxBox-input']
${smp_search_training_srch_btn}    css=a[class*='icon-search']
${smp_search_training_chkbox}    xpath=//span[.='Course Title']/preceding::input[1]/ancestor::div[1]
${smp_add_selected_btn}    css=a[title='Add Selected']
${smp_update_primaryPlan_btn}    css=a[data-tag='btnDevPlanUpdatePrimary']
${smp_yes_update_primary_btn}    css=a[data-tag='btnDevPlanUpdatePrimaryPlanYes']
${smp_radio_btn_1}    css=input[id*='1c']
${smp_competencyItem_comment}    css=a[data-tag='btnCompetencyItemComment']
${smp_competency_textbox_iframe}    css=iframe[id*='_frame']
${smp_metric_grid_step_no_rating_tab}    xpath=//span[@title='No Rating']/ancestor::a[1]
