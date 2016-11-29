*** Settings ***
Library           SQLlibrary
Library           HttpLibrary.HTTP
Resource          ../Resources/SMP_PROJECTS/SMP_Resources.robot

*** Test Cases ***
SQL-TestCase
    [Documentation]    *Name*
    ...    API_Talent_Pool_Create_Success_Return_Name.
    ...
    ...    *Description:*
    ...    verify new talent pool returns correct name
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    InnocentName    Title

Delete Request With URL Params
    [Tags]    delete
    Create Session    httpbin    http://httpbin.org
    &{params}=    Create Dictionary    key=value    key2=value2
    ${resp}=    Delete Request    httpbin    /delete    ${params}
    Should Be Equal As Strings    ${resp.status_code}    200

Delete Request With No Data
    [Tags]    delete
    REST_NOAUTH_Random_Users_with_Talent_Pools
    Comment    REST_AuthToken
    Comment    Set Request Header    content-type    \ application/json
    Create Session    http    http://cornerstone-auth-api/v1
    &{dataheader}=    Create Dictionary    Content-Type=application/json
    &{headersauth}=    Create Dictionary    body={ \ \ \"UserId\": ${SQL_GET_USERID}, \ \ \"CorpName\": \"${RNOAUTH_CUSTOM_CORP}\", \ \ \"Permissions\": [ \ \ \ \ { \ \ \ \ \ \ \"Id\": -157, \ \ \ \ \ \ \"Constraints\": [ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 73, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 2, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": true \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 87, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 32, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 111, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 4, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 150, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 8, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ } \ \ \ \ \ \ ] \ \ \ \ } \ \ ], \ \ \"Token\": \"${RNOAUTH_CUSTOM_CORP}_${SQL_GET_USERID}\", \ \ \"expDt\": \"2019-08-17T16:16:19.550Z\", \ \ \"CultureId\": 0 }
    Log    ${headersauth}
    ${respheader}=    Put Request    http    /put    data=${dataheader}    headers=${headersauth}
    Comment    HttpLibrary.HTTP.PUT    /cornerstone-auth-api/v1
    Comment    Response Status Code Should Equal    204
    Comment    ${resBody}=    Get Response Body
    Comment    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    Comment    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Comment    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    Comment    Create Session    ${HTTP_CONTEXT}    http://laxqarexmt.office.cyberu.com/talentpool-api/talentpools/${SQL_TalentPoolId}/candidates
    Comment    ${data}=    Create Dictionary    Content-Type=application/json
    Comment    &{headers}=    Create Dictionary    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID='${SQL_GET_USERID}'    X-CULTUREID='${SQL_GET_USER_CULTURE}'
    Comment    ${resp}=    Delete Request    ${HTTP_CONTEXT}    http://laxqarexmt.office.cyberu.com/talentpool-api/talentpools/${SQL_TalentPoolId}/candidates    allow_redirects=True    headers=${headers}
    Comment    Should Be Equal As Strings    ${resp.status_code}    200
    Comment    &{params}=    Create Dictionary    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID='${SQL_GET_USERID}'    X-CULTUREID='${SQL_GET_USER_CULTURE}'
    Comment    RequestsLibrary.Head    ${HTTP_CONTEXT}    http://laxqarexmt.office.cyberu.com/talentpool-api/talentpools/${SQL_TalentPoolId}/candidates    allow_redirects=true    headers=${params}
    Comment    &{data}=    Create Dictionary    key=[]
    Comment    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Comment    ${resp}=    RequestsLibrary.Delete Request    ${HTTP_CONTEXT}    http://laxqarexmt.office.cyberu.com/talentpool-api/talentpools/${SQL_TalentPoolId}/candidates    /delete    ${data}
    Comment    Should Be Equal As Strings    ${resp.status_code}    200
    Comment    Create Session    httpbin    http://httpbin.org
    Comment    ${resp}=    Delete Request    httpbin    /delete
    Comment    Should Be Equal As Strings    ${resp.status_code}    200

Delete Request With Data
    [Tags]    delete
    Create Session    httpbin    http://httpbin.org    debug=3
    &{data}=    Create Dictionary    name=bulkan    surname=evcimen
    ${resp}=    Delete Request    httpbin    /delete    data=${data}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.content}
    Comment    Dictionary Should Contain Value    ${resp.json()['data']}    bulkan
    Comment    Dictionary Should Contain Value    ${resp.json()['data']}    evcimen

Put Requests
    [Tags]    put
    Create Session    httpbin    http://cornerstone-auth-api/v1    debug=3
    Set Test Variable    ${data}    { \ \ \"UserId\": 1336, \ \ \"CorpName\": \"QA052-AUTO-SMP_API\", \ \ \"Permissions\": [ \ \ \ \ { \ \ \ \ \ \ \"Id\": -157, \ \ \ \ \ \ \"Constraints\": [ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 73, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 2, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": true \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 87, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 32, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 111, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 4, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 150, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 8, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ } \ \ \ \ \ \ ] \ \ \ \ } \ \ ], \ \ \"Token\": \"QA052-AUTO-SMP-API_1336\", \ \ \"expDt\": \"2019-08-17T16:16:19.550Z\", \ \ \"CultureId\": 0 }
    Comment    ${resp}=    Put Request    httpbin    /put    data=${data}
    Comment    &{data}=    Create Dictionary    body={ \ \ \"UserId\": 1336, \ \ \"CorpName\": \"QA052-AUTO-SMP_API\", \ \ \"Permissions\": [ \ \ \ \ { \ \ \ \ \ \ \"Id\": -157, \ \ \ \ \ \ \"Constraints\": [ \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 73, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 2, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": true \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 87, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 32, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 111, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 4, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ }, \ \ \ \ \ \ \ \ { \ \ \ \ \ \ \ \ \ \ \"m_Item1\": 150, \ \ \ \ \ \ \ \ \ \ \"m_Item2\": 8, \ \ \ \ \ \ \ \ \ \ \"m_Item3\": false \ \ \ \ \ \ \ \ } \ \ \ \ \ \ ] \ \ \ \ } \ \ ], \ \ \"Token\": \"QA052-AUTO-SMP-API_1336\", \ \ \"expDt\": \"2019-08-17T16:16:19.550Z\", \ \ \"CultureId\": 0 }
    Comment    Log    ${data}
    Comment    &{headers}=    Create Dictionary    Content-Type=application/json
    Comment    ${resp}=    Put Request    httpbin    http://cornerstone-auth-api/v1    data=${data}    headers=${headers}
    Comment    Dictionary Should Contain Value    ${resp.json()['form']}    bulkan
    Comment    Dictionary Should Contain Value    ${resp.json()['form']}    evcimen

Put Request With No Dictionary
    [Tags]    put
    Create Session    httpbin    http://httpbin.org
    Set Test Variable    ${data}    some content
    ${resp}=    Put Request    httpbin    /put    data=${data}
    Should Be Equal As Strings    ${resp.status_code}    200
    Should Contain    ${resp.text}    ${data}

Head Request
    [Tags]    head
    Create Session    httpbin    http://httpbin.org
    ${resp}=    Head Request    httpbin    /headers
    Should Be Equal As Strings    ${resp.status_code}    200
