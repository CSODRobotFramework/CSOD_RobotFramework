*** Settings ***
Library           SQLlibrary
Library           HttpLibrary.HTTP
Library           Collections
Library           String
Resource          ../COMP_PROJECTS/Utility/UtilityKeywords.robot
Library           requests
Library           RequestsLibrary

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
    [Documentation]    *REST_NOAUTH_NonExistentUser:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/cornerstone-auth-api/swagger/ui/index#!/Auth/Auth_Put
    ...    PUT /v1
    ...
    ...    *Arguments:*
    ...    ${RNOAUTH_CUSTOM_SERVER} | ${SQL_DB} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} | ${RNOAUTH_CUSTOM_CORP}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_GET_USERID}=    Execute Raw    SELECT MAX(user_id)+1000 FROM users
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

REST_NOAUTH_User_With_Most_Talent_Pools
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
    ${SQL_GET_USERID}=    Execute Raw    SELECT TOP 1 ou.owner_id FROM ou JOIN users ON ou.owner_id = users.user_id WHERE users.culture_lang_id IS NOT NULL AND ou.type_id = 131072 GROUP BY ou.owner_id ORDER BY COUNT(ou.owner_id) DESC
    Log    ${SQL_GET_USERID}
    ${SQL_GET_USER_CULTURE}=    Execute Raw    SELECT culture_lang_id FROM users WHERE user_id = ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USERID}    ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USER_CULTURE}    ${SQL_GET_USER_CULTURE}
    Log    ${SQL_GET_USER_CULTURE}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}

REST_NOAUTH_Random_Users_with_Talent_Pools
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
    ${SQL_GET_USERID}=    Execute Raw    SELECT TOP 1 owner_id FROM ou JOIN users ON owner_id = user_id WHERE users.culture_lang_id IS NOT NULL AND ou.type_id = 131072 AND culture_lang_id = 1 GROUP BY owner_id HAVING COUNT(*) > 1 ORDER BY NEWID()
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
    Comment    Close

REST_AuthToken_RequestsLibrary
    [Documentation]    *REST_AuthToken_RequestsLibrary:*
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
    Create Session    http    ${HTTP_CONTEXT_CSOD_AUTH}    debug=3
    Comment    Create Session    http    ${HTTP_CONTEXT}    debug=3
    &{headers}=    Create Dictionary    Content-Type=application/json
    Set Test Variable    ${body}    { \ \ \"UserId\": ${SQL_GET_USERID}, \ \ \"CorpName\": \"${RNOAUTH_CUSTOM_CORP}\", \ \ \"Permissions\": [ \ \ \ \ { \ \ \ \ \ \ \"Id\": -157, \ \ \ \ \ \ \"Constraints\": [ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 73, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 2, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": true \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 87, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 32, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 111, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 4, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 150, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 8, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ } \ \ \ \ \ \ ] \ \ \ \ } \ \ ], \ \ \"Token\": \"${RNOAUTH_CUSTOM_CORP}_${SQL_GET_USERID}\", \ \ \"expDt\": \"2019-08-17T16:16:19.550Z\", \ \ \"CultureId\": 0 }
    ${resp}=    RequestsLibrary.Put Request    http    /    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    204

REST_NOAUTH_Random_Active_Shared
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
    ${SQL_GET_USERID}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE culture_lang_id IS NOT NULL AND status_id = 1 AND user_id IN (SELECT DISTINCT user_id FROM talent_pool_shared_user) ORDER BY NEWID()
    Log    ${SQL_GET_USERID}
    ${SQL_GET_USER_CULTURE}=    Execute Raw    SELECT culture_lang_id FROM users WHERE user_id = ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USERID}    ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USER_CULTURE}    ${SQL_GET_USER_CULTURE}
    Log    ${SQL_GET_USER_CULTURE}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}

