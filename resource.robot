*** Settings ***
Library           Selenium2Library

*** Variables ***
${SERVER}         127.0.0.1:9000
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     tom
${VALID PASSWORD}    s3cr3t
${LOGIN URL}      http://${SERVER}/wp-login.php
${WELCOME URL}    http://${SERVER}/wp-admin/

*** Keywords ***
Open Browser To Login Page
    Open Browser     about:blank
    Go To Login Page
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Go To Login Page
    Go To    ${LOGIN URL}

Input Username
    [Arguments]    ${username}
    Input Text    user_login    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    user_pass    ${password}

Submit Credentials
    Click Element    wp-submit

Welcome Page Should Be Open
    Page Should Contain   Dashboard
