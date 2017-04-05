*** Settings ***
Library           Selenium2Library
Resource          ../Resource/Method.robot

*** Keywords ***
click_AddNew_btn
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=.//*[@id='dvAddMrk']/a

click_Edit_btn
    Wait Until Keyword Succeeds    20    1    Click Element    css=.fa.fa-edit

click_Delete_btn
    Wait Until Keyword Succeeds    20    1    Click Element    css=.glyphicon.glyphicon-trash
    Wait Until Element Is Visible    css=button.btn.btn-primary
    Click Element    css=button.btn.btn-primary
    Wait Until Element Is Visible    xpath=.//div[text()='Data saved successfully.']

click_Show_Hide_Column
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=.//*[@id='divMarkUp']/div/div/div[1]/div[2]/div/div/div/a

click_ToShow_Child1_Column
    Wait Until Keyword Succeeds    20    1    Click Element    id=chk_6

click_ToShow_Child2_Column
    Wait Until Keyword Succeeds    20    1    Click Element    id=chk_7

check_Adult_Rate
    [Arguments]    ${value}
    ${compare}=    Get Text    xpath=.//*[@id='sample_editable_markUp']/tbody/tr/td[6]/span
    Should Contain    ${value}    ${compare}

check_Child1_Rate
    [Arguments]    ${value}
    ${compare}=    Get Text    xpath=.//*[@id='sample_editable_markUp']/tbody/tr/td[7]/span
    Should Contain    ${value}    ${compare}

check_Child2_Rate
    [Arguments]    ${value}
    ${compare}=    Get Text    xpath=.//*[@id='sample_editable_markUp']/tbody/tr/td[8]/span
    Should Contain    ${value}    ${compare}

check_Infant_Rate
    [Arguments]    ${value}
    ${compare}=    Get Text    xpath=.//*[@id='sample_editable_markUp']/tbody/tr/td[9]/span
    Should Contain    ${value}    ${compare}
