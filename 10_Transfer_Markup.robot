*** Settings ***
Resource          Configuration.txt

*** Variables ***

*** Test Cases ***
Go to Edit Page
    Set Selenium Speed    0.25
    Set Selenium Implicit Wait    10
    Go to Transfer Edit page

Pax Combination Mark up
    Go to Agreement tab
    Edit Agreement function    1
    Go to Markup tab
    Select Date From
    Select Date To
    Adult
    Child1
    Child2
    Infant
    Click Button    id=btnaddmrkp
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.
    Wait Until Element Is Visible    id=dvAddMrk
    Check adult column
    Check Infant column
    Not allow to add overlap function
    Edit Markup
    Delete Markup

Cost Component Markup
    Go to Agreement tab
    Edit Agreement function    2
    Go to Markup tab
    Select Date From
    Select Date To
    Adult
    Child1
    Child2
    Infant
    Click Button    id=btnaddmrkp
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.
    Wait Until Element Is Visible    id=dvAddMrk
    Check adult column
    Check Infant column
    Not allow to add overlap function
    Edit Markup
    Delete Markup

Vehicle Markup
    Go to Agreement tab
    Edit Agreement function    3
    Go to Markup tab
    Select Date From
    Select Date To
    Unit
    Click Button    id=btnaddmrkp
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.
    Wait Until Element Is Visible    id=dvAddMrk
    Check adult column
    Not allow to add overlap function
    Edit Markup
    Delete Markup

Close Browser
    Close Browser

*** Key Word ***
Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

Go to Transfer Edit page
    open browser    ${URL}    Chrome
    Maximize Browser Window
    input text    id=txtUserName    ${Username}
    input Password    id=txtPassword    ${Password}
    Click Button    //button[@type='submit']
    Set Selenium Implicit Wait    5
    Click Link    link=Products
    Wait Until Element Is Visible    link=Transfer
    Click Link    link=Transfer
    Wait Until Element Is Visible    id=sample_editable_1_new
    input text    id=transferName    ${TransferName}
    Click Button    id=fromsearch
    Sleep    2
    Wait Until Element Is Visible    css=.fa.fa-edit
    Click Element    css=.fa.fa-edit
    Close Window
    Select Window    title=Travpax
    Wait Until Element Is Visible    id=ainfo

Go to Agreement tab
    Sleep    3
    Click Element    id=afareareement

Edit Agreement function
    [Arguments]    ${AgreementMethod}    # 1. Pax Combination 2. Cost Component 3. Vehicle
    Wait Until Element Is Visible    xpath=//*[@data-pkcostmethod='${AgreementMethod}']
    Click Element    xpath=//*[@data-pkcostmethod='${AgreementMethod}']
    Scroll Page To Location    0    -2000
    Wait Until Element Is Visible    id=adivMarkUp

Go to Markup tab
    Click Element    id=adivMarkUp
    Wait Until Element Is Visible    id=dvAddMrk
    Click Element    id=dvAddMrk
    Wait Until Element Is Visible    id=txt_adtmkpamt

Select Date From
    Click Element    id=txt_validfrommrkp
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Wait Until Element Is Visible    xpath=//span[@class='month'][text()='Jan']
    Click Element    xpath=//span[@class='month'][text()='Jan']
    Wait Until Element Is Visible    xpath=.//td[@class='day'][text()='1']
    Click Element    xpath=.//td[@class='day'][text()='1']

Select Date To
    Click Element    id=txt_validtomrkp
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-days']/table/tbody/tr[6]/td[@class='day'][text()='31']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-days']/table/tbody/tr[6]/td[@class='day'][text()='31']

Fill English letter with not allow function
    [Arguments]    ${ObjectID}
    input text    ${ObjectID}    ABCDEFG
    ${ObjectValue}=    Get Value    ${ObjectID}
    Should Not Be Equal    ${ObjectValue}    ABCDEFG

Fill Special character with not allow function
    [Arguments]    ${ObjectID}
    input text    ${ObjectID}    !@#$%
    ${ObjectValue}=    Get Value    ${ObjectID}
    Should Not Be Equal    ${ObjectValue}    !@#$%

Fill nothing with error message function
    [Arguments]    ${ErrMessage}    ${ObjectID}    ${ErrObjectID}
    Clear Element Text    ${ObjectID}
    Click Button    id=btnaddmrkp
    Wait Until Element Contains    ${ErrObjectID}    ${ErrMessage}

