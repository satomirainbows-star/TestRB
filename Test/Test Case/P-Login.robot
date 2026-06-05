
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}           chrome
${BASE_URL}          https://practice.expandtesting.com/login
${Valid User}        practice
${Valid Password}    SuperSecretPassword!
${Invalid User}      DD
${Invalid Password}  999
${Empty Field}       ${EMPTY}

*** Test Cases ***
Test Case 001: Successful Login
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    text=Login Page
    Wait Until Element Contains    id=version   e64cd80e
    Scroll Element Into View    id=version
    Input Text    id=username    ${Valid User}
    Input Password  id=password    ${Valid Password}
    Sleep  3s
    Click Button    id=submit-login
    Sleep  3s
    Page Should Contain  You logged into a secure area! 
    Location Should Be    https://practice.expandtesting.com/secure
    Scroll Element Into View    id=version
    Sleep  3s
    Page Should Contain Element  xpath=//a[@href='/logout']
    Close Browser


Test Case 002: Invalid Username
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    text=Login Page
    Wait Until Element Contains    id=version   e64cd80e
    Scroll Element Into View    id=version
    Input Text        id=username    ${Invalid User}
    Input Password    id=password    ${Valid Password}
    Sleep  3s
    Click Button    id=submit-login  
    Sleep  3s 
    Scroll Element Into View    id=version
    Sleep  3s
    Page Should Contain   Your username is invalid!
    Location Should Contain    login
    Close Browser


Test Case 003: Invalid Password
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Page Should Contain    text=Login Page
    Wait Until Element Contains    id=version   e64cd80e
    Scroll Element Into View    id=version
    Input Text        id=username    ${Valid User}
    Input Password    id=password    ${Invalid Password}
    Sleep  3s
    Click Button    id=submit-login   
    Sleep  3s
    Scroll Element Into View    id=version
    Sleep  3s
    Page Should Contain    Your password is invalid!
    Location Should Contain    login
    Close Browser