REST_NOAUTH_Random_Active_Owner_OR_Shared
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
    ${SQL_GET_USERID}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE culture_lang_id IS NOT NULL AND status_id = 1 AND (user_id IN (SELECT DISTINCT owner_id FROM ou WHERE type_id = 131072) OR user_id IN (SELECT DISTINCT user_id FROM talent_pool_shared_user)) ORDER BY NEWID()
    Log    ${SQL_GET_USERID}
    ${SQL_GET_USER_CULTURE}=    Execute Raw    SELECT culture_lang_id FROM users WHERE user_id = ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USERID}    ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USER_CULTURE}    ${SQL_GET_USER_CULTURE}
    Log    ${SQL_GET_USER_CULTURE}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}

REST_NOAUTH_Random_Active_Owner
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
    ${SQL_GET_USERID}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE culture_lang_id IS NOT NULL AND status_id = 1 AND user_id IN (SELECT DISTINCT owner_id FROM ou WHERE type_id = 131072) ORDER BY NEWID()
    Log    ${SQL_GET_USERID}
    ${SQL_GET_USER_CULTURE}=    Execute Raw    SELECT culture_lang_id FROM users WHERE user_id = ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USERID}    ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USER_CULTURE}    ${SQL_GET_USER_CULTURE}
    Log    ${SQL_GET_USER_CULTURE}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}

REST_NOAUTH_Random_Not_Active_Owner_OR_Shared
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
    ${SQL_GET_USERID}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE culture_lang_id IS NOT NULL AND status_id <> 1 AND (user_id IN (SELECT DISTINCT owner_id FROM ou WHERE type_id = 131072) OR user_id IN (SELECT DISTINCT user_id FROM talent_pool_shared_user)) ORDER BY NEWID()
    Log    ${SQL_GET_USERID}
    ${SQL_GET_USER_CULTURE}=    Execute Raw    SELECT culture_lang_id FROM users WHERE user_id = ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USERID}    ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USER_CULTURE}    ${SQL_GET_USER_CULTURE}
    Log    ${SQL_GET_USER_CULTURE}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}

REST_NOAUTH_Random_Active_Owner_OR_Shared_With_Candidates
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
    ${SQL_GET_USERID}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE culture_lang_id IS NOT NULL AND status_id = 1 AND (user_id IN (SELECT DISTINCT owner_id FROM ou WHERE type_id = 131072 AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) >= 1)) OR user_id IN (SELECT DISTINCT user_id FROM talent_pool_shared_user WHERE ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) >= 1))) ORDER BY NEWID()
    Log    ${SQL_GET_USERID}
    ${SQL_GET_USER_CULTURE}=    Execute Raw    SELECT culture_lang_id FROM users WHERE user_id = ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USERID}    ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USER_CULTURE}    ${SQL_GET_USER_CULTURE}
    Log    ${SQL_GET_USER_CULTURE}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}

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
    Set Request Header    content-type    application/json
    Next Request May Not Succeed
    Set Request Body    { \"${KEY_NAME_JSON}\":\"${SUBMITTED_TITLE}\"}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools
    Response Status Code Should Equal    ${RESPONSE_POST}
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

GET_TalentPool
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id=${SQL_GET_USERID} ORDER BY newid()
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

GET_TalentPool_Title_Happy
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id=${SQL_GET_USERID} AND title LIKE '%InnocentName%' ORDER BY newid()
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

GET_TalentPool_Title_Length_1
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    \ SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id=${SQL_GET_USERID} AND LEN(title)=1 ORDER BY newid()
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    ${SQL_TalentPoolTitleById}=    Execute Raw    SELECT title FROM ou WHERE ou_id = ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

GET_TalentPool_Title_Length_50
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    \ SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id=${SQL_GET_USERID} AND LEN(title)=50 ORDER BY newid()
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    ${SQL_TalentPoolTitleById}=    Execute Raw    SELECT title FROM ou WHERE ou_id = ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

GET_TalentPool_Title_Char_Securit_SQL
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    \ SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id=${SQL_GET_USERID} AND title LIKE '%SELECT * FROM Users%' ORDER BY newid()
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    ${SQL_TalentPoolTitleById}=    Execute Raw    SELECT title FROM ou WHERE ou_id = ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

GET_TalentPool_Title_Char_Securit_Script
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id=${SQL_GET_USERID} AND title LIKE '%＜script＞alert(123)＜/script＞%' ORDER BY newid()
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    ${SQL_TalentPoolTitleById}=    Execute Raw    SELECT title FROM ou WHERE ou_id = ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

GET_TalentPool_Title_Char_Extended1
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id=${SQL_GET_USERID} AND title LIKE '%☺%' ORDER BY newid()
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    ${SQL_TalentPoolTitleById}=    Execute Raw    SELECT title FROM ou WHERE ou_id = ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    application/json
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

GET_TalentPool_Title_Char_Extended2
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id=${SQL_GET_USERID} AND title LIKE '%=%' ORDER BY newid()
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    ${SQL_TalentPoolTitleById}=    Execute Raw    SELECT title FROM ou WHERE ou_id = ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

GET_TalentPool_Title_Char_Extended3
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    \ SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id=${SQL_GET_USERID} AND title LIKE '%ú%' ORDER BY newid()
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    ${SQL_TalentPoolTitleById}=    Execute Raw    SELECT title FROM ou WHERE ou_id = ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

GET_TalentPool_Title_Char_Extended5
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND title LIKE '%Š%' ORDER BY newid()
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    ${SQL_TalentPoolTitleById}=    Execute Raw    SELECT title FROM ou WHERE ou_id = ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

GET_TalentPool_Title_Char_Extended6
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id=${SQL_GET_USERID} AND title LIKE '%Ø%' ORDER BY newid()
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    ${SQL_TalentPoolTitleById1}=    Execute Raw    SELECT title FROM ou WHERE ou_id = ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

GET_TalentPool_Title_Char_Foreign_Russian
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id=${SQL_GET_USERID} AND title LIKE '%ё%' \ ORDER BY newid()
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    ${SQL_TalentPoolTitleById1}=    Execute Raw    SELECT title FROM ou WHERE ou_id = ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

GET_TalentPool_Title_Char_Foreign_Arabic
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id=${SQL_GET_USERID} AND title LIKE '%ز%' \ ORDER BY newid()
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    ${SQL_TalentPoolTitleById1}=    Execute Raw    SELECT title FROM ou WHERE ou_id = ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}

