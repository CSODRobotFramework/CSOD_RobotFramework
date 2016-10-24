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
    [Tags]    POST    ASCII
    REST_NOAUTH
    REST_AuthToken
    ${bytes} =    Encode String To Bytes    <=>?@[\\]^_`{|}~¦ÇüéâäàåçêëèïîìæÆôöòûùÿ¢£¥PƒáíóúñÑª    ASCII    errors=replace
    Comment    ${bytes} =    Convert To Bytes    <=>?@[\\]^_`{|}~¦ÇüéâäàåçêëèïîìæÆôöòûùÿ¢£¥PƒáíóúñÑª
    POST_TalentPool_Create    ${bytes}    Title    200

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
    POST_TalentPool_Create    	\ º¿¬¬½¼¡«»¦¦¦¦¦¦¦++¦¦++++++--+-+¦¦++--¦-+----++++++    Title    200

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
    ${bytes} =    Convert To Bytes    ‘’“”–—˜™š›œžŸ¤¦¨©®¯³´¸U¾ÀÁÂÃÄÅÈÉÊËÌÍÎÏÐÒÓÔÕÖ×ØÙÚÛÜ
    POST_TalentPool_Create    ${bytes}    Title    200

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
    ${bytes} =    Encode String To Bytes    ÝÞãðýþ    ASCII    errors=replace
    Comment    ${bytes} =    Convert To Bytes    ÝÞãðýþ
    POST_TalentPool_Create    ${bytes}    Title    200

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
    ${bytes} =    Encode String To Bytes    ёъяшертыуиопющэасдфгчйкльжзхцвбнмЁЪЯШЕРТЫУИОПЮЩЭЖЬ    ASCII    errors=replace
    Comment    ${bytes} =    Convert To Bytes    ÝÞãðýþ
    POST_TalentPool_Create    ${bytes}    Title    200

POST-API_TPC_Foreign_Arabic
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
    ${bytes} =    Encode String To Bytes    \    ASCII    errors=replace
    Comment    ${bytes} =    Convert To Bytes    ÝÞãðýþ
    POST_TalentPool_Create    ${bytes}    Title    200

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
