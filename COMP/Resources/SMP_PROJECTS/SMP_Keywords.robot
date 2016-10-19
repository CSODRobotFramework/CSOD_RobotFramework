*** Settings ***
Library           SQLlibrary
Library           HttpLibrary.HTTP

*** Keywords ***
REST_NOAUTH
    [Documentation]    *REST_NOAUTH:*
    ...    This keyword is for http://laxqarexmt.office.cyberu.com/cornerstone-auth-api/swagger/ui/index#!/Auth/Auth_Put
    ...    PUT /v1
    ...
    ...    *Arguments:*
    ...    ${RNOAUTH_HOST} | ${RNOAUTH_CONTENTTYPE} | ${RNOAUTH_CUSTOM_CORP} | ${RNOAUTH_CUSTOM_USERID} | ${RNOAUTH_CUSTOM_CULTUREID}
    ...
    ...    *Important:*
    ...    This keyword needs to be run before using any end points since this end point is for authorization for the users that must be used before getting into any other end points.
    Connect    ${smp.server_qa05}    ${smp.database_qa05}
    ${SQL_GET_USERID}=    Execute Raw    \ SELECT TOP 1 owner_id FROM ou JOIN users ON owner_id = user_id WHERE users.culture_lang_id IS NOT NULL AND users.status_id = 1 AND ou.type_id = 131072 AND culture_lang_id = 1 GROUP BY owner_id HAVING COUNT(*) > 1 ORDER BY NEWID()
    Log    ${SQL_GET_USERID}
    ${SQL_GET_USER_CULTURE}=    Execute Raw    SELECT culture_lang_id FROM users WHERE user_id = ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USERID}    ${SQL_GET_USERID}
    Set Suite Variable    ${SQL_GET_USER_CULTURE}    ${SQL_GET_USER_CULTURE}
    Log    ${SQL_GET_USER_CULTURE}
    Create Http Context    laxqarexmt.office.cyberu.com    http
    Set Request Header    X-CORP    ${smp.corpname_qa052}
    Set Request Header    X-USERID    ${SQL_GET_USERID}
    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}

REST_AuthToken
    log    \ SELECT TOP 1 owner_id FROM ou JOIN users ON owner_id = user_id WHERE users.culture_lang_id IS NOT NULL AND users.status_id = 1 AND ou.type_id = 131072 AND culture_lang_id = 1 GROUP BY owner_id HAVING COUNT(*) > 1 ORDER BY NEWID()
    Set Request Header    content-type    \ application/json
    Set Request Body    { \ \ \"UserId\": ${SQL_GET_USERID}, \ \ \"CorpName\": \"qa052-auto-smp-api\", \ \ \"Permissions\": [ \ \ \ \ { \ \ \ \ \ \ \"Id\": -157, \ \ \ \ \ \ \"Constraints\": [ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 73, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 2, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": true \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 87, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 32, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 111, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 4, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 150, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 8, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ } \ \ \ \ \ \ ] \ \ \ \ } \ \ ], \ \ \"Token\": \"qa052-auto-smp-api_48\", \ \ \"expDt\": \"2019-08-17T16:16:19.550Z\", \ \ \"CultureId\": 0 }
    HttpLibrary.HTTP.PUT    /cornerstone-auth-api/v1
    Response Status Code Should Equal    204
    ${resBody}=    Get Response Body
    Comment    close

POST_TalentPool_Create
    [Arguments]    ${SUBMITTED_TITLE}
    Create Http Context    laxqarexmt.office.cyberu.com/talentpool-api/talentpools     http
    Set Request Header    X-CORP    ${smp.corpname_qa052}
    Set Request Header    X-USERID    1336
    Set Request Header    X-CULTUREID    1
    Comment    Set Request Header    X-CULTUREID    ${SQL_GET_USER_CULTURE}
    Set Request Header    content-type    \ application/json
    Set Request Body    { \"Title\":\"${SUBMITTED_TITLE}\"}
    HttpLibrary.HTTP.POST    /talentpool-api/talentpools/v1
    Response Status Code Should Equal    200
    ${resBody}=    Get Response Body
    close
