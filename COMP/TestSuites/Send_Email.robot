*** Settings ***
Library           GmailEmailLibrary

*** Test Cases ***
Send Email Has Attachment Test
    Send Mail With Attachment    geeslimmy@gmail.com    popeye123    geefung@gmail.com    Python Email Test    This is python test    C:\\Users\\gfung\\.jenkins\\workspace\\COMP\\report.html

Send Email No Attachment Test
    Send Mail No Attachment    geeslimmy@gmail.com    popeye123    geefung@gmail.com    This is a test, this is a test    Test is in progress
