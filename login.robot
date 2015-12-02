*** Settings ***
Resource    login_resource.robot

Test setup       Create user
Test Teardown    Remove user

*** Test Cases ***
Valid Login
    When login with username "jack" and password "s3cr3t"
    Then login successfully

Login fail    [Template]    Invalid Login
    jack   ${EMPTY}             ERROR: The password field is empty.
    jack   invalid_password     ERROR: The password you entered for the username jack is incorrect.
    invalid_user  any_passwd    ERROR: Invalid username.

*** Keywords ***
Create user
    Open Browser    ${EMPTY}
    there is a user "jack" and his password is "s3cr3t"

Remove user
    Close Browser
    Run    shanchuyonghu ${USERNAME}

Invalid Login
    [Arguments]    ${username}    ${password}    ${message}
    When login with username "${username}" and password "${password}"
    Then login fail with message "${message}"
