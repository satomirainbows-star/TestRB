*** Variables ***
${BROWSER}             chrome
${BASE_URL}            https://practice.expandtesting.com/login

${VALID_USER}          practice
${VALID_PASSWORD}      SuperSecretPassword!

${INVALID_USER}        DD
${INVALID_PASSWORD}    999

${LOGIN_BUTTON}        id=submit-login
${LOGOUT_LINK}         xpath=//a[@href='/logout']