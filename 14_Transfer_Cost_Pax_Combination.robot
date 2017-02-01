*** Settings ***
Resource          Configuration.txt

*** Variables ***

*** Test Cases ***
Go to Edit Page
    Set Selenium Speed    0.25
    Set Selenium Implicit Wait    10
    Go to Transfer Edit page

Go to Agreement and Click Surcharge
    Go to Agreement tab
    Edit Agreement function    1
    Go to Cost tab
    Click Add new +

Add Period
    Select Valid From
    Select Valid To
    Click Add Period
    Click Add new + for cost

Pax Range
    Empty value for DDL with error msg    id=ddlpaxCombination-error
    Select by index with no error Msg    id=ddlpaxCombination    id=ddlpaxCombination-error

Adult
    Checkbox by default    id=chkAdult
    Fill nothing with error message function    This field is required.    id=txtAdult    id=txtAdult-error
    Fill English letter with not allow function    id=txtAdult
    Fill Special character with not allow function    id=txtAdult
    Fill Number with allow and have ObjError function    100    id=txtAdult    id=txtAdult-error

Child1
    Select Checkbox function    id=chkChild1    id=txtChild1
    Fill nothing with error message function    This field is required.    id=txtChild1    id=txtChild1-error
    Fill English letter with not allow function    id=txtChild1
    Fill Special character with not allow function    id=txtChild1
    Unselect Checkbox function    id=chkChild1    id=txtChild1

Child2
    Select Checkbox function    id=chkChild2    id=chkChild2
    Fill nothing with error message function    This field is required.    id=txtChild2    id=txtChild2-error
    Fill English letter with not allow function    id=txtChild2
    Fill Special character with not allow function    id=txtChild2
    Unselect Checkbox function    id=chkChild2    id=txtChild2

Infant
    Select Checkbox function    id=chkInfant    id=txtInfant
    Fill nothing with error message function    This field is required.    id=txtInfant    id=txtInfant-error
    Fill English letter with not allow function    id=txtInfant
    Fill Special character with not allow function    id=txtInfant
    Unselect Checkbox function    id=chkInfant    id=txtInfant

Active
    Click Element    xpath=.//label[@for='cbPaxActive']/span[@class='check']
    Checkbox Should Not Be Selected    id=cbPaxActive
    Click Element    xpath=.//label[@for='cbPaxActive']/span[@class='box']
    Checkbox Should Be Selected    id=cbPaxActive

Click save
    Click Button    id=btnSavePax
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.
    Wait Until Element Contains    xpath=.//*[@id='datatable_perpax']/tbody/tr/td[4]    100

Edit Cost
    Click Element    id=btnEditCost_undefined
    Fill Number with allow and have ObjError function    999    id=txtAdult    id=txtAdult-error
    Click Button    id=btnSavePax
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.
    Wait Until Element Contains    xpath=.//*[@id='datatable_perpax']/tbody/tr/td[4]    999

Delete Cost
    Click Element    css=.glyphicon.glyphicon-trash
    Wait Until Element Is Visible    css=.btn.btn-primary
    Click Element    css=.btn.btn-primary
    Wait Until Element Contains    css=div.toast-message    Data successfully deleted

Delete Period
    Click Element    id=btnBacktoCostList
    Wait Until Element Is Visible    id=btnAddNewCost
    Click Element    css=.glyphicon.glyphicon-trash
    Wait Until Element Is Visible    css=.btn.btn-primary
    Click Element    css=.btn.btn-primary
    Wait Until Element Contains    css=div.toast-message    Data successfully deleted

Close Browser
    Close Browser

*** Keyword ***
Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

Go to Transfer Edit page
    open browser    ${URL}    ${Browser}
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
    Wait Until Element Is Visible    id=aCost

Go to Cost tab
    Click Element    id=aCost
    Wait Until Element Is Visible    id=btnAddNewCost

Click Add new +
    Click Element    id=btnAddNewCost
    Wait Until Element Is Visible    id=lblPkTransferValidity

Select Valid From
    Click Element    id=datePickerValidFrom
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Wait Until Element Is Visible    xpath=//span[@class='month'][text()='Jan']
    Click Element    xpath=//span[@class='month'][text()='Jan']
    Wait Until Element Is Visible    xpath=.//td[@class='day'][text()='1']
    Click Element    xpath=.//td[@class='day'][text()='1']

Select Valid To
    Click Element    id=datePickerValidTo
    Wait Until Element Is Visible    xpath=//td[@class='day'][text()='31']
    Click Element    xpath=//td[@class='day'][text()='31']

Click Add Period
    Click Button    id=btnSaveCost
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.

Click Add new + for cost
    Click Element    id=btnAddNewCostPerPax
    Wait Until Element Is Visible    id=ddlpaxCombination

Empty value for DDL with error msg
    [Arguments]    ${ObjErrMsg}
    Click Button    id=btnSavePax
    Wait Until Element Contains    ${ObjErrMsg}    This field is required.

Select by index with no error Msg
    [Arguments]    ${ObjID}    ${ErrObjID}
    Select From List By Index    ${ObjID}    1
    Click Button    id=btnSavePax
    Wait Until Element Does Not Contain    ${ErrObjID}    This field is required.

Checkbox by default
    [Arguments]    ${ObjID}
    Checkbox Should Be Selected    ${ObjID}

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
    Click Button    id=btnSavePax
    Wait Until Element Contains    ${ErrObjectID}    ${ErrMessage}

Fill Number with allow and have ObjError function
    [Arguments]    ${Input}    ${ObjectID}    ${ErrObjectID}
    Input Text    ${ObjectID}    ${Input}
    Wait Until Element Does Not Contain    ${ErrObjectID}    This field is required.

Select Checkbox function
    [Arguments]    ${chbID}    ${txtID}
    Click Element    ${chbID}
    Checkbox Should Be Selected    ${chbID}
    Wait Until Element Is Enabled    ${txtID}

Unselect Checkbox function
    [Arguments]    ${chbID}    ${txtID}
    Click Element    ${chbID}
    Checkbox Should Not Be Selected    ${chbID}
    Element Should Be Disabled    ${txtID}
