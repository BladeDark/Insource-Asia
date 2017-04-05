*** Settings ***
Library           Selenium2Library
Resource          ../Resource/Variable.robot

*** Variables ***

*** Keywords ***
Begin_Web_Test
    Open Browser    ${variable_URL}    ${variable_Browser}
    Maximize Browser Window
    Set Selenium Implicit Wait    20

End_Web_Test
    Close Browser
