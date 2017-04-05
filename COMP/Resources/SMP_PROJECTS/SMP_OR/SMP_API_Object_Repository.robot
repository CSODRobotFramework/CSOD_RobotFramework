*** Variables ***
${smp.hosturl_qa05}    http://laxqarexmt.office.cyberu.com    # Release
${smp.hosturl_qa03}    http://laxqanrexmt.office.cyberu.com    # Next Release
${smp.hosturl_qa01}    http://laxqapexmt.office.cyberu.com    # Patch
${smp.server_qa01}    LAX-QA-CLT12A\\SQLA    # Patch Server
${smp.server_qa05}    LAX-QA-CLT52A\\SQLA    # Release Server
${smp.server_qa03}    LAX-QA-CLT32A\\SQLA    # Next Release Server
${smp.database_qa01}    ces_QA01-AUTO-SMP-API    # Patch Database
${smp.database_qa05}    ces_QA052-AUTO-SMP-API    # Release Database
${smp.database_qa03}    ces_QA03-AUTO-SMP-API    # Next Release Database -- NOTE: This database has not been created yet.
${smp.corpname_qa052}    qa052-auto-smp-api    # Release Corp Portal Name
${smp.corpname_qa01}    qa01-auto-smp-api    # Patch Corp Portal Name
${smp.corpname_qa03}    qa03-auto-smp-api    # Next Release Corp Portal Name
${smp.randomTitle}    ${EMPTY}
${smp_suite_title}    SMP API TEST SUITE
# TEST RUNTIME VARIABLES
${api_global_parameter_profile}    qa052    # Here we can use qa052 or qa01 as a pybot -v variable argument.
${api_global_parameter_corpid}    ${api_global_parameter_corpid_${api_global_parameter_profile}}
${api_global_parameter_userid}    ${api_global_parameter_userid_${api_global_parameter_profile}}
${api_global_parameter_cultureid}    ${api_global_parameter_cultureid_${api_global_parameter_profile}}
${api_global_parameter_corpid_qa052}    x-csod-corp-id    # New API Parameters 3/27/2017
${api_global_parameter_userid_qa052}    x-csod-user-id    # New API Parameters 3/27/2017
${api_global_parameter_cultureid_qa052}    x-csod-default-culture-id    # New API Parameters 3/27/2017
${api_global_parameter_corpid_qa01}    X-CORP    # Old API Parameters
${api_global_parameter_userid_qa01}    X-USERID    # Old API Parameters
${api_global_parameter_cultureid_qa01}    X-CULTUREID    # Old API Parameters
