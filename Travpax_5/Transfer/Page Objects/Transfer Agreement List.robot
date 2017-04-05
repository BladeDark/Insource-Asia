*** Settings ***
Library           Selenium2Library

*** Keywords ***
click_Add_Button
    Wait Until Keyword Succeeds    20    1    Click Element    id=btnAddNewFare

click_ToShowOnlyActive
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//label[@for='chkSearchFareActive']/span[3]

click_ToShowInActiveAndInactive
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//label[@for='chkSearchFareActive']/span[2]

click_edit_PaxCombination_Agreement
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=.//*[@data-pkcostmethod='1']

click_edit_CostComponent_Agreement
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=.//*[@data-pkcostmethod='2']

click_edit_Vehicle_Agreement
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=.//*[@data-pkcostmethod='3']
