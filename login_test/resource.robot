*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.netflix.com/th/login
${VALID USER}     pton451@gmail.com
${VALID PASSWORD}     Ball_Peeraphat2005
${INVALID USER}   invalid_user@example.com
${INVALID PASSWORD}     wrong_password
${LOGIN BUTTON}   xpath=//button[contains(., "เข้าสู่ระบบ")]
${EMPTY}          
${ERROR URL}      https://www.netflix.com/th/login

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=userLoginId

Go To Login Page
    Go To    ${URL}
    Wait Until Element Is Visible    name=userLoginId

Input Username
    [Arguments]    ${username}
    Input Text    name=userLoginId    ${username}

Input User Password
    [Arguments]    ${password}
    Input Text    name=password    ${password}

Click Login Button
    Click Button    ${LOGIN BUTTON}

Submit Credentials
    Click Login Button
    Sleep    1s
    #Wait Until Page Contains Element    xpath=//div[contains(., "ลองอีกครั้ง")]    timeout=10s

Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Wait Until Element Is Visible    xpath=//div[contains(., "ลองอีกครั้ง")]    timeout=10s
    Page Should Contain Element    xpath=//div[contains(., "ลองอีกครั้ง")]
    
# Login Should Invalid User
#     Location Should Be    ${ERROR URL}
#     Page Should Contain Element    xpath=//div[contains(., "ลองอีกครั้ง")]

Login Should Empty User
    Location Should Be    ${ERROR URL}
    Page Should Contain Element    xpath=//div[contains(., "โปรดระบุอีเมลหรือหมายเลขโทรศัพท์ที่ถูกต้อง")]

Login Should Empty Password
    Location Should Be    ${ERROR URL}
    Page Should Contain Element    xpath=//div[contains(., "รหัสผ่านต้องมีอักขระ 4 ถึง 60 ตัว")]

Login Should Empty User And Password
    Location Should Be    ${ERROR URL}
    Page Should Contain Element    xpath=//div[contains(., "โปรดระบุอีเมลหรือหมายเลขโทรศัพท์ที่ถูกต้อง")]