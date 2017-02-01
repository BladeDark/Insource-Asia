*** Settings ***
Resource          Configuration.txt

*** Variables ***

*** Test Cases ***
Go to Login page
    Given url is opend
    Set Selenium Speed    0.25

Username field
    Fill English letter for username field
    Fill number for username field
    Fill Special Character for username field
    Fill any characters then click login button for username field

Password field
    Fill English letter for password field
    Fill number for password field
    Fill Special Character for password field
    Fill any characters then click login button for password field

Credential Validation
    Fill valid username but Invalid password
    Fill invalid username and valid password
    Fill valid username and valid password

Close Browser
    Close Browser

*** Keywords ***
Given URL is opend
    Comment    Start Virtual Display    1920    1080
    open browser    ${URL}    ${Browser}
    Maximize Browser Window

Fill English letter for username field
    Clear Element Text    id=txtPassword
    input text    id=txtUserName    ${Username}
    Textfield Should Contain    id=txtUserName    ${Username}

Fill number for username field
    input text    id=txtUserName    1234567
    Textfield Should Contain    id=txtUserName    1234567

Fill Special Character for username field
    input text    id=txtUserName    !@#$%
    Textfield Should Contain    id=txtUserName    !@#$%

Fill any characters then click login button for username field
    input text    id=txtUserName    !@#$%^
    Click Button    //button[@type='submit']
    Wait Until Element Contains    css=span    Please enter username and password.    5

Fill English letter for password field
    Clear Element Text    id=txtUserName
    input Password    id=txtPassword    ${Password}
    ${GetPassword}=    Get Value    id=txtPassword
    Should Be Equal    ${GetPassword}    ${Password}

Fill number for password field
    input Password    id=txtPassword    1234567
    ${GetPassword}=    Get Value    id=txtPassword
    Should Be Equal    ${GetPassword}    1234567

Fill Special Character for password field
    input Password    id=txtPassword    !@#$%^
    ${GetPassword}=    Get Value    id=txtPassword
    Should Be Equal    ${GetPassword}    !@#$%^

Fill any characters then click login button for password field
    input Password    id=txtPassword    !@#$%^
    Click Button    //button[@type='submit']
    Wait Until Element Contains    css=span    Please enter username and password.    5

Fill valid username but Invalid password
    input text    id=txtUserName    ${Username}
    input Password    id=txtPassword    ABCDEF
    Click Button    //button[@type='submit']
    Wait Until Element Contains    css=span.field-validation-error    Login Failed. Invalid email id or password.    5

Fill invalid username and valid password
    input text    id=txtUserName    ABCDEF
    input Password    id=txtPassword    ${Password}
    Click Button    //button[@type='submit']
    Wait Until Element Contains    css=span.field-validation-error    Login Failed. Invalid email id or password.    5

Fill valid username and valid password
    input text    id=txtUserName    ${Username}
    input Password    id=txtPassword    ${Password}
    Click Button    //button[@type='submit']
    Wait Until Element Contains    css=span.username.username-hide-on-mobile    ${Username}
