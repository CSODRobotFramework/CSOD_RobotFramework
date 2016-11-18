*** Settings ***
Library           SQLlibrary
Library           HttpLibrary.HTTP
Resource          ../Resources/SMP_PROJECTS/SMP_Resources.robot
Library           requests
Library           RequestsLibrary

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
    POST_TalentPool_Create_Empty_String    ${EMPTY}    Title    400

POST-API_TPC_Length_1
    [Documentation]    *Name:*
    ...    API_TalentPool_Create_Length_1
    ...
    ...    *Description:*
    ...    verify success when title length is 1
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
    ...    API_TalentPool_Create_Length_50
    ...
    ...    *Description:*
    ...    verify success when title length is 50
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
    ...    API_TalentPool_Create_Length_51
    ...
    ...    *Description:*
    ...    verify failure when title length is 51
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
    ...    API_TalentPool_Create_Trim_Space
    ...
    ...    *Description:*
    ...    verify trimming with only space
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
    POST_TalentPool_Create_Empty_String    ${SPACE * 3}    Title    400

POST-API_TPC_Trim_TabSpace
    [Documentation]    *Name:*
    ...    API_TalentPool_Create_Trim_TabSpace
    ...
    ...    *Description:*
    ...    verify trimming with only tab-space
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
    POST_TalentPool_Create_Empty_String    ${EMPTY}    Title    400

