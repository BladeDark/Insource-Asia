*** Settings ***
Library           Selenium2Library
Resource          ../Resource/Variable.robot

*** Keywords ***
click_Back_To_CloseOut_List
    Wait Until Keyword Succeeds    20    1    Click Element    id=btnBackCloseOutDetail

select_Supplier
    Wait Until Keyword Succeeds    20    1    Click Element    id=s2id_ddlSupplier
    Input Text    xpath=(//*[contains(@style, 'block')])/div/input    ${variable_supplierName}
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=(//*[contains(@id, 'select2-result-label')])[1]

select_Valid_From
    Wait Until Keyword Succeeds    20    1    Click Element    id=datePickerFromCloseOutEdit
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-months']/table[@class='table-condensed'][1]/tbody/tr/td/span[@class='month'][text()='Jan']
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=.//td[@class='day'][text()='1']

select_Valid_To
    Wait Until Keyword Succeeds    20    1    Click Element    id=datePickerToCloseOutEdit
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-days']/table/tbody/tr[3]/td[1]

click_AllDay_to_be_Inactive
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=.//*[@id='uniform-cbDayAllCloseOut']/span/input
    Checkbox Should Not Be Selected    id=cbDayAllCloseOut

click_AllDay_to_be_Active
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=.//*[@id='uniform-cbDayAllCloseOut']/span/input
    Checkbox Should Be Selected    id=cbDayAllCloseOut

click_Cancel
    Wait Until Keyword Succeeds    20    1    Click Element    id=btnFormcancelCloseOut

click_Save_btn
    Wait Until Keyword Succeeds    20    1    Click Element    id=btnSaveCloseOut
