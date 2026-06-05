*** Settings ***
Library     SeleniumLibrary
Resource    ../Keywords/Login_keywords.robot
Resource    ../Resources/Login_variables.robot

*** Keywords ***
Open Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Window Size    1920    1080
    Maximize Browser Window

    Wait Until Element Is Visible    id=username
    Wait Until Element Is Visible    id=password

    Page Should Contain    Login Page


Login With Credentials
    [Arguments]    ${username}    ${password}

    Input Text        id=username    ${username}
    Input Password    id=password    ${password}

    Click Button      ${LOGIN_BUTTON}


Verify Successful Login
    Wait Until Location Is
    ...    https://practice.expandtesting.com/secure

    Page Should Contain
    ...    You logged into a secure area!

    Page Should Contain Element
    ...    ${LOGOUT_LINK}


Verify Invalid Username Error
    Wait Until Page Contains
    ...    Your username is invalid!

    Location Should Contain
    ...    login


Verify Invalid Password Error
    Wait Until Page Contains
    ...    Your password is invalid!

    Location Should Contain
    ...    login