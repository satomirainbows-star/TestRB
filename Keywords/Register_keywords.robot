*** Settings ***
Library     SeleniumLibrary
Resource    ../Keywords/Register_keywords.robot
Resource    ../Resources/Register_variables.robot


*** Keywords ***
Open Register Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Scroll Element Into View    xpath=//*[@id="register"]/button
    Wait Until Element Is Visible    id=username
    Wait Until Element Is Visible    id=password
    Wait Until Element Is Visible    id=confirmPassword


Register User
    [Arguments]    ${username}    ${password}    ${confirm_password}

    Input Text        id=username           ${username}
    Input Password    id=password           ${password}
    Input Password    id=confirmPassword    ${confirm_password}
    Scroll Element Into View    id=version
    Click Element     ${REGISTER_BUTTON}


Verify Flash Message
    [Arguments]    ${expected_message}

    Wait Until Element Is Visible    ${FLASH_MESSAGE}

    Element Should Contain
    ...    ${FLASH_MESSAGE}
    ...    ${expected_message}
    ...    Log To Console    ${expected_message}