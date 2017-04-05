*** Settings ***
Documentation     *INSTRUCTIONS: To Run this dynamically add the following line to the Run tab arguments text box area.*
...
...
...
...               *To Use with TestRail use the following:*
...
...               *Patch*
...               -d TestResults -v RNOAUTH_HOST:QA01 --listener TestRailListener:2386
...               -d TestResults -v RNOAUTH_HOST:QA01 -v api_global_parameter_profile:qa01 \ --listener TestRailListener:2386
...
...               *Release*
...               -d TestResults -v RNOAUTH_HOST:QA052 --listener TestRailListener:479
...               -d TestResults -v RNOAUTH_HOST:QA052_RL -v api_global_parameter_profile:qa052 \ --listener TestRailListener:479
...
...               *Next Release*
...               -d TestResults -v RNOAUTH_HOST:QA03 --listener TestRailListener:479
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
    [Tags]    testrailid=24402
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
    [Tags]    POST    testrailid=24403
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
    [Tags]    POST    NEGATIVETEST    testrailid=24404
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
    [Tags]    POST    testrailid=24405
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
    [Tags]    POST    testrailid=24406
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
    [Tags]    POST    NEGATIVETEST    testrailid=24407
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
    [Tags]    POST    NEGATIVETEST    testrailid=24408
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
    [Tags]    POST    NEGATIVETEST    testrailid=24409
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
    [Tags]    POST    testrailid=24410
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
    [Tags]    POST    testrailid=24411
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
    [Tags]    POST    testrailid=24412
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
    [Tags]    POST    testrailid=24413
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
    [Tags]    POST    testrailid=24414
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
    [Tags]    POST    testrailid=24415
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
    [Tags]    ASCII    testrailid=24416
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
    [Tags]    POST    ASCII    testrailid=24417
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
    [Tags]    POST    ASCII    testrailid=24418
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
    [Tags]    POST    ASCII    testrailid=24419
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
    [Tags]    POST    ASCII    testrailid=24420
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
    [Tags]    POST    ASCII    testrailid=24421
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
    [Tags]    POST    ASCII    testrailid=24422
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
    [Tags]    POST    NEGATIVETEST    testrailid=24423
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
    [Tags]    POST    testrailid=24424
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
    [Tags]    POST    testrailid=24425
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
    [Tags]    POST    testrailid=24426
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
    [Tags]    POST    testrailid=24427
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
    [Tags]    POST    testrailid=24428
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
    [Tags]    POST    testrailid=24429
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
    [Tags]    POST    testrailid=24430
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
    [Tags]    POST    testrailid=24431
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
    [Tags]    POST    testrailid=24432
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
    [Tags]    POST    testrailid=24433
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
    [Tags]    POST    testrailid=24434
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
    [Tags]    POST    testrailid=24435
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
    [Tags]    POST    testrailid=24436
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
    [Tags]    POST    testrailid=24437
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
    [Tags]    POST    testrailid=24438
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
    [Tags]    POST    testrailid=24439
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
    [Tags]    POST    testrailid=24440
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
    [Tags]    POST    testrailid=24441
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
    [Tags]    POST    testrailid=24442
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
    [Tags]    POST3    testrailid=24443
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
    [Tags]    POST3    testrailid=24444
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
    [Tags]    USER    testrailid=24445
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
    [Tags]    USER11    testrailid=24446
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
    [Tags]    USER12    testrailid=24447
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
    [Tags]    DB    testrailid=24448
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
    [Tags]    DBV    testrailid=24449
    REST_NOAUTH_User_With_Most_Talent_Pools
    REST_AuthToken
    POST_TalentPool_BaseCase_InputVsDataBase_Value    Title    200

POST-API_TP_Grp_Create_UseCase_Elab_AlreadyExists
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
    [Tags]    POST    testrailid=24450
    REST_NOAUTH_Random_Active_Owner_OR_Shared
    REST_AuthToken
    POST_TalentPool_Group_Create    400

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
    [Tags]    PUT    testrailid=24451
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
    [Tags]    PUT    testrailid=24452
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
    [Tags]    PUT    testrailid=24453
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
    [Tags]    PUT    testrailid=24454
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
    [Tags]    PUT    testrailid=24455
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
    [Tags]    PUT    testrailid=24456
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
    [Tags]    PUT    testrailid=24457
    REST_NOAUTH_Random_Active_Owner_OR_Shared
    REST_AuthToken
    PUT_TalentPool_Candidate_Status_Set    test 2    Title

PUT-API_TPC_Status_Set_UC_Elaborate_Status_Value_Placed
    [Tags]    PUT    testrailid=24458
    REST_NOAUTH_Random_Active_Owner_OR_Shared
    REST_AuthToken
    PUT_TalentPool_Candidate_Status_Set_Value_Placed    1024    200

PUT-API_TPC_Status_Set_UC_Elab_Users_2
    [Tags]    PUT    testrailid=24475
    REST_NOAUTH_Random_Active_Owner_OR_Shared_With_2_Candidates
    REST_AuthToken
    PUT_TalentPool_Candidate_Status_Set_Value_Placed    1024    200

