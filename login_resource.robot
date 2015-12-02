*** Settings ***
Library           Selenium2Library
Library           OperatingSystem

*** Variables ***
${USERNAME}   ${EMPTY}

*** Keywords ***
Create user
    [Arguments]    ${username}    ${password}
    Set Test Variable    ${USERNAME}     ${username}
    Run    tianjiayonghu ${username} editor ${password}

Remove user
    Run    shanchuyonghu ${USERNAME}

login with username "${username}" and password "${password}"
    Go to            http://127.0.0.1:9000/wp-login.php
    Input Text       user_login    ${username}
    Input Text       user_pass     ${password}
    Click Button     Log In

login successfully
    Wait Until Page Contains     Dashboard

login fail with message "${message}"
    Wait Until Page Contains    ${message}
