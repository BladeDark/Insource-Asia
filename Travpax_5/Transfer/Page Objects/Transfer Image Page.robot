*** Settings ***
Library           Selenium2Library

*** Keywords ***
click_AddNew_btn
    Wait Until Keyword Succeeds    20    1    Click Element    id=btnAdd
