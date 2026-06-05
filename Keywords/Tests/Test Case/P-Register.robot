*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}           chrome
${BASE_URL}          https://practice.expandtesting.com/register
${Valid User}        testuserPPY
${Valid Password}    Pass@12345
${Invalid User}      DD
${Invalid Password}  999
${Empty Field}       ${EMPTY}

*** Test Cases ***

Test Case 001: Successful Registration
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Contains    id=version   e64cd80e
    Scroll Element Into View    id=version
    Input Text    id=username    ${Valid User}
    Input Password    id=password    ${Valid Password}
    Input Password    id=confirmPassword    ${Valid Password}
    Click Element    //*[@id="register"]/button
    Sleep    3s
    Element Text Should Be
    ...    id=flash
    ...    Successfully registered, you can log in now.
    Log To Console    Successfully registered, you can log in now.
    Close Browser
    
Test Case 002: Registration with Missing Username
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Contains    id=version   e64cd80e
    Scroll Element Into View    id=version
    Input Text    id=username    ${Empty Field}
    Input Password    id=password          ${Valid Password}
    Input Password    id=confirmPassword   ${Valid Password}
    Click Element    //*[@id="register"]/button
    Sleep    3s
    Element Text Should Be
    ...    id=flash
    ...    All fields are required.
    Log To Console    All fields are required.
    Close Browser


Test Case 003: Registration with Missing Password
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Contains    id=version   e64cd80e
    Scroll Element Into View    id=version
    Input Text        id=username          ${Valid User}
    Input Password    id=password          ${Empty Field} 
    Input Password    id=confirmPassword   ${Empty Field}
    Click Element    //*[@id="register"]/button
    Sleep    3s
    Element Text Should Be
    ...    id=flash
    ...    All fields are required.
    Log To Console    All fields are required.
    Close Browser

Test Case 004: Registration with Non-matching Passwords
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Contains    id=version   e64cd80e
    Scroll Element Into View    id=version
    Input Text        id=username          ${Valid User}
    Input Password    id=password          ${Valid Password}
    Input Password    id=confirmPassword   ${Invalid Password}
    Click Element    //*[@id="register"]/button
    Sleep    3s
    Element Text Should Be
    ...    id=flash
    ...    Passwords do not match.
    Log To Console    Passwords do not match.
    Close Browser


    