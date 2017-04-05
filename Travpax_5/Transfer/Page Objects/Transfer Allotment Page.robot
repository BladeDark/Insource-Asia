*** Settings ***
Library           Selenium2Library

*** Keywords ***
set_Inventory
    [Arguments]    ${value}
    Wait Until Keyword Succeeds    20    1    Input Text    id=txtInventory    ${value}

set_CutOff
    [Arguments]    ${value}
    Wait Until Keyword Succeeds    20    1    Input Text    id=txtCuttoff    ${value}

select_ValidFrom
    Wait Until Keyword Succeeds    20    1    Click Element    id=txt_validfromallot
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//span[@class='month'][text()='Jan']
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=.//td[@class='day'][text()='1']

select_ValidTo
    Wait Until Keyword Succeeds    20    1    Click Element    id=txt_validToallot
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']/div[@class='datepicker-days']/table/tbody/tr[1]/td[@class='day'][text()='2']

click_Add_btn
    Wait Until Keyword Succeeds    20    1    Click Element    id=btnadd

click_Edit_btn
    Wait Until Keyword Succeeds    20    1    Click Element    id=btnsave
