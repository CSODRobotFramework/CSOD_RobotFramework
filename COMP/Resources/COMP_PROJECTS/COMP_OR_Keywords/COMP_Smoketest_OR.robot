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
