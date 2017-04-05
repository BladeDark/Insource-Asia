*** Settings ***
Library           Selenium2Library

*** Keywords ***
click_AddNew_btn
    Wait Until Keyword Succeeds    20    1    Click Element    id=addNew

click_Edit_Allotment
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//table[@id='sample_editable_allotment']/tbody/tr[1]/td[7]/a[1]/span/i

click_delete_Allotment
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//table[@id='sample_editable_allotment']/tbody/tr[1]/td[7]/a[2]/span/i
    Wait Until Element Is Visible    css=.btn.btn-primary
    Click Element    css=.btn.btn-primary
    Wait Until Element Is Visible    xpath=.//div[text()='Data saved successfully.']
