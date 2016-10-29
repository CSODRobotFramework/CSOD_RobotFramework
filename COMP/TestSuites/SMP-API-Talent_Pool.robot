*** Settings ***
Library           SQLlibrary
Library           HttpLibrary.HTTP
Resource          ../Resources/SMP_PROJECTS/SMP_Resources.robot

*** Test Cases ***
POST-API_Talent_Pool_Create_Succ_Return_Name
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    InnocentName    Title    200

POST-API_Talent_Pool_Success_NewEntryExist
    [Documentation]    *Name:*
    ...    API_Talent_Pool_Success_NewEntryExist.
    ...
    ...    *Description:*
    ...    verify new talent pool in data base
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    POST
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create_Random_Title    Title

POST-API_TPC_Length_0
    [Documentation]    *Name:*
    ...    Api_TPC_Length_0.
    ...
    ...    *Description:*
    ...    verify failure when title length is 0
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    POST    NEGATIVETEST
    REST_NOAUTH_Shared_TalentPools
    REST_AuthToken
    POST_TalentPool_Create_Empty_String    ${EMPTY}    Title

POST-API_TPC_Length_1
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    1    Title    200

POST-API_TPC_Length_50
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    12345678901234567890123456789012345678901234567890    Title    200

POST-API_TPC_Length_51
    [Documentation]    *Name:*
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
    [Tags]    POST    NEGATIVETEST
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create_Over_Max_Count    123456789012345678901234567890123456789012345678901    Title

POST-API_TPC_Trim_Space
    [Documentation]    *Name:*
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
    [Tags]    POST    NEGATIVETEST
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create_Empty_String    ${SPACE * 3}    Title

POST-API_TPC_Trim_TabSpace
    [Documentation]    *Name:*
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
    [Tags]    POST    NEGATIVETEST
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create_Empty_String    " "    Title

POST-API_TPC_Trim_Leading
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    ${SPACE * 2}Leading    Title    200

POST-API_TPC_Trim_Trailing
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    Trailing${SPACE * 2}    Title    200

POST-API_TPC_Trim_Middle
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    space between    Title    200

POST-API_TPC_Trim_SpaceAnd50
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    12345678901234567890123456789012345678901234567890${SPACE}    Title    200

POST-API_TPC_Security_Script
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    <script>alert(123)</script>    Title    200

POST-API_TPC_Security_SQL
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    SELECT * FROM Users    Title    200