DELETE-API_TPC_Remove0Users
    [Documentation]    *Name:*
    ...    Api_TPC_Remove_0Users
    ...
    ...    *Description:*
    ...    Verify success when removing 0 users
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    DELETE    NEGATIVE    testrailid=24459
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
    [Documentation]    *Name:*
    ...    Api_TPC_Remove_1Users
    ...
    ...    *Description:*
    ...    Verify success when removing 1 user
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    DELETE    testrailid=24460
    REST_NOAUTH
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_1User

DELETE-API_TPC_Remove_Access_DNE
    [Documentation]    *Name:*
    ...    Api_TPC_Remove_Access_DNE
    ...
    ...    *Description:*
    ...    Verify failure when acting user does not exist
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    DELETE    NEGATIVE    testrailid=24461
    REST_NOAUTH_NonExistentUser
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_Access_DNE

DELETE-API_TPC_Remove_Acc_NOT_TP_Owner
    [Documentation]    *Name:*
    ...    Api_TPC_Remove_Acc_NotTPOwner
    ...
    ...    *Description:*
    ...    Verify failure when acting user is not the talent pool owner
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    DELETE    testrailid=24462
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_Not_TP_Owner

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
    [Tags]    DELETE    testrailid=24463
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_AlreadyRemoved_All

DELETE-API_TPC_Remove_AlreadyRemoved_Single
    [Documentation]    *Name:*
    ...    Api_TPC_Remove_AlreadyRemoved_Single
    ...
    ...    *Description:*
    ...    Verify success when single removed user is already removed
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    DELETE    testrailid=24464
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_AlreadyRemoved_Single

DELETE-API_TPC_Remove_AlreadyRemoved_SubSet
    [Documentation]    *Name:*
    ...    Api_TPC_Remove_AlreadyRemoved_SubSet
    ...
    ...    *Description:*
    ...    Verify success when subset of removed users are already removed
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    DELETE    testrailid=24465
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_AlreadyRemoved_SubSet

DELETE-APIi_TPC_Remove_BaseCase_InputVsDatabase
    [Documentation]    *Name:*
    ...    Api_TPC_Remove_AlreadyRemoved_SubSet
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
    [Tags]    DELETE    testrailid=24466
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_BaseCase_InputVsDatabase

DELETE-API_TPC_Remove_BaseCase_InputVsOutput
    [Documentation]    *Name:*
    ...    Api_TPC_Remove_AlreadyRemoved_Single
    ...
    ...    *Description:*
    ...    Verify success when single removed user is already removed
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    DELETE    JSONVFY    testrailid=24467
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_BaseCase_InputVsOutput

DELETE-API_TPC_Remove_DNEUser_All
    [Documentation]    *Name:*
    ...    Api_TPC_Remove_DNEUser_All
    ...
    ...    *Description:*
    ...    Verify failure when multiple removed users do not exist
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    DELETE    testrailid=24468
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_DNEUser_All

DELETE-API_TPC_Remove_DNEUser_Single
    [Documentation]    *Name:*
    ...    Api_TPC_Remove_DNEUser_Single
    ...
    ...    *Description:*
    ...    Verify failure when single removed user does not exist
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    DELETE    testrailid=24469
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_DNEUser_Single

DELETE-API_TPC_Remove_DNEUser_SubSet
    [Documentation]    *Name:*
    ...    Api_TPC_Remove_DNEUser_SubSet
    ...
    ...    *Description:*
    ...    Verify failure when subset of removed users do not exist
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    DELETE    testrailid=24470
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_DNEUser_SubSet

DELETE-API_TP_Delete_Access_DoesNotExist
    [Documentation]    *Name:*
    ...    Api_TP_Delete_Access_DoesNotExist
    ...
    ...    *Description:*
    ...    Access: Verify error when user id is not in database
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    DELETE    testrailid=24471
    REST_NOAUTH_NonExistentUser
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Delete_Access_DoesNotExist    401

DELETE-API_TP_Delete_Access_NotOwner
    [Documentation]    *Name:*
    ...    Api_TP_Delete_Access_NotOwner
    ...
    ...    *Description:*
    ...    Access: Verify error when user id is not for talent pool owner
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    DELETE    testrailid=24472
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Delete_Access_NotOwner    401

DELETE-API_TP_Del_Input_TPId_DoesNotExist
    [Documentation]    *Name:*
    ...    Api_TP_Del_Input_TPId_DoesNotExist
    ...
    ...    *Description:*
    ...    Input: Verify error when talent pool id is not in database
    ...
    ...    *Run Arguments:*
    ...    -d TestResults -v RNOAUTH_HOST:QA01
    ...
    ...
    ...    *NOTE:* The Run Arguments will select what set of data to run durning run time by providing QA01 or QA052 or QA03 as the environment after the scaler RNOAUTH_HOST:
    ...    -d TestResults will put the output report.html and log.html in a folder named TestResults.
    [Tags]    DELETE    testrailid=24473
    REST_NOAUTH_Random_Users_with_Talent_Pools
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Delete_Input_TPId_DoesNotExist    404

DELETE-API_TPC_Remove_BaseCase_InputVsOutput_Value
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
    [Tags]    DBV    testrailid=24474
    REST_NOAUTH_Random_Active_Owner_OR_Shared_With_Candidates
    REST_AuthToken_RequestsLibrary
    DELETE_TalentPool_Candidates_Remove_2    200
