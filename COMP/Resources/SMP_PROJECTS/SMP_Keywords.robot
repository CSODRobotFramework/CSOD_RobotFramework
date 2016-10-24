*** Settings ***
Library           SQLlibrary
Library           HttpLibrary.HTTP
Library           Collections
Library           String

*** Keywords ***
REST_NOAUTH
    [Documentation]    *REST_NOAUTH:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/cornerstone-auth-api/swagger/ui/index#!/Auth/Auth_Put
    ...    PUT /v1
    ...
    ...    *Arguments:*
    ...    ${RNOAUTH_CUSTOM_SERVER} | ${SQL_DB} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} | ${RNOAUTH_CUSTOM_CORP}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_GET_USERID}=    Execute Raw    SELECT TOP 1 owner_id FROM ou JOIN users ON owner_id = user_id WHERE users.culture_lang_id IS NOT NULL AND users.status_id = 1 AND ou.type_id = 131072 AND culture_lang_id = 1 GROUP BY owner_id HAVING COUNT(*) > 1 ORDER BY NEWID()
    Log    ${SQL_GET_USERID}
    ${SQL_GET_USER_CULTURE}=    Execute Raw    SELECT culture_lang_id FROM users WHERE user_id = ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USERID}    ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USER_CULTURE}    ${SQL_GET_USER_CULTURE}
    Log    ${SQL_GET_USER_CULTURE}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}

REST_NOAUTH_NonExistentUser
    [Documentation]    *REST_NOAUTH:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/cornerstone-auth-api/swagger/ui/index#!/Auth/Auth_Put
    ...    PUT /v1
    ...
    ...    *Arguments:*
    ...    ${RNOAUTH_CUSTOM_SERVER} | ${SQL_DB} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} | ${RNOAUTH_CUSTOM_CORP}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_GET_USERID}=    Execute Raw    	\ SELECT MAX(user_id)+1000 FROM users
    Log    ${SQL_GET_USERID}
    ${SQL_GET_USER_CULTURE}=    Execute Raw    SELECT 1
    Set Suite Variable    ${SQL_GET_USERID}    ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USER_CULTURE}    ${SQL_GET_USER_CULTURE}
    Log    ${SQL_GET_USER_CULTURE}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}

REST_NOAUTH_Shared_TalentPools
    [Documentation]    *REST_NOAUTH:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/cornerstone-auth-api/swagger/ui/index#!/Auth/Auth_Put
    ...    PUT /v1
    ...
    ...    *Arguments:*
    ...    ${RNOAUTH_CUSTOM_SERVER} | ${SQL_DB} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} | ${RNOAUTH_CUSTOM_CORP}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_GET_USERID}=    Execute Raw    SELECT TOP 1 talent_pool_shared_user.user_id FROM talent_pool_shared_user JOIN users ON talent_pool_shared_user.user_id = users.user_id WHERE users.culture_lang_id IS NOT NULL GROUP BY talent_pool_shared_user.user_id ORDER BY newid()
    Log    ${SQL_GET_USERID}
    ${SQL_GET_USER_CULTURE}=    Execute Raw    SELECT culture_lang_id FROM users WHERE user_id = ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USERID}    ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USER_CULTURE}    ${SQL_GET_USER_CULTURE}
    Log    ${SQL_GET_USER_CULTURE}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}

REST_AuthToken
    [Documentation]    *REST_AuthToken:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/cornerstone-auth-api/swagger/ui/index#!/Auth/Auth_Put
    ...    PUT /v1
    ...
    ...    *Arguments:*
    ...    Run Time Arguments:
    ...    ${SQL_GET_USERID},${RNOAUTH_CUSTOM_CORP}
    ...
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Notes*
    ...    Set Request Body keyword has Constraints that are hard coded this is assuming that all users on the portal have these constraints for the permission_id -157 Talent Pool Permission. We can also remove the constraints here if needed and it should run fine.
    Set Request Header    content-type    \ application/json
    Set Request Body    { \ \ \"UserId\": ${SQL_GET_USERID}, \ \ \"CorpName\": \"${RNOAUTH_CUSTOM_CORP}\", \ \ \"Permissions\": [ \ \ \ \ { \ \ \ \ \ \ \"Id\": -157, \ \ \ \ \ \ \"Constraints\": [ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 73, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 2, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": true \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 87, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 32, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 111, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 4, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 150, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 8, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ } \ \ \ \ \ \ ] \ \ \ \ } \ \ ], \ \ \"Token\": \"${RNOAUTH_CUSTOM_CORP}_${SQL_GET_USERID}\", \ \ \"expDt\": \"2019-08-17T16:16:19.550Z\", \ \ \"CultureId\": 0 }
    HttpLibrary.HTTP.PUT    /cornerstone-auth-api/v1
    Response Status Code Should Equal    204
    ${resBody}=    Get Response Body
    Close

POST_TalentPool_Create
    [Arguments]    ${SUBMITTED_TITLE}    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Create:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_CreateTalentPool
    ...
    ...    *Arguments:*
    ...    ${SUBMITTED_TITLE} | ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Set Request Body    { \"Title\":\"${SUBMITTED_TITLE}\"}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

POST_TalentPool_Create_Random_Title
    [Arguments]    ${KEY_NAME_JSON}    # KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Create:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_CreateTalentPool
    ...
    ...    *Arguments:*
    ...    ${SUBMITTED_TITLE} | ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_RandomName}=    Execute Raw    SELECT CONVERT(varchar(255), NEWID())
    Set Suite Variable    ${SQL_RandomName}
    Log    ${SQL_RandomName}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Set Request Body    { \"Title\":\"${SQL_RandomName}\"}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools
    Response Status Code Should Equal    200
    ${SQL_GetTalentPoolIdByName}=    Execute Raw    SELECT TOP 1 title FROM ou WHERE ou.type_id = 131072 AND title = '${SQL_RandomName}'
    Log    ${SQL_GetTalentPoolIdByName}
    Run Keyword If    "${SQL_GetTalentPoolIdByName}==${SQL_RandomName}"    Set Test Message    Passed Random Name was matched with Database entry.
    Close

POST_TalentPool_Create_Empty_String
    [Arguments]    ${SUBMITTED_TITLE}    ${KEY_NAME_JSON}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Create:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_CreateTalentPool
    ...
    ...    *Arguments:*
    ...    ${SUBMITTED_TITLE} | ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Next Request May Not Succeed
    Set Request Body    { \"Title\":\"${SUBMITTED_TITLE}\"}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools
    ${resBody}=    Get Response Body
    Set Test Message    The ${resBody} message from the API Negative Test Passed.

POST_TalentPool_Create_Over_Max_Count
    [Arguments]    ${SUBMITTED_TITLE}    ${KEY_NAME_JSON}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Create:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_CreateTalentPool
    ...
    ...    *Arguments:*
    ...    ${SUBMITTED_TITLE} | ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Next Request May Not Succeed
    Set Request Body    { \"Title\":\"${SUBMITTED_TITLE}\"}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools
    ${resBody}=    Get Response Body
    Set Test Message    The ${resBody} message from the API Negative Test Passed.
