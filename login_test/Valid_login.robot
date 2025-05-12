*** Settings ***
Resource          resource.robot
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Login With Valid Credentials
    [Documentation]    ล็อกอินด้วยอีเมลและรหัสผ่านที่ถูกต้อง
    Input Username    ${VALID USER}
    Input User Password    ${VALID PASSWORD}
    Click Login Button
    Wait Until Location Contains    browse    timeout=10s
    Location Should Contain    browse
