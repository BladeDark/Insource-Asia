*** Settings ***
Library           Selenium2Library

*** Keywords ***
click_AgreementDetails_Tab
    Wait Until Keyword Succeeds    20    1    Click Element    id=aFareDetails

click_Cost_Tab
    Wait Until Keyword Succeeds    20    1    Click Element    id=aCost

click_Allotment_Tab
    Wait Until Keyword Succeeds    20    1    Click Element    id=aAllotment

click_Surcharge_Tab
    Wait Until Keyword Succeeds    20    1    Click Element    id=adivSurCharge

click_Cancellation_Policy_Tab
    Wait Until Keyword Succeeds    20    1    Click Element    id=aCancellationPeriod

click_Markup_Tab
    Wait Until Keyword Succeeds    20    1    Click Element    id=adivMarkUp
