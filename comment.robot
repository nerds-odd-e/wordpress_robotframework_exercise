*** Settings ***
Library    Selenium2Library
Library    OperatingSystem

Test setup       Set Selenium Speed     0.5
Test teardown    remove all comments by user


*** Variables ***
${LOGIN PAGE}   http://127.0.0.1:9000/wp-login.php
${USERNAME}     ${EMPTY}
${ARTICLE}      ${EMPTY}
${COMMENT}      ${EMPTY}


*** Test Cases ***
Post comment
    Given exist an article "Learning Objectives"
    When user "mary" post comment "I like THIS post." to this article
    Then non-logined user can see this comment


*** Keywords ***
exist an article "Learning Objectives"
    Set Test Variable     ${ARTICLE}    http://127.0.0.1:9000/?p=9
    Open Browser     ${ARTICLE}

user "${username}" post comment "${comment}" to this article
    login with user "mary" and password "s3cr3t"
    Go to     ${ARTICLE}
    Set Test Variable     ${USERNAME}    ${username}
    Set Test Variable     ${COMMENT}    ${comment}
    Input Text     comment     ${comment}
    Submit form    commentform

non-logined user can see this comment
    Logout to ${ARTICLE}
    Page Should Contain     ${COMMENT}

Logout to ${url}
    Go to     http://127.0.0.1:9000/wp-login.php?action=logout
    Click Link    log out
    Go to    ${url}

login with user "${username}" and password "${password}"
    Go to         ${LOGIN PAGE}
    Input Text    user_login   ${username}
    Input Text      user_pass    ${password}
    Click Button    Log In

remove all comments by user
    Close All Browsers
    Run    shanchupinglun ${USERNAME}
