*** Variables ***
# TEST RUNTIME VARIABLES
${RNOAUTH_HOST}    QA052    # here we pass one variable 'default' in this case to control lots of variables with _default at the end.
${RNOAUTH_CUSTOM_SERVER}    ${RNOAUTH_CUSTOM_SERVER_${RNOAUTH_HOST}}    # Get DB Server
${SQL_DB}         ${SQL_DB_${RNOAUTH_HOST}}    # Get DataBase
${HTTP_CONTEXT}    ${HTTP_CONTEXT_${RNOAUTH_HOST}}    # Get Host Url
${RNOAUTH_CUSTOM_CORP}    ${RNOAUTH_CUSTOM_CORP_${RNOAUTH_HOST}}    # Get Portal
${RNOAUTH_CUSTOM_USERID}    ${RNOAUTH_CUSTOM_USERID_${RNOAUTH_HOST}}    # Get UserID
${RNOAUTH_CUSTOM_CULTUREID}    ${RNOAUTH_CUSTOM_CULTUREID_${RNOAUTH_HOST}}    # Get User Culture ID
# QA052
${RNOAUTH_CUSTOM_SERVER_QA052}    LAX-QA-CLT52A\\SQLA
${SQL_DB_QA052}    ces_QA052-AUTO-SMP-API    # Release Database
${RNOAUTH_CUSTOM_CORP_QA052}    qa052-auto-smp-api
${RNOAUTH_CUSTOM_USERID_QA052}    \    # This variable is coming from SQL query SQL_GET_USERID
${RNOAUTH_CUSTOM_CULTUREID_QA052}    \    # This variable is coming from SQL query SQL_GET_USER_CULTURE
${HTTP_CONTEXT_QA052}    laxqarexmt.office.cyberu.com    # Release Host Url
# QA01
${RNOAUTH_CUSTOM_CORP_QA01}    qa01-auto-smp-api
${RNOAUTH_CUSTOM_USERID_QA01}    1336    # This variable is coming from SQL query SQL_GET_USERID
${RNOAUTH_CUSTOM_CULTUREID_QA01}    1
${RNOAUTH_CUSTOM_SERVER_QA01}    LAX-QA-CLT12A\\SQLA
${SQL_DB_QA01}    ces_QA01-AUTO-SMP-API    # Patch Database
${HTTP_CONTEXT_QA01}    laxqapexmt.office.cyberu.com    # Patch Host Url
