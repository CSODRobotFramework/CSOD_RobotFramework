*** Settings ***
Library           SQLlibrary
Library           HttpLibrary.HTTP
Resource          ../Resources/SMP_PROJECTS/SMP_Resources.robot

*** Test Cases ***
SQL-TestCase
    REST_NOAUTH
    REST_AuthToken
    POST_TalentPool_Create    InnocentName
    Comment    POST_TalentPool_Create
    Comment    Connect    LAX-QA-CLT52A\\SQLA    ces_QA052-AUTO-SMP-API
    Comment    ${ResultSQL1}=    Execute    Select * from users where user_id = 42
    Comment    Log    ${ResultSQL1}
    Comment    ${ResultSQL2}=    Execute Raw    SELECT TOP 1 user_id FROM users WHERE culture_lang_id IS NOT NULL AND status_id = 1 AND user_id IN (SELECT DISTINCT owner_id FROM ou WHERE type_id = 131072) ORDER BY NEWID()
    Comment    Log    ${ResultSQL2}
    Comment    ${ResultSQL3}=    Execute Raw    SELECT culture_lang_id FROM users WHERE user_id = ${ResultSQL2}
    Comment    Log    ${ResultSQL3}
    Comment    Comment    Execute    update cmp_adjustment set active=1 where adjustment_id in (5,6,7,8,10,11,12,43,84,168,169,170,175,179,180,181,182,284,286,328,348,349,350,351,352,359,360,361,364,382,383,384,385,386,387,389,458,515,516,517,518,523,524,527,528,529,530,637,629,630,632,633,634,635,636,638,639,713)
    Comment    close
