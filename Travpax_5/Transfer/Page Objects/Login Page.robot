*** Settings ***
Library           Selenium2Library
Resource          ../Resource/Variable.robot

*** Variables ***

*** Keywords ***
set_Username
    [Arguments]    ${value}
    Input text    id=txtUserName    ${value}

set_Password
    [Arguments]    ${value}
    Input text    id=txtPassword    ${value}

click_Login
    Click Button    xpath=//button[contains(text(),'Login')]

Login_successfully
    set_Username    ${variable_username}
    set_Password    ${variable_password}
    click_Login
