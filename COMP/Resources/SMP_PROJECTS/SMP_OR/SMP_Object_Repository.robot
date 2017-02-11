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
