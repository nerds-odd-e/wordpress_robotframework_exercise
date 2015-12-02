*** Settings ***
Resource    login_resource.robot

Test Teardown    Remove user

*** Test Cases ***
Valid Login
    Given there is a user "jack" and his password is "s3cr3t"
    When login with username "jack" and password "s3cr3t"
    Then login successfully

Login with invalid password
    Given there is a user "jack" and his password is "s3cr3t"
    When login with username "jack" and password "invalid_password"
    Then login fail with message "ERROR: The password you entered for the username jack is incorrect."

Login with empty password
    Given there is a user "jack" and his password is "s3cr3t"
    When login with username "jack" and password ""
    Then login fail with message "ERROR: The password field is empty."

*** Keywords ***
Remove user
    Close Browser
    Run    shanchuyonghu ${USERNAME}
