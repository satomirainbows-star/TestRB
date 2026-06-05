*** Settings ***
Resource    ../Keywords/Register_keywords.robot
Resource    ../Resources/Register_variables.robot

Test Setup       Open Register Page
Test Teardown    Close Browser

*** Test Cases ***
Test Case 001: Successful Registration
    Register User
    ...    ${VALID_USER}
    ...    ${VALID_PASSWORD}
    ...    ${VALID_PASSWORD}

    Verify Flash Message
    ...    Successfully registered, you can log in now.


Test Case 002: Registration with Missing Username
    Register User
    ...    ${EMPTY_FIELD}
    ...    ${VALID_PASSWORD}
    ...    ${VALID_PASSWORD}

    Verify Flash Message
    ...    All fields are required.


Test Case 003: Registration with Missing Password
    Register User
    ...    ${VALID_USER}
    ...    ${EMPTY_FIELD}
    ...    ${EMPTY_FIELD}

    Verify Flash Message
    ...    All fields are required.


Test Case 004: Registration with Non-matching Passwords
    Register User
    ...    ${VALID_USER}
    ...    ${VALID_PASSWORD}
    ...    ${INVALID_PASSWORD}

    Verify Flash Message
    ...    Passwords do not match.