*** Settings ***
Library           Selenium2Library

*** Keywords ***
click_Information
    Wait Until Keyword Succeeds    20    1    Click Element    id=ainfo

click_Image
    Wait Until Keyword Succeeds    20    1    Click Element    id=aimage

click_Agreement
    Wait Until Keyword Succeeds    20    1    Click Element    id=afareareement

click_CloseOut
    Wait Until Keyword Succeeds    20    1    Click Element    id=acloseout

click_History
    Wait Until Keyword Succeeds    20    1    Click Element    id=ahistory
