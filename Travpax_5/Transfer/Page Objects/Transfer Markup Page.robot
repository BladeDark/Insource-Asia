*** Settings ***
Resource          ../Resource/Method.robot
Library           Selenium2Library

*** Keywords ***
select_Type_Adult
    [Arguments]    ${value}
    Drop down select value by label    id=ddl_adtmkptype    ${value}

set_Rate_Adult
    [Arguments]    ${value}
    Text field is able to fill valid    id=txt_adtmkpamt    ${value}

select_Type_Child1
    [Arguments]    ${value}
    Drop down select value by label    id=ddl_chd1mkptype    ${value}

set_Rate_Child1
    [Arguments]    ${value}
    Text field is able to fill valid    id=txt_chd1mkpamt    ${value}

select_Type_Child2
    [Arguments]    ${value}
    Drop down select value by label    id=ddl_chd2mkptype    ${value}

set_Rate_Child2
    [Arguments]    ${value}
    Text field is able to fill valid    id=txt_chd2mkpamt    ${value}

select_Type_Infant
    [Arguments]    ${value}
    Drop down select value by label    id=ddl_infmkptype    ${value}

set_Rate_Infant
    [Arguments]    ${value}
    Text field is able to fill valid    id=txt_infmkpamt    ${value}

select_Type_Luggage
    [Arguments]    ${value}
    Drop down select value by label    id=ddl_exLugguagemkptype    ${value}

set_Rate_Luggage
    [Arguments]    ${value}
    Text field is able to fill valid    id=txt_exLugguagemkpamt    ${value}

click_Add_btn
    Wait Until Keyword Succeeds    20    1    Click Element    id=btnaddmrkp

click_Save_btn
    Wait Until Keyword Succeeds    20    1    Click Element    id=btnsave

Select_DateFrom
    Wait Until Keyword Succeeds    20    1    Click Element    id=txt_validfrommrkp
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-months']/table[@class='table-condensed'][1]/tbody/tr/td/span[@class='month'][text()='Jan']
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=.//td[@class='day'][text()='1']

Select_DateTo
    Wait Until Keyword Succeeds    20    1    Click Element    id=txt_validtomrkp
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-days']/table/tbody/tr[3]/td[1]
