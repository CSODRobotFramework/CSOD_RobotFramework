*** Variables ***
${cfg_global_login_browser}    chrome
${cfg_global_login_url}    https://qa05.csod.com
${cfg_global_login_profile}    default
${cfg_global_login_corp}    ${cfg_global_login_corp_${cfg_global_login_profile}}
${cfg_global_login_username}    ${cfg_global_login_username_${cfg_global_login_profile}}
${cfg_global_login_password}    ${cfg_global_login_password_${cfg_global_login_profile}}
${cfg_global_login_corp_default}    qa052-auto-comp2
${cfg_global_login_username_default}    ssmith
${cfg_global_login_password_default}    popeye123
${cfg_global_home_pagesync}    ${EMPTY}
${cfg_global_resource_webdrivers}    ${EXECDIR}\\Resources\\WebDrivers\\
${cfg_sauceLabs_remoteUrl}    ${EMPTY}    # http://gfung:3e42e523-3f0e-4d5b-b68a-6a474253aacb@ondemand.saucelabs.com:80/wd/hub
${cfg_sauceLabs_desiredCapabilities}    ${EMPTY}    # chrome
${cfg_sauceLabs_desiredCapabilities2}    ${EMPTY}    # OS X 10.10
${cfg_sauceLabs_desiredCapabilities3}    ${EMPTY}    # 50.0