GET_TalentPool_Does_Not_Exist
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    SELECT TOP 1 ou_id+1000 FROM ou WHERE ou.type_id = 131072 ORDER BY ou_id DESC
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Next Request May Not Succeed
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}

GET_User_Does_Not_Exist
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_TalentPool:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 ORDER BY newid()
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Next Request May Not Succeed
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}

GET_User_Did_Not_Create
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *GET_User_Did_Not_Create:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/GET/TalentPool_GetTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolIdToGet}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id<> ${SQL_GET_USERID} ORDER BY newid()
    Set Suite Variable    ${SQL_TalentPoolIdToGet}    ${SQL_TalentPoolIdToGet}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Next Request May Not Succeed
    HttpLibrary.HTTP.GET    /talentpool-api/talentpools/${SQL_TalentPoolIdToGet}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}

POST_TalentPool_Candidates_Add
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Candidates_Add:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToAdd1}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id NOT IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND name_first LIKE '%<script>alert(123)</script>%' AND status_id = 1 ORDER BY NEWID()
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Set Request Body    [{ \"UserId\": ${SQL_UserToAdd1}, \"Status\": 128 }]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools/${SQL_TalentPoolId}/candidates
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${SQL_CandidatesCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Run Keyword If    "${SQL_CandidateCountBefore} == ${SQL_CandidatesCountAfter}"    Set Test Message    The ${SQL_CandidateCountBefore} matches with ${SQL_CandidatesCountAfter}

POST_TalentPool_Candidates_Add_SubSet
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Candidates_Add:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) >= 1) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToAdd1}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToAdd1}    ${SQL_UserToAdd1}
    ${SQL_UserToAdd2}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id NOT IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND user_id <> ${SQL_UserToAdd1} AND status_id = 1 ORDER BY NEWID()
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Set Request Body    [{\"UserId\": ${SQL_UserToAdd1}},{\"UserId\": ${SQL_UserToAdd2}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountBefore}    ${SQL_CandidateCountBefore}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools/${SQL_TalentPoolId}/candidates
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${SQL_CandidatesCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidatesCountAfter}    ${SQL_CandidatesCountAfter}
    Run Keyword If    "${SQL_CandidateCountBefore} == ${SQL_CandidatesCountAfter}"    Set Test Message    The ${SQL_CandidateCountBefore} matches with ${SQL_CandidatesCountAfter}

POST_TalentPool_Candidates_Already_Added_Single
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Candidates_Add:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) >= 1) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToAdd1}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToAdd1}    ${SQL_UserToAdd1}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Set Request Body    [{\"UserId\": ${SQL_UserToAdd1}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountBefore}    ${SQL_CandidateCountBefore}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools/${SQL_TalentPoolId}/candidates
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${SQL_CandidatesCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidatesCountAfter}    ${SQL_CandidatesCountAfter}
    Run Keyword If    "${SQL_CandidateCountBefore} == ${SQL_CandidatesCountAfter}"    Set Test Message    The ${SQL_CandidateCountBefore} matches with ${SQL_CandidatesCountAfter}

POST_TalentPool_Candidates_Already_Added_All
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Candidates_Add:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) >= 2) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToAdd1}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToAdd1}    ${SQL_UserToAdd1}
    ${SQL_UserToAdd2}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND user_id <> ${SQL_UserToAdd1} AND status_id = 1 ORDER BY NEWID()
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Set Request Body    [{\"UserId\": ${SQL_UserToAdd1}},{\"UserId\": ${SQL_UserToAdd2}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountBefore}    ${SQL_CandidateCountBefore}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools/${SQL_TalentPoolId}/candidates
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${SQL_CandidatesCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidatesCountAfter}    ${SQL_CandidatesCountAfter}
    Run Keyword If    "${SQL_CandidateCountBefore} == ${SQL_CandidatesCountAfter}"    Set Test Message    The ${SQL_CandidateCountBefore} matches with ${SQL_CandidatesCountAfter}

POST_TalentPool_Candidates_Add_2Users
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Candidates_Add:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToAdd1}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id NOT IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToAdd1}    ${SQL_UserToAdd1}
    ${SQL_UserToAdd2}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id <> ${SQL_UserToAdd1} AND user_id NOT IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToAdd2}    ${SQL_UserToAdd2}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Set Request Body    [{"UserId": ${SQL_UserToAdd1}},{"UserId": ${SQL_UserToAdd2}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountBefore}    ${SQL_CandidateCountBefore}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools/${SQL_TalentPoolId}/candidates
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${SQL_CandidatesCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidatesCountAfter}    ${SQL_CandidatesCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+2
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidatesCountAfter}'== '${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidatesCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidatesCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidatesCountAfter} did not match ${SQL_NUM}

POST_TalentPool_Add_1Users
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Candidates_Add:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToAdd1}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id NOT IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToAdd1}    ${SQL_UserToAdd1}
    ${SQL_UserToAdd2}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToAdd2}    ${SQL_UserToAdd2}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Set Request Body    [{"UserId": ${SQL_UserToAdd1}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountBefore}    ${SQL_CandidateCountBefore}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools/${SQL_TalentPoolId}/candidates
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${SQL_CandidatesCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidatesCountAfter}    ${SQL_CandidatesCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+1
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidatesCountAfter}'== '${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidatesCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidatesCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidatesCountAfter} did not match ${SQL_NUM}

POST_TalentPool_Add_0Users
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Candidates_Add:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Set Request Body    [{}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountBefore}    ${SQL_CandidateCountBefore}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools/${SQL_TalentPoolId}/candidates
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${SQL_CandidatesCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidatesCountAfter}    ${SQL_CandidatesCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidatesCountAfter}'== '${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidatesCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidatesCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidatesCountAfter} did not match ${SQL_NUM}

POST_TalentPool_BaseCase_InputVsDataBase
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Candidates_Add:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToAdd1}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id NOT IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToAdd1}    ${SQL_UserToAdd1}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Set Request Body    [{"UserId": ${SQL_UserToAdd1}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountBefore}    ${SQL_CandidateCountBefore}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools/${SQL_TalentPoolId}/candidates
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${SQL_CandidatesCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidatesCountAfter}    ${SQL_CandidatesCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+1
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidatesCountAfter}'== '${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidatesCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidatesCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidatesCountAfter} did not match ${SQL_NUM}

POST_TalentPool_BaseCase_InputVsDataBase_Value
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Candidates_Add:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToAdd1}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id NOT IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToAdd1}    ${SQL_UserToAdd1}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Set Request Body    [{"UserId": ${SQL_UserToAdd1}}]
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools/${SQL_TalentPoolId}/candidates
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${SQL_GetAddedCandidateId}=    Execute Raw    SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId} AND user_id = ${SQL_UserToAdd1}
    Set Suite Variable    ${SQL_GetAddedCandidateId}    ${SQL_GetAddedCandidateId}
    Run Keyword If    '${SQL_UserToAdd1}'== '${SQL_GetAddedCandidateId}'    Utility Set Test Message    The ${SQL_UserToAdd1} matches with ${SQL_GetAddedCandidateId}
    Run Keyword If    '${SQL_UserToAdd1}'<> '${SQL_GetAddedCandidateId}'    Fail    The ${SQL_UserToAdd1} did not match ${SQL_GetAddedCandidateId}

