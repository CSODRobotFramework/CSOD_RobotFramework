*** Variables ***
${RNOAUTH_HOST}    QA052    # here we pass one variable 'default' in this case to control lots of variables with _default at the end.
${RNOAUTH_CUSTOM_CORP}    ${RNOAUTH_CUSTOM_CORP_${RNOAUTH_HOST}}    # Get Portal
${RNOAUTH_CUSTOM_USERID}    ${RNOAUTH_CUSTOM_USERID_${RNOAUTH_HOST}}    # Get UserID
${RNOAUTH_CUSTOM_CULTUREID}    ${RNOAUTH_CUSTOM_CULTUREID_${RNOAUTH_HOST}}    # Get User Culture ID
${RNOAUTH_CUSTOM_CORP_QA052}    qa052-auto-smp-api
${RNOAUTH_CUSTOM_USERID_QA052}    \    # This variable is coming from SQL query SQL_GET_USERID
${RNOAUTH_CUSTOM_CULTUREID_QA052}    \    # This variable is coming from SQL query SQL_GET_USER_CULTURE
