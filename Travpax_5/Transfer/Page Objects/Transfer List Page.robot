*** Settings ***
Library           Selenium2Library
Resource          ../Resource/Variable.robot
Resource          ../Resource/Method.robot

*** Variables ***

*** Keywords ***
click_Add_New_Button
    Wait Until Keyword Succeeds    20    1    Click Element    id=sample_editable_1_new
    Page Should Contain    Add Transfer

set_Transfer_Name
    Wait Until Element Is Visible    id=transferName
    Text field is able to fill valid    id=transferName    ${variable_TransferName}

click_search_button
    Click Button    id=fromsearch

click_edit_button
    Wait Until Keyword Succeeds    20    1    Wait Until Element Is Visible    xpath=//tr[1]/td[text()[contains(.,'Travpax Automation Transfer')]]
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//tbody/tr[1]/td[6]/a[1]/span/i
    Close Window
    Select Window    title=Travpax

search_transfer_and_edit
    set_Transfer_Name
    click_search_button
    click_edit_button