DELETE_TalentPool_Add_0Users
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Candidates_Add:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    application/json
    Comment    Set Request Header    content-length    0
    Set Request Body    []
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountBefore}    ${SQL_CandidateCountBefore}
    HttpLibrary.HTTP.PUT    /talentpool-api/talentpools/${SQL_TalentPoolId}/candidates
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${SQL_CandidatesCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidatesCountAfter}    ${SQL_CandidatesCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidatesCountAfter}'== '${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidatesCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidatesCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidatesCountAfter} did not match ${SQL_NUM}

DELETE_TalentPool_Candidates_Remove
    [Arguments]    ${KEY_NAME_JSON}    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *POST_TalentPool_Candidates_Add:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToRemove1}=    Execute Raw    SELECT TOP 1 ou_user.user_id FROM ou_user LEFT JOIN users ON ou_user.user_id = users.user_id WHERE users.user_id > 0 AND ou_user.ou_id = ${SQL_TalentPoolId} AND users.user_id NOT IN (SELECT owner_id FROM ou WHERE ou_id = ${SQL_TalentPoolId}) AND users.status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToRemove1}    ${SQL_UserToRemove1}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    application/json
    Set Request Header    content-length    0
    Next Request May Not Succeed
    Set Request Body    [{\"UserId\": ${SQL_UserToRemove1}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountBefore}    ${SQL_CandidateCountBefore}
    HttpLibrary.HTTP.DELETE    /talentpool-api/talentpools/${SQL_TalentPoolId}/candidates
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${SQL_CandidatesCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidatesCountAfter}    ${SQL_CandidatesCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidatesCountAfter}'== '${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidatesCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidatesCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidatesCountAfter} did not match ${SQL_NUM}

DELETE_TalentPool_Candidates_Remove_0User
    [Documentation]    *DELETE_TalentPool_Candidates_Remove_0User:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    Set Suite Variable    ${body}    [{}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}/candidates    data=${body}    headers=${headers}
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Remove_1User
    [Documentation]    *DELETE_TalentPool_Candidates_Remove_1User:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToRemove1}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND user_id NOT IN (SELECT owner_id FROM ou WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToRemove1}    ${SQL_UserToRemove1}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    Set Suite Variable    ${body}    [{"UserId": ${SQL_UserToRemove1}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}/candidates    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}-1
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Remove_Access_DNE
    [Documentation]    *DELETE_TalentPool_Candidates_Remove_Access_DNE:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToRemove1}=    Execute Raw    SELECT TOP 1 ou_user.user_id FROM ou_user LEFT JOIN users ON ou_user.user_id = users.user_id WHERE users.user_id > 0 AND ou_user.ou_id = ${SQL_TalentPoolId} AND users.user_id NOT IN (SELECT owner_id FROM ou WHERE ou_id = ${SQL_TalentPoolId}) AND users.status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToRemove1}    ${SQL_UserToRemove1}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    Set Suite Variable    ${body}    [{"UserId": ${SQL_UserToRemove1}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}/candidates    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    401
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Remove_Not_TP_Owner
    [Documentation]    *DELETE_TalentPool_Candidates_Remove_1User:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id <> ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToRemove1}=    Execute Raw    SELECT TOP 1 ou_user.user_id FROM ou_user LEFT JOIN users ON ou_user.user_id = users.user_id WHERE users.user_id > 0 AND ou_user.ou_id = ${SQL_TalentPoolId} AND users.user_id NOT IN (SELECT owner_id FROM ou WHERE ou_id = ${SQL_TalentPoolId}) AND users.status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToRemove1}    ${SQL_UserToRemove1}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    Set Suite Variable    ${body}    [{"UserId": ${SQL_UserToRemove1}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}/candidates    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    401
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Remove_AlreadyRemoved_All
    [Documentation]    *DELETE_TalentPool_Candidates_AlreadyRemoved_All:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToRemove1}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id NOT IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND user_id NOT IN (SELECT owner_id FROM ou WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToRemove1}    ${SQL_UserToRemove1}
    ${SQL_UserToRemove2}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id NOT IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND user_id NOT IN (SELECT owner_id FROM ou WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 AND user_id <> ${SQL_UserToRemove1} ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToRemove2}    ${SQL_UserToRemove2}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    Set Suite Variable    ${body}    [{"UserId": ${SQL_UserToRemove1}},{"UserId": ${SQL_UserToRemove2}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}/candidates    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Remove_AlreadyRemoved_Single
    [Documentation]    *DELETE_TalentPool_Candidates_AlreadyRemoved_Single:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToRemove1}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id NOT IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND user_id NOT IN (SELECT owner_id FROM ou WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToRemove1}    ${SQL_UserToRemove1}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    Set Suite Variable    ${body}    [{"UserId": ${SQL_UserToRemove1}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}/candidates    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Remove_AlreadyRemoved_SubSet
    [Documentation]    *DELETE_TalentPool_Candidates_AlreadyRemoved_SubSet:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToRemove1}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id NOT IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND user_id NOT IN (SELECT owner_id FROM ou WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToRemove1}    ${SQL_UserToRemove1}
    ${SQL_UserToRemove2}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToRemove2}    ${SQL_UserToRemove2}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    Set Suite Variable    ${body}    [{"UserId": ${SQL_UserToRemove1}},{"UserId": ${SQL_UserToRemove2}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}/candidates    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}-1
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Remove_BaseCase_InputVsDatabase
    [Documentation]    *DELETE_TalentPool_Candidates_Api_Remove_BaseCase_InputVsDatabase:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToRemove1}=    Execute Raw    SELECT TOP 1 ou_user.user_id FROM ou_user LEFT JOIN users ON ou_user.user_id = users.user_id WHERE users.user_id > 0 AND ou_user.ou_id = ${SQL_TalentPoolId} AND users.user_id NOT IN (SELECT owner_id FROM ou WHERE ou_id = ${SQL_TalentPoolId}) AND users.status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToRemove1}    ${SQL_UserToRemove1}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    Set Suite Variable    ${body}    [{"UserId": ${SQL_UserToRemove1}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}/candidates    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}-1
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Remove_BaseCase_InputVsOutput
    [Documentation]    *DELETE_TalentPool_Candidates_Remove_BaseCase_InputVsOutput:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToRemove1}=    Execute Raw    SELECT TOP 1 ou_user.user_id FROM ou_user LEFT JOIN users ON ou_user.user_id = users.user_id WHERE users.user_id > 0 AND ou_user.ou_id = ${SQL_TalentPoolId} AND users.user_id NOT IN (SELECT owner_id FROM ou WHERE ou_id = ${SQL_TalentPoolId}) AND users.status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToRemove1}    ${SQL_UserToRemove1}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    Set Suite Variable    ${body}    [{"UserId": ${SQL_UserToRemove1}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}/candidates    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}-1
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Remove_DNEUser_All
    [Documentation]    *DELETE_TalentPool_Candidates_Remove_DNEUser_All:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToRemove1}=    Execute Raw    SELECT MAX(user_id)+1000 FROM users
    Set Suite Variable    ${SQL_UserToRemove1}    ${SQL_UserToRemove1}
    ${SQL_UserToRemove2}=    Execute Raw    SELECT MAX(user_id)+2000 FROM users
    Set Suite Variable    ${SQL_UserToRemove2}    ${SQL_UserToRemove2}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    Set Suite Variable    ${body}    [{"UserId": ${SQL_UserToRemove1},{"UserId": ${SQL_UserToRemove2}}}]
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}/candidates    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    500
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Remove_DNEUser_Single
    [Documentation]    *DELETE_TalentPool_Candidates_Remvoe_DNEUser_Single:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToRemove1}=    Execute Raw    SELECT MAX(user_id)+1000 FROM users
    Set Suite Variable    ${SQL_UserToRemove1}    ${SQL_UserToRemove1}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    Set Suite Variable    ${body}    {"UserId": ${SQL_UserToRemove1}}
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}/candidates    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    500
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Remove_DNEUser_SubSet
    [Documentation]    *DELETE_TalentPool_Candidates_Remove_DNEUser_SubSet:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_UserToRemove1}=    Execute Raw    SELECT MAX(user_id)+1000 FROM users
    Set Suite Variable    ${SQL_UserToRemove1}    ${SQL_UserToRemove1}
    ${SQL_UserToRemove2}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND user_id NOT IN (SELECT owner_id FROM ou WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Set Suite Variable    ${SQL_UserToRemove2}    ${SQL_UserToRemove2}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    Set Suite Variable    ${body}    {"UserId": ${SQL_UserToRemove1}},{"UserId": ${SQL_UserToRemove2}}
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}/candidates    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    500
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Delete_Access_DoesNotExist
    [Arguments]    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *DELETE_Api_TP_Delete_Access_DoesNotExist:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE type_id = 131072 ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT(*) FROM ou WHERE ou.type_id = 131072
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    ${RESPONSE_POST}
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT(*) FROM ou WHERE ou.type_id = 131072
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Delete_Access_NotOwner
    [Arguments]    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *DELETE_Api_TP_Delete_Access_NotOwner:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE owner_id <> ${SQL_GET_USERID} AND type_id = 131072 ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT(*) FROM ou WHERE ou.type_id = 131072
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    ${RESPONSE_POST}
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT(*) FROM ou WHERE ou.type_id = 131072
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

