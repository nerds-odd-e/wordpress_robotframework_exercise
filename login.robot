*** Settings ***
Resource    login_resource.robot

Test setup       There is a user "bill" and his password is "s3cr3t"
Test Teardown    Kill bill

*** Test Cases ***
Valid Login
    When login with username "bill" and password "s3cr3t"
    Then login successfully

Login fail    [Template]    Invalid Login
    bill   ${EMPTY}             ERROR: The password field is empty.
    bill   invalid_password     ERROR: The password you entered for the username bill is incorrect.
    invalid_user  any_passwd    ERROR: Invalid username.
    ${EMPTY}    any_password    ERROR: The username field is empty.

*** Keywords ***
There is a user "${username}" and his password is "${password}"
    Open Browser   ${EMPTY}
    Create user    ${username}     "${password}"

Kill bill
    Close Browser
    Remove user

Invalid Login
    [Arguments]    ${username}    ${password}    ${message}
    When login with username "${username}" and password "${password}"
    Then login fail with message "${message}"
