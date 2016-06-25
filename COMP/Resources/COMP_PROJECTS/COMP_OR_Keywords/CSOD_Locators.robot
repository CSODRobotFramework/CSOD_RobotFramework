*** Settings ***
Library           Selenium2Library

*** Variables ***
${txtCorp}        id=corpBox
${txtUsername}    id=userNameBox
${txtPassword}    id=passWordBox
${lnkSubmitbtn}    id=submit
${eleAdminTab}    xpath=//label[.='Admin']    # xpath=//label[.='Admin'], css=label:contains(Admin)
${lnkSuccessionMgmt}    xpath=//a[.='Succession Management'][1]    # css=a:contains(Succession Management), xpath=//a[.='Succession Management'][1]
${lnkTask}        xpath=//a[.='Tasks'][1]
${eleReportsTab}    xpath=//label[.='Reports']
${lnkRepCompensation}    xpath=//span[contains(text(),'Compensation')]
${lnkCompensationAdj}    xpath=//a[.='Compensation Adjustment']
${lstOUtype}      css=#OrgUnitFilter_OrgUnitTypeList
${imgTaskSearch}    xpath=//img[@src='../../images/icon_popup_search.gif']
${lnkAdd}         xpath=//a[@id='OrgUnitFilter_AddItem']
${rdoWageHourly}    id=radioListWageTypes_2
${rdoWageAnnual}    id=radioListWageTypes_1
${rdoWageAny}     id=radioListWageTypes_0
${chkHourlyRates}    id=checkBoxHourlyRates
${chkComments}    id=chkIncludeComments
${chkPerfRating}    id=chkPerformanceRating
${txtSearch}      id=SearchText
${lnkSearch}      id=SearchButton
${imgAddButton}    id=SelectionList_ctl01_SelectResultItem
${lnkDone}        id=SelectedList_ctl02_DoneButton
${chkLumpSum}     id=chkIncludeLumpSum
${lstCurrency}    id=convertToCurrency_CurrencyDDN
${lnkPrint}       id=fsSyncFooter_btnPrint
${lnkExcel}       id=fsSyncFooter_btnExcel
${typTaskTitle}    ${EMPTY}    # Value is an empty string so user can provide parameter value here.
