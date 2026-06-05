*** Variables ***
${BROWSER}              chrome
${BASE_URL}             https://practice.expandtesting.com/register

${VALID_USER}           testuserPAQA
${VALID_PASSWORD}       Pass@12345

${INVALID_PASSWORD}     9999
${EMPTY_FIELD}          ${EMPTY}

${REGISTER_BUTTON}      xpath=//*[@id="register"]/button
${FLASH_MESSAGE}        id=flash