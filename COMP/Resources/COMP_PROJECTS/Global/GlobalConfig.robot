*** Variables ***
${cfg_global_login_browser}    chrome
${cfg_global_login_profile}    ldstage    # here we pass one variable 'default' in this case to control lots of variables with _default at the end.
${cfg_global_login_corp}    ${cfg_global_login_corp_${cfg_global_login_profile}}
${cfg_global_login_username}    ${cfg_global_login_username_${cfg_global_login_profile}}
${cfg_global_login_password}    ${cfg_global_login_password_${cfg_global_login_profile}}
${cfg_global_login_url}    ${cfg_global_login_url_${cfg_global_login_profile}}
${cfg_global_login_url_default}    https://qa01.csod.com/    # https://corporate5-stg.csod.com/,https://corporate1-pilot.csod.com/,https://corporate6.csod.com/,https://corporate3.csod.com/,https://corporate5-pilot.csod.com/
${cfg_global_login_corp_default}    QA012-AUTO-QADEF2    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_default}    ca
${cfg_global_login_password_default}    popeye123
${cfg_global_home_pagesync}    ${EMPTY}
${cfg_global_resource_webdrivers}    ${EXECDIR}\\Resources\\WebDrivers\\
${cfg_sauceLabs_remoteUrl}    ${EMPTY}    # http://gfung:3e42e523-3f0e-4d5b-b68a-6a474253aacb@ondemand.saucelabs.com:80/wd/hub
${cfg_sauceLabs_desiredCapabilities}    ${EMPTY}    # chrome
${cfg_sauceLabs_desiredCapabilities2}    ${EMPTY}    # OS X 10.10
${cfg_sauceLabs_desiredCapabilities3}    ${EMPTY}    # 50.0
${cfg_global_login_corp_ldstage}    QA-LD4STG-COMP1    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_ldstage}    ca
${cfg_global_login_password_ldstage}    popeye123
${cfg_global_login_url_ldstage}    https://corporate5-stg.csod.com/
${cfg_global_login_corp_la4pilot}    QA-LA4PIL-COMP1    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_la4pilot}    ca
${cfg_global_login_password_la4pilot}    popeye123
${cfg_global_login_url_la4pilot}    https://corporate1-pilot.csod.com/
${cfg_global_login_corp_qa052}    QA052-AUTO-QADEF2    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_qa052}    ca
${cfg_global_login_password_qa052}    popeye123
${cfg_global_login_url_qa052}    https://qa05.csod.com/
${cfg_global_login_corp_ldstage2}    QA-LD4STG-COMP2    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_ldstage2}    ca
${cfg_global_login_password_ldstage2}    popeye123
${cfg_global_login_url_ldstage2}    https://corporate6.csod.com/
