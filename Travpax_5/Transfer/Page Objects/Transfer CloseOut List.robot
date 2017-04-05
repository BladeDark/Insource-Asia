*** Settings ***
Library           Selenium2Library

*** Keywords ***
click_AddNew_btn
    Wait Until Keyword Succeeds    20    1    Click Element    id=btn_add_new

click_delete_CloseOut
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//*[@id='aDeleteCloseOut1']/span/i
    Wait Until Element Is Visible    css=button.btn.btn-primary
    Click Element    css=button.btn.btn-primary
    Wait Until Element Is Visible    xpath=.//div[text()='Data successfully deleted']
