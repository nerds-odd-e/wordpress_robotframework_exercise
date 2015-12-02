*** Settings ***
Library           Selenium2Library
Library           OperatingSystem

Test Teardown     Remove user

*** Variables ***
${USERNAME}   ${EMPTY}

*** Test Cases ***
Valid Login
    Given there is a user "jack" and his password is "s3cr3t"
    When login with username "jack" and password "s3cr3t"
    Then login successfully

Login with invalid password
    Given there is a user "jack" and his password is "s3cr3t"
    When login with username "jack" and password "invalid_password"
    Then login fail with message "ERROR: The password you entered for the username jack is incorrect."

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

Remove user
    Close Browser
    Run    shanchuyonghu ${USERNAME}

login fail with message "${message}"
    Page Should Contain    ${message}
