*** Settings ***
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    tom
    Input Password    s3cr3t
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser
