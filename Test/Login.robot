*** Settings ***
Resource    ../Keywords/Login_keywords.robot
Resource    ../Resources/Login_variables.robot

Test Setup       Open Login Page
Test Teardown    Close Browser

*** Test Cases ***
Test Case 001: Successful Login
    Login With Credentials
    ...    ${VALID_USER}
    ...    ${VALID_PASSWORD}

    Verify Successful Login

Test Case 002: Invalid Username
    Login With Credentials
    ...    ${INVALID_USER}
    ...    ${VALID_PASSWORD}

    Verify Invalid Username Error

Test Case 003: Invalid Password
    Login With Credentials
    ...    ${VALID_USER}
    ...    ${INVALID_PASSWORD}

    Verify Invalid Password Error
