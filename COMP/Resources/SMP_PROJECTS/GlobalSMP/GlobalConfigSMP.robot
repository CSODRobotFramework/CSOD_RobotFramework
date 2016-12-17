*** Variables ***
# TEST RUNTIME VARIABLES
${RNOAUTH_HOST}    QA052    # here we pass one variable 'default' in this case to control lots of variables with _default at the end.
${RNOAUTH_CUSTOM_SERVER}    ${RNOAUTH_CUSTOM_SERVER_${RNOAUTH_HOST}}    # Get DB Server
${SQL_DB}         ${SQL_DB_${RNOAUTH_HOST}}    # Get DataBase
${HTTP_CONTEXT}    ${HTTP_CONTEXT_${RNOAUTH_HOST}}    # Get Host Url
${RNOAUTH_CUSTOM_CORP}    ${RNOAUTH_CUSTOM_CORP_${RNOAUTH_HOST}}    # Get Portal
${RNOAUTH_CUSTOM_USERID}    ${RNOAUTH_CUSTOM_USERID_${RNOAUTH_HOST}}    # Get UserID
${RNOAUTH_CUSTOM_CULTUREID}    ${RNOAUTH_CUSTOM_CULTUREID_${RNOAUTH_HOST}}    # Get User Culture ID
${HTTP_CONTEXT_NORMAL}    ${HTTP_CONTEXT_NORMAL_${RNOAUTH_HOST}}    # Get Host Url For RequestLibrary.py
${HTTP_CONTEXT_CSOD_AUTH}    ${HTTP_CONTEXT_CSOD_AUTH_${RNOAUTH_HOST}}
# QA052
${RNOAUTH_CUSTOM_SERVER_QA052}    LAX-QA-CLT52A\\SQLA
${SQL_DB_QA052}    ces_QA052-AUTO-SMP-API    # Release Database
${RNOAUTH_CUSTOM_CORP_QA052}    qa052-auto-smp-api
${RNOAUTH_CUSTOM_USERID_QA052}    \    # This variable is coming from SQL query SQL_GET_USERID
${RNOAUTH_CUSTOM_CULTUREID_QA052}    \    # This variable is coming from SQL query SQL_GET_USER_CULTURE
${HTTP_CONTEXT_QA052}    laxqarexmt.office.cyberu.com    # Release Host Url
${HTTP_CONTEXT_NORMAL_QA052}    http://laxqarexmt.office.cyberu.com/talentpool-api
${HTTP_CONTEXT_CSOD_AUTH_QA052}    http://laxqarexmt.office.cyberu.com/cornerstone-auth-api/v1
# QA01
${RNOAUTH_CUSTOM_CORP_QA01}    qa01-auto-smp-api
${RNOAUTH_CUSTOM_USERID_QA01}    1336    # This variable is coming from SQL query SQL_GET_USERID
${RNOAUTH_CUSTOM_CULTUREID_QA01}    1
${RNOAUTH_CUSTOM_SERVER_QA01}    LAX-QA-CLT12A\\SQLA
${SQL_DB_QA01}    ces_QA01-AUTO-SMP-API    # Patch Database
${HTTP_CONTEXT_QA01}    laxqapexmt.office.cyberu.com    # Patch Host Url
${HTTP_CONTEXT_NORMAL_QA01}    http://laxqapexmt.office.cyberu.com/talentpool-api
${HTTP_CONTEXT_CSOD_AUTH_QA01}    http://laxqapexmt.office.cyberu.com/cornerstone-auth-api/v1
# QA052_REQUEST_LIB
${RNOAUTH_CUSTOM_SERVER_QA052_RL}    LAX-QA-CLT52A\\SQLA
${SQL_DB_QA052_RL}    ces_QA052-AUTO-SMP-API    # Release Database
${RNOAUTH_CUSTOM_CORP_QA052_RL}    qa052-auto-smp-api
${RNOAUTH_CUSTOM_USERID_QA052_RL}    \    # This variable is coming from SQL query SQL_GET_USERID
${RNOAUTH_CUSTOM_CULTUREID_QA052_RL}    \    # This variable is coming from SQL query SQL_GET_USER_CULTURE
${HTTP_CONTEXT_QA052_RL}    laxqarexmt.office.cyberu.com    # Release Full Host Url Only used with RequestsLibrary.py
${HTTP_CONTEXT_NORMAL_QA052_RL}    http://laxqarexmt.office.cyberu.com/talentpool-api    # This is to be used only with RequestsLibrary.py
${HTTP_CONTEXT_CSOD_AUTH_QA052_RL}    http://laxqarexmt.office.cyberu.com/cornerstone-auth-api/v1    # This is to be used only with RequestsLibrary.py
