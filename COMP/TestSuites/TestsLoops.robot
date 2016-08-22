*** Settings ***
Default Tags
Library           String

*** Variables ***
${finalstring}    ${EMPTY}
@{Values}         1    2    3    4    5    6    7
...               8    9    10    11    12
${Var}            ${EMPTY}

*** Test Cases ***
For-Loop-In-Range
    [Tags]    NoTest
    : FOR    ${INDEX}    IN RANGE    1    10
    \    Log    ${INDEX}
    Log    For loop is over

For-Loop-Elements
    [Tags]    NoTest
    @{StringItems}    Create List    Selenium    Master    Test    Automation
    : FOR    ${Item}    IN    @{StringItems}
    \    Log    ${Item}
    Log    Item iteration is over

For-Loop-Exiting
    [Tags]    NoTest
    @{ITEMS}    Create List    1    2    3
    : FOR    ${ELEMENT}    IN    @{ITEMS}
    \    Log    ${ELEMENT}
    \    Run Keyword If    '${ELEMENT}' == '2'    Exit For Loop
    Log    Exit For Loop triggered at the second element

Concatenate-String
    ${finalstring}    Catenate    Hello    World
    Log    ${finalstring}
    ${finalstring}    Catenate    SEPARATOR=---    Hello    World
    Log    ${finalstring}
    ${finalstring}    Catenate    SEPARATOR=:    Hello    World
    Log    ${finalstring}
