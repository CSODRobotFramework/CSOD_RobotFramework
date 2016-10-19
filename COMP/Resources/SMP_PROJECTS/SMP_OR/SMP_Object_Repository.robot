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