DELETE_TalentPool_Candidates_Delete_Input_TPId_DoesNotExist
    [Arguments]    ${RESPONSE_POST}    # SUBMITTED_TITLE = TalentPool Name and KEY_NAME_JSON = JSON keyname
    [Documentation]    *DELETE_Api_TP_Delete_Access_NotOwner:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/talentpool-api/swagger/ui/index#!/POST/TalentPool_AddCandidatesToTalentPool
    ...
    ...    *Arguments:*
    ...    ${KEY_NAME_JSON} | ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    ...
    ...    *Note:*
    ...    The arguments here like \ ${RNOAUTH_CUSTOM_CORP} | ${SQL_GET_USERID} | ${SQL_GET_USER_CULTURE} are captured during runtime.
    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    ${SQL_TalentPoolId}=    Execute Raw    SELECT MAX(ou_id)+1000 FROM ou
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Create Session    http    ${HTTP_CONTEXT_NORMAL}    debug=3
    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT(*) FROM ou WHERE ou.type_id = 131072
    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}    data=${body}    headers=${headers}
    Log    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    ${RESPONSE_POST}
    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT(*) FROM ou WHERE ou.type_id = 131072
    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}+0
    Log    ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}

PUT_TalentPool_Rename_Access
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
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE (owner_id = ${SQL_GET_USERID} OR ou_id IN (SELECT ou_id FROM talent_pool_shared_user WHERE user_id = ${SQL_GET_USERID})) AND ou.type_id = 131072 ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Next Request May Not Succeed
    Set Request Body    { \"Title\":\"${SUBMITTED_TITLE}\"}
    HttpLibrary.HTTP.PUT    /talentpool-api/talentpools/${SQL_TalentPoolId}
    ${resBody}=    Get Response Body
    Set Test Message    The ${resBody} message from the API PUT Test Passed.

PUT_TalentPool_Candidate_Status_Set
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
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE (owner_id = ${SQL_GET_USERID} OR ou_id IN (SELECT ou_id FROM talent_pool_shared_user WHERE user_id = ${SQL_GET_USERID})) AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) >= 1) AND ou.type_id = 131072 ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    ${SQL_GetCandidateId1}=    Execute Raw    SELECT TOP 1 user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId} ORDER BY NEWID()
    Set Suite Variable    ${SQL_GetCandidateId1}    ${SQL_GetCandidateId1}
    ${SQL_GetCandidateId1Status}=    Execute Raw    SELECT TOP 1 status_id FROM ou_user_status WHERE culture_id = 1 AND status_id IN (128,256,512,1024) ORDER BY NEWID()
    Set Suite Variable    ${SQL_GetCandidateId1Status}    ${SQL_GetCandidateId1Status}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Set Request Body    [{"UserId": ${SQL_GetCandidateId1},"Status": ${SQL_GetCandidateId1Status}}]
    HttpLibrary.HTTP.PUT    /talentpool-api/talentpools/${SQL_TalentPoolId}/candidates/status
    ${resBody}=    Get Response Body
    ${SQL_GetCandidate1Status_After}=    Execute Raw    SELECT status_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId} AND user_id = ${SQL_GetCandidateId1} ORDER BY NEWID()
    Set Suite Variable    ${SQL_GetCandidate1Status_After}    ${SQL_GetCandidate1Status_After}
    Run Keyword If    '${SQL_GetCandidate1Status_After}'== '${SQL_GetCandidateId1Status}'    Utility Set Test Message    The ${SQL_GetCandidate1Status_After} matches with ${SQL_GetCandidateId1Status}
    Run Keyword If    '${SQL_GetCandidate1Status_After}'<> '${SQL_GetCandidateId1Status}'    Fail    The ${SQL_GetCandidate1Status_After} did not match ${SQL_GetCandidateId1Status}
    Close

