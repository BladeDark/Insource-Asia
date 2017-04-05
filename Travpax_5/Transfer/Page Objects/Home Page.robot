*** Settings ***
Library           Selenium2Library

*** Keywords ***
Validation_login_Name

Click_Products_Link
    Wait Until Keyword Succeeds    20    1    Click Link    link=Products

Click_Transfer_Link
    Wait Until Keyword Succeeds    20    1    Click Link    link=Transfer