POST-API_TPC_Characters_Extended2
    [Documentation]    *Name:*
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
    [Tags]    ASCII    POSTFAIL
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    <=>?@^_`{|}~⌂ÇüéâäàåçêëèïîìæÆôöòûùÿ¢£¥₧ƒáíóúñÑª    Title    200

POST-API_TPC_Characters_Extended3
    [Documentation]    *Name:*
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
    [Tags]    POST    ASCII
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    \ º¿¬¬½¼¡«»¦¦¦¦¦¦¦++¦¦++++++--+-+¦¦++--¦-+----++++++    Title    200

POST-API_TPC_Characters_Extended4
    [Documentation]    *Name:*
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
    [Tags]    POST    ASCII
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    ++¦_¦¦¯aßGpSsµtFTOd8fen=±==()÷˜°•·vn²¦€„…†‡ˆ‰Š‹ŒŽ    Title    200

POST-API_TPC_Characters_Extended5
    [Documentation]    *Name:*
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
    [Tags]    POST    ASCII
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    ‘’“”–—˜™š›œžŸ¤¦¨©®¯³´¸U¾ÀÁÂÃÄÅÈÉÊËÌÍÎÏÐÒÓÔÕÖ×ØÙÚÛÜ    Title    200

POST-API_TPC_Characters_Extended6
    [Documentation]    *Name:*
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
    [Tags]    POST    ASCII
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    ÝÞãðýþ    Title    200

POST-API_TPC_Foreign_Russian
    [Documentation]    *Name:*
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
    [Tags]    POST    ASCII
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    ёъяшертыуиопющэасдфгчйкльжзхцвбнмЁЪЯШЕРТЫУИОПЮЩЭЖЬ    Title    200

POST-API_TPC_Foreign_Arabic
    [Documentation]    *Name:*
    ...    POST-API_TPC_Foreign_Arabic.
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
    [Tags]    POST    ASCII
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    غظضذخثتشرقصفعسنملكيطحزوهدجباشغظذخثتسرقضفعصنملكيطحز    Title    200

POST-API_TPC_Access_Does_Not_Exist
    [Documentation]    *Name:*
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
    [Tags]    POST    NEGATIVETEST
    REST_NOAUTH_NonExistentUser
    REST_AuthToken
    POST_TalentPool_Create_Empty_String    InnocentName    Title

GET-API_TPC_GET_Return_ID_Expected
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH
    REST_AuthToken
    GET_TalentPool    TalentpoolId    200

GET-API_TPC_GET_Return_Title_Happy
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH
    REST_AuthToken
    GET_TalentPool_Title_Happy    Title    200

GET-API_TPC_GET_Return_Title_Length_1
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    GET_TalentPool_Title_Length_1    Title    200

GET-API_TPC_GET_Return_Title_Length_50
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    GET_TalentPool_Title_Length_50    Title    200

GET-API_TPC_GET_Return_Title_SQL
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    GET_TalentPool_Title_Char_Securit_SQL    Title    200

GET-API_TPC_GET_Return_Title_Security_Script
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    GET_TalentPool_Title_Char_Securit_Script    Title    200

GET-API_TPC_GET_Return_Title_Extended1
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    GET_TalentPool_Title_Char_Extended1    Title    200

GET-API_TPC_GET_Return_Title_Extended2
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    GET_TalentPool_Title_Char_Extended2    Title    200

GET-API_TPC_GET_Return_Title_Extended3
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    GET_TalentPool_Title_Char_Extended3    Title    200

GET-API_TPC_GET_Return_Title_Extended5
    [Documentation]    *Name:*
    ...    GET-API_TPC_GET_Return_Title_Extended5
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
    [Tags]    POST
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    GET_TalentPool_Title_Char_Extended5    Title    200

GET-API_TPC_GET_Return_Title_Extended6
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    GET_TalentPool_Title_Char_Extended6    Title    200

GET-API_TPC_GET_Return_Title_Char_Foreign_Russian
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    GET_TalentPool_Title_Char_Foreign_Russian    Title    200

GET-API_TPC_GET_Return_Title_Char_Foreign_Arabic
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    GET_TalentPool_Title_Char_Foreign_Arabic    Title    200

GET-API_TPC_GET_Input_TP_Does_Not_Exist
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken
    GET_TalentPool_Does_Not_Exist    Title    404

GET-API_TPC_GET_Input_User_Does_Not_Exist
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_NonExistentUser
    REST_AuthToken
    GET_User_Does_Not_Exist    Title    401

GET-API_TPC_GET_Input_User_Did_Not_Create
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken
    GET_User_Did_Not_Create    Title    401

POST-API_TPC_Add_Security_Script
    [Documentation]    *Name:*
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
    [Tags]    POST
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken
    POST_TalentPool_Candidates_Add    Title    200

POST-API_TPC_Add_Already_Added_Subset
    [Documentation]    *Name:*
    ...    API_TPC_Add_Already_Added_Subset.
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
    [Tags]    POST
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    POST_TalentPool_Candidates_Add_SubSet    Title    200

POST-API_TPC_Add_Already_Added_Single
    [Documentation]    *Name:*
    ...    API_TPC_Add_Already_Added_Single.
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
    [Tags]    POST
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    POST_TalentPool_Candidates_Already_Added_Single    Title    200

POST-API_TPC_Add_Already_Added_All
    [Documentation]    *Name:*
    ...    API_TPC_Add_Already_Added_Single.
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
    [Tags]    POST3
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    POST_TalentPool_Candidates_Already_Added_All    Title    200

POST-API_TPC_Add_Access_No_Visibility_Subset
    [Documentation]    *Name:*
    ...    API_TPC_Add_Already_Added_Single.
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
    [Tags]    POST3
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    Comment    POST_TalentPool_Candidates_Already_Added_All    Title    200

POST-API_TPC_Add_2Users
    [Documentation]    *Name:*
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
    [Tags]    USER
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken
    POST_TalentPool_Candidates_Add_2Users    Title    200

POST-API_TPC_Add_1Users
    [Documentation]    *Name:*
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
    [Tags]    USER11
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken
    POST_TalentPool_Add_1Users    Title    200

POST-API_TPC_Add_0Users
    [Documentation]    *Name:*
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
    [Tags]    USER12
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken
    POST_TalentPool_Add_0Users    Title    200

POST-API_TPC_Add_BaseCase_Input_Vs_Database
    [Documentation]    *Name:*
    ...    API_TPC_Add_Already_Added_Single.
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
    [Tags]    DB
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    POST_TalentPool_BaseCase_InputVsDataBase    Title    200

POST-API_TPC_Add_BaseCase_Input_Vs_Output_Value
    [Documentation]    *Name:*
    ...    API_TPC_Add_Already_Added_Single.
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
    [Tags]    DBV
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    POST_TalentPool_BaseCase_InputVsDataBase_Value    Title    200

DELETE-API_TPC_Candidates_Remove
    [Documentation]    *Name:*
    ...    API_TPC_Add_Already_Added_Single.
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
    [Tags]    DELETE
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken
    DELETE_TalentPool_Add_0Users    Title    200

DELETE-API_TPC_Remove_Access_Does_Not_Exist
    [Documentation]    *Name:*
    ...    API_TPC_Add_Already_Added_Single.
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
    [Tags]    DELETE400
    REST_NOAUTH_NonExistentUser
    REST_AuthToken
    DELETE_TalentPool_Candidates_Remove    Title    400

PUT-API_TPC_Rename
    [Documentation]    *Name:*
    ...    PUT-TP_Rename_Access.
    ...
    ...    *Description:*
    ...    Access: Verify success when actor shared
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    PUT
    REST_NOAUTH_Random_Active_Shared
    REST_AuthToken
    PUT_TalentPool_Rename_Access    test 2    Title

PUT-API_Talent_Pool_Candidate_Search_Set_UseCase_Base_InputVsStatusDatabase
    [Documentation]    *Name:*
    ...    PUT-API_Talent_Pool_Candidate_Search_Set_UseCase_Base_InputVsStatusDatabase
    ...
    ...    *Description:*
    ...    UseCase_Base: Verify provided status matches new entry in database
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    PUT2
    REST_NOAUTH_Random_Active_Shared
    REST_AuthToken
    PUT_TalentPool_Candidate_Status_Set    Title    200

PUT-API_TalentPool_Candidate_Status_Set_UseCase_Elaborate_Users_1
    [Documentation]    *Name:*
    ...    PUT-API_TP_CS_Set_UC_Elab_Users_1
    ...
    ...    *Description:*
    ...    UseCase_Elaborate: Verify success when status passed is identical
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    PUT3
    REST_NOAUTH_Random_Active_Owner_OR_Shared
    REST_AuthToken
    PUT_TalentPool_Candidate_Status_Set    Title    200

PUT-API_TPC_Rename_Access_Owner
    [Documentation]    *Name:*
    ...    PUT-TP_Rename_Access.
    ...
    ...    *Description:*
    ...    Access: Verify success when actor shared
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    PUT4
    REST_NOAUTH_Random_Active_Owner
    REST_AuthToken
    PUT_TalentPool_Rename_Access_Owner    SimpleName    Title

PUT-API_TalentPool_Rename_Access_Not_Active
    [Documentation]    *Name:*
    ...    PUT-API_TP_CS_Set_UC_Elab_Users_1
    ...
    ...    *Description:*
    ...    UseCase_Elaborate: Verify success when status passed is identical
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    PUT5
    REST_NOAUTH_Random_Active_Owner_OR_Shared
    REST_AuthToken
    PUT_TalentPool_Candidate_Status_Set    Title    200

PUT-API_TalentPool_Rename_Not_Active
    [Documentation]    *Name:*
    ...    PUT-API_TP_CS_Set_UC_Elab_Users_1
    ...
    ...    *Description:*
    ...    UseCase_Elaborate: Verify success when status passed is identical
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    PUT6
    REST_NOAUTH_Random_Not_Active_Owner_OR_Shared
    REST_AuthToken
    PUT_TalentPool_Rename_Access_Not_Active    test 2    Title    200

PUT-APIi_TalentPool_Candidate_Status_Set_UseCase_Base_InputVsUserDatabase
    [Documentation]    *Name:*
    ...    PUT-API_TP_CS_Set_UC_Elab_Users_1
    ...
    ...    *Description:*
    ...    UseCase_Elaborate: Verify success when status passed is identical
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    PUT7
    REST_NOAUTH_Random_Active_Owner_OR_Shared
    REST_AuthToken
    PUT_TalentPool_Candidate_Status_Set    test 2    Title
