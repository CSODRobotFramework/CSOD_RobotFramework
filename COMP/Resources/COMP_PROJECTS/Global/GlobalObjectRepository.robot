*** Settings ***
Documentation     This resource file contains all the object locators for the Global keywords

*** Variables ***
${obj_global_login_corp}    id=corpBox
${obj_global_login_loginButton}    id=submit
${obj_global_login_password}    id=passWordBox
${obj_global_login_username}    id=userNameBox
${obj_global_logout_button}    css=#optionsbtn
${obj_global_link_logout}    xpath=//span[.='Log Out']/ancestor::a[1]
