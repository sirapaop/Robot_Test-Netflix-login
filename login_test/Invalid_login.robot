*** Settings ***
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***               USER NAME        PASSWORD           EXPECTED TYPE
Invalid Username                 invalid          ${VALID PASSWORD}  generic
Invalid Password                 ${VALID USER}    invalid            generic
Invalid Username And Password    invalid          whatever           generic
Empty Username                   ${EMPTY}         ${VALID PASSWORD}  empty_user
Empty Password                   ${VALID USER}    ${EMPTY}           empty_pass
Empty Username And Password      ${EMPTY}         ${EMPTY}           empty_both

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}    ${expected_type}
    Input Username    ${username}
    Input User Password    ${password}
    Submit Credentials
    Run Keyword If    '${expected_type}' == 'generic'        Login Should Have Failed
    #...               ELSE IF    '${expected_type}' == 'invalid_user'  Login Should Invalid User
    ...               ELSE IF    '${expected_type}' == 'empty_user'    Login Should Empty User
    ...               ELSE IF    '${expected_type}' == 'empty_pass'    Login Should Empty Password
    ...               ELSE IF    '${expected_type}' == 'empty_both'    Login Should Empty User And Password