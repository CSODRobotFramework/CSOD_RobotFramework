*** Variables ***
${report.custom_reports}    css=a[href='/analytics/Main.aspx?tab_page_id=-301']    # Analytics Page
${report.search_reports}    id=txtSearch    # Report Title Field
${report.search_btn}    css=a.cso-btn.cso-btn-blue.cso-corner    # Reports Search Button
${report.search_tab}    xpath=//label[.='Reports']    # Reports Tab
${report.action_btn}    css=button.cso-btn-grey    # Actions Button :: was previously css=span.action-btn-icon
${report.action_refresh}    xpath=//span[.='Refresh']/ancestor::a[1]    # Refresh Button
${report.input_field}    xpath=(//input[@type='text'])[5]
${report.task_title_input}    xpath=//*[@id='phToAddFieldFilters']/div[1]/input
${report.currency_tab}    id=tabCurrencyTitle
${report.last_run}    xpath=//div[.='Processing...']    # Last Run "Processing"
${processing_status}    'Processing...'
${report.excel}    xpath=//span[.='Excel']/ancestor::a[1]
${report.edit}    xpath=//span[.='Edit']/ancestor::a[1]
${report.pick_currency}    id=rbtnPickCurrency
${report.currency_combobox}    id=ucCurrency_CurrencyDDN
${report.save_btn}    id=btnSave
${report.refresh_btn}    id=btnPreview
${report.actions_btn}    id=btnActions
${report.action_excelPreview}    css=span.ui-icon.ui-icon-csod.ui-icon-csod-excel    # xpath=//span[@class='ui-icon ui-icon-csod ui-icon-csod-excel']
${report.cellText}    xpath=//div[contains(text(),'Bear, Smokey')]
${report.users_currency}    id=rbtnUserCurrency
${report.close_btn}    id=btnClose
${report.yes_btn}    xpath=//span[.='Yes'][1]
${report.original_currency}    id=rbtnOriginalCurrency

*** Keywords ***
