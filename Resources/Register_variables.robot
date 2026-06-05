*** Variables ***
${BROWSER}              headlesschrome
${BASE_URL}             https://practice.expandtesting.com/register

${VALID_USER}           testuserGGSS
${VALID_PASSWORD}       Pass@12345

${INVALID_PASSWORD}     999
${EMPTY_FIELD}          ${EMPTY}

${REGISTER_BUTTON}      xpath=//*[@id="register"]/button
${FLASH_MESSAGE}        id=flash