Fill Number with allow and have ObjError function
    [Arguments]    ${Input}    ${ObjectID}    ${ErrObjectID}
    Input Text    ${ObjectID}    ${Input}
    Wait Until Element Does Not Contain    ${ErrObjectID}    This field is required.

Fill Number with allow and have no ObjError function
    [Arguments]    ${Input}    ${ObjectID}
    Input Text    ${ObjectID}    ${Input}

Check Decimal number not more than 2 digits function
    [Arguments]    ${ObjectID}
    input text    ${ObjectID}    200.4567
    ${ObjectValue}=    Get Value    ${ObjectID}
    Should Not Be Equal    ${ObjectValue}    200.4567

Check Markup type default value is % function
    [Arguments]    ${ObjectID}
    ${ObjectValue}=    Get Selected List Label    ${ObjectID}
    Should Be Equal    ${ObjectValue}    %

Select markup type as amount function
    [Arguments]    ${ObjectID}
    Select From List By Label    ${ObjectID}    Amount

Not allow to add overlap function
    Click Element    id=dvAddMrk
    Wait Until Element Is Visible    id=txt_adtmkpamt
    Select Date From
    Select Date To
    Input Text    id=txt_adtmkpamt    100
    Click Button    id=btnaddmrkp
    Wait Until Element Contains    css=div.toast-message    Overlapped period is not allowed.
    Click Element    id=btnback
    Wait Until Element Is Visible    id=dvAddMrk

Adult
    Fill English letter with not allow function    id=txt_adtmkpamt
    Fill Special character with not allow function    id=txt_adtmkpamt
    Fill nothing with error message function    This field is required.    id=txt_adtmkpamt    id=txt_adtmkpamt-error
    Check Decimal number not more than 2 digits function    id=txt_adtmkpamt
    Fill Number with allow and have ObjError function    100    id=txt_adtmkpamt    id=txt_adtmkpamt-error
    Check Markup type default value is % function    id=ddl_adtmkptype

Child1
    Fill English letter with not allow function    id=txt_chd1mkpamt
    Fill Special character with not allow function    id=txt_chd1mkpamt
    Check Decimal number not more than 2 digits function    id=txt_chd1mkpamt
    Fill Number with allow and have no ObjError function    200    id=txt_chd1mkpamt
    Check Markup type default value is % function    id=ddl_chd1mkptype

Child2
    Fill English letter with not allow function    id=txt_chd2mkpamt
    Fill Special character with not allow function    id=txt_chd2mkpamt
    Check Decimal number not more than 2 digits function    id=txt_chd2mkpamt
    Fill Number with allow and have no ObjError function    300    id=txt_chd2mkpamt
    Check Markup type default value is % function    id=ddl_chd2mkptype

Infant
    Fill English letter with not allow function    id=txt_infmkpamt
    Fill Special character with not allow function    id=txt_infmkpamt
    Check Decimal number not more than 2 digits function    id=txt_infmkpamt
    Fill Number with allow and have no ObjError function    400    id=txt_infmkpamt
    Check Markup type default value is % function    id=ddl_infmkptype
    Select markup type as amount function    id=ddl_infmkptype

Unit
    Fill English letter with not allow function    id=txt_adtmkpamt
    Fill Special character with not allow function    id=txt_adtmkpamt
    Check Decimal number not more than 2 digits function    id=txt_adtmkpamt
    Fill Number with allow and have no ObjError function    100    id=txt_adtmkpamt
    Check Markup type default value is % function    id=ddl_adtmkptype

Check adult column
    Wait Until Element Contains    xpath=.//*[@id='sample_editable_markUp']/tbody/tr/td[6]/span    100.00 %

Check Infant column
    Wait Until Element Contains    xpath=.//*[@id='sample_editable_markUp']/tbody/tr/td[7]/span    400.00 THB

Edit Markup
    Click Element    css=.fa.fa-edit
    Wait Until Element Is Visible    id=btnsave
    Select From List By Label    id=ddl_adtmkptype    Amount
    Input Text    id=txt_adtmkpamt    999
    Click Button    id=btnsave
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.
    Wait Until Element Contains    xpath=.//*[@id='sample_editable_markUp']/tbody/tr/td[6]/span    999.00 THB

Delete Markup
    Click Element    css=.glyphicon.glyphicon-trash
    Wait Until Element Is Visible    css=.btn.btn-primary
    Click Element    css=.btn.btn-primary
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.
