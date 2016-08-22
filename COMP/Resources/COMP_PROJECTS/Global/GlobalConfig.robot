*** Variables ***
${cfg_global_login_browser}    chrome
${cfg_global_login_profile}    autocomp2    # here we pass one variable 'default' in this case to control lots of variables with _default at the end.
${cfg_global_login_corp}    ${cfg_global_login_corp_${cfg_global_login_profile}}
${cfg_global_login_username}    ${cfg_global_login_username_${cfg_global_login_profile}}
${cfg_global_login_password}    ${cfg_global_login_password_${cfg_global_login_profile}}
${cfg_global_login_url}    ${cfg_global_login_url_${cfg_global_login_profile}}
${cfg_global_login_url_qa012}    https://qa01.csod.com/    # https://corporate5-stg.csod.com/,https://corporate1-pilot.csod.com/,https://corporate6.csod.com/,https://corporate3.csod.com/,https://corporate5-pilot.csod.com/
${cfg_global_login_corp_qa012}    QA012-AUTO-QADEF2    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_qa012}    ssmith
${cfg_global_login_password_qa012}    popeye123
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
${cfg_global_login_corp_ldstagecomp2}    QA-LD4STG-COMP2    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_ldstagecomp2}    ca
${cfg_global_login_password_ldstagecomp2}    popeye123
${cfg_global_login_url_ldstagecomp2}    https://corporate5-stg.csod.com/
${cfg_global_login_corp_la4sl1}    QA-LA4SL1-COMP1    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_la4sl1}    ca
${cfg_global_login_password_la4sl1}    popeye123
${cfg_global_login_url_la4sl1}    https://corporate3.csod.com/
${cfg_global_login_corp_la4sl1comp2}    QA-LA4SL1-COMP2    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_la4sl1comp2}    ca
${cfg_global_login_password_la4sl1comp2}    popeye123
${cfg_global_login_url_la4sl1comp2}    https://corporate3.csod.com/
${cfg_global_login_corp_ld4pilot}    QA-LD4PIL-COMP1    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_ld4pilot}    ca
${cfg_global_login_password_ld4pilot}    popeye123
${cfg_global_login_url_ld4pilot}    https://corporate5-pilot.csod.com/
${cfg_global_login_corp_la4pilotcomp2}    QA-LA4PIL-COMP2    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_la4pilotcomp2}    ca
${cfg_global_login_password_la4pilotcomp2}    popeye123
${cfg_global_login_url_la4pilotcomp2}    https://corporate1-pilot.csod.com/
${cfg_global_login_corp_ld4pilotcomp2}    QA-LD4PIL-COMP2    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_ld4pilotcomp2}    ca
${cfg_global_login_password_ld4pilotcomp2}    popeye123
${cfg_global_login_url_ld4pilotcomp2}    https://corporate5-pilot.csod.com/
${cfg_global_login_corp_ld1sl1}    QA-LD4SL1-COMP1    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_ld1sl1}    ca
${cfg_global_login_password_ld1sl1}    popeye123
${cfg_global_login_url_ld1sl1}    https://corporate6.csod.com/
${cfg_global_login_corp_ld1sl1comp2}    QA-LD4SL1-COMP2    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_ld1sl1comp2}    ca
${cfg_global_login_password_ld1sl1comp2}    popeye123
${cfg_global_login_url_ld1sl1comp2}    https://corporate6.csod.com/
${cfg_global_login_corp_la4stg}    QA-LA4STG-COMP1    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_la4stg}    ca
${cfg_global_login_password_la4stg}    popeye123
${cfg_global_login_url_la4stg}    https://corporate1-stg.csod.com/
${cfg_global_login_corp_la4stgcomp2}    QA-LA4STG-COMP2    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_la4stgcomp2}    ca
${cfg_global_login_password_la4stgcomp2}    popeye123
${cfg_global_login_url_la4stgcomp2}    https://corporate1-stg.csod.com/
${cfg_global_login_corp_autocomp2}    QA052-AUTO-COMP2    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_autocomp2}    ssmith
${cfg_global_login_password_autocomp2}    popeye123
${cfg_global_login_url_autocomp2}    https://qa05.csod.com/
${cfg_global_login_corp_autoqadef}    QA012-AUTO-QADEF    # QA-LD4STG-COMP1, QA-LA4PIL-COMP1,QA-LD4STG-COMP2,QA-LD4SL1-COMP1,QA-LD4SL1-COMP1,QA-LD4SL1-COMP2,QA-LD4PIL-COMP1,QA052-AUTO-QADEF2
${cfg_global_login_username_autoqadef}    jhennessy
${cfg_global_login_password_autoqadef}    popeye123
${cfg_global_login_url_autoqadef}    https://qa01.csod.com/