PUT_TalentPool_Rename_Access_Owner
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
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE (owner_id <> ${SQL_GET_USERID} AND ou_id NOT IN (SELECT ou_id FROM talent_pool_shared_user WHERE user_id = ${SQL_GET_USERID})) AND ou.type_id = 131072 ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Next Request May Not Succeed
    Set Request Body    { \"Title\":\"${SUBMITTED_TITLE}\"}
    Next Request May Not Succeed
    HttpLibrary.HTTP.PUT    /talentpool-api/talentpools/${SQL_TalentPoolId}
    ${resBody}=    Get Response Body
    Set Test Message    The ${resBody} message from the API Negative Test Passed.

PUT_TalentPool_Rename_Access_Not_Active
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
    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE (owner_id = ${SQL_GET_USERID}) AND ou.type_id = 131072 ORDER BY NEWID()
    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    Create Http Context    ${HTTP_CONTEXT}    http
    Set Request Header    X-CORP    ${RNOAUTH_CUSTOM_CORP}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    application/json
    Set Request Body    { \"Title\":\"${SUBMITTED_TITLE}\"}
    HttpLibrary.HTTP.PUT    /talentpool-api/talentpools/${SQL_TalentPoolId}
    Response Status Code Should Equal    ${RESPONSE_POST}
    ${resBody}=    Get Response Body
    log    ${resBody}
    ${response}=    Parse Json    ${resBody}
    ${responseDict}=    Convert To Dictionary    ${response}
    ${keyValue}=    Get From Dictionary    ${responseDict}    ${KEY_NAME_JSON}
