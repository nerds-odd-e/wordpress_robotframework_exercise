*** Settings ***
Library           Selenium2Library
Library           OperatingSystem

*** Variables ***
${USERNAME}   ${EMPTY}

*** Keywords ***
there is a user "${username}" and his password is "${password}"
    Set Test Variable    ${USERNAME}     ${username}
    Create user          ${USERNAME}     ${password}

Create user
    [Arguments]    ${username}    ${password}
    Run    tianjiayonghu ${username} editor ${password}

login with username "${username}" and password "${password}"
    Open Browser     http://127.0.0.1:9000/wp-login.php
    Input Text       user_login    ${username}
    Input Text       user_pass     ${password}
    Click Button     Log In

login successfully
    Page Should Contain     Dashboard

login fail with message "${message}"
    Page Should Contain    ${message}