POST-API_TPC_Trim_Leading
    [Documentation]    *Name:*
    ...    API_TalentPool_Create_Trim_Leading
    ...
    ...    *Description:*
    ...    verify trimming leading spaces
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
    ...    API_TalentPool_Create_Trim_Trailing
    ...
    ...    *Description:*
    ...    verify trimming trailing spaces
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
    ...    API_TalentPool_Create_Trim_Middle
    ...
    ...    *Description:*
    ...    verify no trimming middle spaces
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
    ...    API_TalentPool_Create_Trim_SpaceAnd50
    ...
    ...    *Description:*
    ...    verify trimming happens before submissions attempt
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
    ...    API_TalentPool_Create_Security_Script
    ...
    ...    *Description:*
    ...    verify script injection is allowed
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
    ...    API_TalentPool_Create_Security_SQL
    ...
    ...    *Description:*
    ...    verify sql injection fails
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
    ...    API_TalentPool_Create_Characters_Extended2
    ...
    ...    *Description:*
    ...    verify ASCII characters 2
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    ASCII
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    <=>?@^_`{|}~⌂ÇüéâäàåçêëèïîìæÆôöòûùÿ¢£¥₧ƒáíóúñÑª    Title    200

POST-API_TPC_Characters_Extended3
    [Documentation]    *Name:*
    ...    API_TalentPool_Create_Characters_Extended3
    ...
    ...    *Description:*
    ...    verify ASCII characters 3
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
    ...    API_TalentPool_Create_Characters_Extended4
    ...
    ...    *Description:*
    ...    verify ASCII characters 4
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
    ...    API_TalentPool_Create_Characters_Extended5
    ...
    ...    *Description:*
    ...    verify ASCII characters 5
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
    ...    API_TalentPool_Create_Characters_Extended6
    ...
    ...    *Description:*
    ...    verify ASCII characters 6
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
    ...    API_TalentPool_Create_Foreign_Russian
    ...
    ...    *Description:*
    ...    verify russian alphabet
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
    ...    API_TalentPool_Create_Foreign_Arabic
    ...
    ...    *Description:*
    ...    verify arabic alphabet
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
    ...    API_TalentPool_Create_Access_DNE
    ...
    ...    *Description:*
    ...    verify failure when user does not exist
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
    POST_TalentPool_Create_Empty_String    InnocentName    Title    500

GET-API_TPC_GET_Return_ID_Expected
    [Documentation]    *Name:*
    ...    API_TalentPool_Get_Return_ID_Expected
    ...
    ...    *Description:*
    ...    verify the id passed is matching the id returned
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
    ...    API_TalentPool_Get_Return_Title_Happy
    ...
    ...    *Description:*
    ...    verify a random name matches
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
    ...    API_TalentPool_Get_Return_Title_Length_1
    ...
    ...    *Description:*
    ...    verify success when title length is 1
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
    ...    API_TalentPool_Get_Return_Title_Length_50
    ...
    ...    *Description:*
    ...    verify success when title length is 50
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
    ...    API_TalentPool_Get_Return_Title_SQL
    ...
    ...    *Description:*
    ...    verify sql injection fails
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
    ...    TP_Get_Ret_Title_sec_script
    ...
    ...    *Description:*
    ...    verify script injection is allowed
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
    ...    API_TPC_Extended1
    ...
    ...    *Description:*
    ...    verify ASCII characters 1
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
    ...    API_TalentPool_Get_Return_Title_Characters_Extended2
    ...
    ...    *Description:*
    ...    verify ASCII characters 2
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
    ...    API_TalentPool_Get_Return_Title_Characters_Extended3
    ...
    ...    *Description:*
    ...    verify ASCII characters 3
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
    ...    API_TalentPool_Get_Return_Title_Characters_Extended5
    ...
    ...    *Description:*
    ...    verify ASCII characters 5
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
    ...    API_TalentPool_Get_Return_Title_Characters_Extended6
    ...
    ...    *Description:*
    ...    verify ASCII characters 6
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
    ...    API_TP_Get_Return_Title_Char_Foreign_Russian
    ...
    ...    *Description:*
    ...    verify russian alphabet
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
    ...    API_TP_Get_Return_Title_Char_Foreign_Arabic
    ...
    ...    *Description:*
    ...    verify arabic alphabet
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
    ...    API_TP_Get_Input_TP_DNE
    ...
    ...    *Description:*
    ...    verify failure when talent pool id provided does not exist
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
    ...    API_TP_Get_Input_User_DNE
    ...
    ...    *Description:*
    ...    verify failure when user provided does not exist
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
    ...    API_TP_Get_Input_User_DidNotCreate
    ...
    ...    *Description:*
    ...    verify failure when user provided did not create the talent pool
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
    ...    API_TPC_Security_Script
    ...
    ...    *Description:*
    ...    verify script injection is allowed
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
    ...    API_TPC_Add_Already_Added_Subset
    ...
    ...    *Description:*
    ...    Verify success when subset of added users are already added
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
    ...    API_TPC_Add_AlreadyAdded_Single
    ...
    ...    *Description:*
    ...    Verify success when single added user is already added
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
    ...    Api_TPC_Add_AlreadyAdded_All
    ...
    ...    *Description:*
    ...    Verify success when multiple added users are already added
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
    ...    API_TPC_Add_Access_NoVis_SubSet
    ...
    ...    *Description:*
    ...    Verify failure when no actor does not have Visibility on a subset of added multiple users
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
    ...    API_TPC_Add_2Users
    ...
    ...    *Description:*
    ...    Verify success when adding 2 users
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
    ...    API_TPC_Add_1Users
    ...
    ...    *Description:*
    ...    Verify success when adding 1 user
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
    ...    API_TPC_Add_0Users
    ...
    ...    *Description:*
    ...    Verify success when adding 0 users
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
    ...    API_TPC_Add_BaseCase_InputVsDatabase
    ...
    ...    *Description:*
    ...    Verify successful input user ends up in database
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
    ...    API_TPC_Add_BC_InputVsOutput_Value
    ...
    ...    *Description:*
    ...    Verify successful input user ends up in output
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
    [Tags]    PUT
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
    [Tags]    PUT
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
    [Tags]    PUT
    REST_NOAUTH_Random_Active_Owner
    REST_AuthToken
    PUT_TalentPool_Rename_Access_Owner    SimpleName    Title

PUT-API_TalentPool_Rename_Access_Not_Active
    [Documentation]    *Name:*
    ...    PUT-API_TP_Rename_Access_NotActive
    ...
    ...    *Description:*
    ...    Access: Verify failure when actor not active
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    PUT
    REST_NOAUTH_Random_Active_Owner_OR_Shared
    REST_AuthToken
    PUT_TalentPool_Candidate_Status_Set    Title    200

PUT-API_TalentPool_Rename_Not_Active
    [Documentation]    *Name:*
    ...    PUT-API_TP_Rename_Access_NotActive
    ...
    ...    *Description:*
    ...    Access: Verify failure when actor not active
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    PUT
    REST_NOAUTH_Random_Not_Active_Owner_OR_Shared
    REST_AuthToken
    PUT_TalentPool_Rename_Access_Not_Active    test 2    Title    200

PUT-API_TalentPool_Candidate_Status_Set_UseCase_Base_InputVsUserDatabase
    [Documentation]    *Name:*
    ...    PUT-API_TC_Status_Set_UC_Base_InputVsUDB
    ...
    ...    *Description:*
    ...    UseCase_Base: Verify provided user matches the new entry in database
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    PUT
    REST_NOAUTH_Random_Active_Owner_OR_Shared
    REST_AuthToken
    PUT_TalentPool_Candidate_Status_Set    test 2    Title

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

DELETE-API_TPC_Remove0Users
    [Tags]    put
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_0User
    Comment    Connect    ${RNOAUTH_CUSTOM_SERVER}    ${SQL_DB}
    Comment    ${SQL_TalentPoolId}=    Execute Raw    SELECT TOP 1 ou_id FROM ou WHERE ou.type_id = 131072 AND owner_id = ${SQL_GET_USERID} AND ou_id IN (SELECT ou_id FROM ou_user GROUP BY ou_id HAVING COUNT(ou_id) > 0) ORDER BY NEWID()
    Comment    Set Suite Variable    ${SQL_TalentPoolId}    ${SQL_TalentPoolId}
    Comment    ${SQL_UserToRemove1}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE user_id > 0 AND user_id IN (SELECT user_id FROM ou_user WHERE ou_id = ${SQL_TalentPoolId}) AND user_id NOT IN (SELECT owner_id FROM ou WHERE ou_id = ${SQL_TalentPoolId}) AND status_id = 1 ORDER BY NEWID()
    Comment    Set Suite Variable    ${SQL_UserToRemove1}    ${SQL_UserToRemove1}
    Comment    &{headers}=    Create Dictionary    Content-Type=application/json    X-CORP=${RNOAUTH_CUSTOM_CORP}    X-USERID=0${SQL_GET_USERID}    X-CULTUREID=0${SQL_GET_USER_CULTURE}
    Comment    Create Session    http    http://laxqarexmt.office.cyberu.com/talentpool-api    debug=3
    Comment    Set Suite Variable    ${body}    [{"UserId": ${SQL_UserToRemove1}}]
    Comment    ${SQL_CandidateCountBefore}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Comment    ${resp}=    RequestsLibrary.Delete Request    http    /talentpools/${SQL_TalentPoolId}/candidates    data=${body}    headers=${headers}
    Comment    ${SQL_CandidateCountAfter}=    Execute Raw    SELECT COUNT (user_id) FROM ou_user WHERE ou_id=${SQL_TalentPoolId}
    Comment    Set Suite Variable    ${SQL_CandidateCountAfter}    ${SQL_CandidateCountAfter}
    Comment    ${SQL_NUM}=    Evaluate    ${SQL_CandidateCountBefore}-1
    Comment    Log    ${SQL_NUM}
    Comment    Run Keyword If    '${SQL_CandidateCountAfter}'=='${SQL_NUM}'    Utility Set Test Message    The ${SQL_CandidateCountAfter} matches with ${SQL_NUM}
    Comment    Run Keyword If    '${SQL_CandidateCountAfter}'<>'${SQL_NUM}'    Fail    The ${SQL_CandidateCountAfter} did NOT matches with ${SQL_NUM}
    Comment    Log    END TEST

DELETE-API_TPC_Remove1Users
    [Tags]    put
    REST_NOAUTH
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_1User

DELETE-API_TPC_Remove_Access_DNE
    [Tags]    put
    REST_NOAUTH_NonExistentUser
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_Access_DNE

DELETE-API_TPC_Remove_Acc_NOT_TP_Owner
    [Tags]    put
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_Not_TP_Owner

Head Request
    [Tags]    head
    Create Session    httpbin    http://httpbin.org
    ${resp}=    Head Request    httpbin    /headers
    Should Be Equal As Strings    ${resp.status_code}    200

DELETE-API_TPC_Remove_AlreadyRemoved_All
    [Documentation]    *Name:*
    ...    Api_TPC_Remove_AlreadyRemoved_All
    ...
    ...    *Description:*
    ...    Verify success when multiple removed users are already removed
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    put
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_AlreadyRemoved_All
