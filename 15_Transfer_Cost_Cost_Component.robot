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
    Edit Agreement function    2
    Go to Cost tab
    Click Add new +

Add Period
    Select Valid From
    Select Valid To
    Click Add Period
    Click Edit Period

Transportation_Person
    Click Add new + for cost
    Component Type    Transportation
    Wait Until Element Is Visible    xpath=.//label[@for='CostType-0']/span[@class='check']
    Vehicle Type
    Pax Combination
    Currency    ADP
    Adult
    Child1
    Child2
    Infant
    Auto Email to Supplier
    Advance Payment
    Active
    Supplier
    Click Save Button

Transportation_Trip
    Click Add new + for cost
    Component Type    Transportation
    Click Per Trip
    Vehicle Type
    Wait Until Element Is Not Visible    id=ddlPaxCombination
    Currency    AED
    Cost Trip
    Auto Email to Supplier
    Advance Payment
    Active
    Supplier
    Click Save Button

Transportation_Distance
    Click Add new + for cost
    Component Type    Transportation
    Click Per Distance
    Vehicle Type
    Wait Until Element Is Not Visible    id=ddlPaxCombination
    Currency    AFN
    Cost Distance
    Buffer
    Auto Email to Supplier
    Element Should Be Disabled    id=cbComponentAdvance
    Active
    Supplier
    Click Save Button

Driver_Person
    Click Add new + for cost
    Component Type    Driver
    Wait Until Element Is Visible    xpath=.//label[@for='CostType-0']/span[@class='check']
    Wait Until Element Is Not Visible    id=ddlVehicle
    Wait Until Element Is Not Visible    id=txtSupplierCode
    Language
    Pax Combination
    Currency    ALL
    Adult
    Child1
    Child2
    Infant
    Wait Until Element Is Not Visible    xpath=.//label[@for='cbComponentAutoEmail']/span[@class='box']
    Advance Payment
    Active
    Click Save Button

Driver_Trip
    Click Add new + for cost
    Component Type    Driver
    Click Per Trip
    Wait Until Element Is Not Visible    id=ddlVehicle
    Wait Until Element Is Not Visible    id=txtSupplierCode
    Wait Until Element Is Not Visible    id=ddlPaxCombination
    Language
    Currency    AMD
    Cost Trip
    Wait Until Element Is Not Visible    xpath=.//label[@for='cbComponentAutoEmail']/span[@class='box']
    Active
    Supplier
    Click Save Button

Guide_Person
    Click Add new + for cost
    Component Type    Guide
    Wait Until Element Is Visible    xpath=.//label[@for='CostType-0']/span[@class='check']
    Wait Until Element Is Not Visible    id=ddlVehicle
    Wait Until Element Is Not Visible    id=txtSupplierCode
    Language
    Pax Combination
    Currency    ANG
    Adult
    Child1
    Child2
    Infant
    Wait Until Element Is Not Visible    xpath=.//label[@for='cbComponentAutoEmail']/span[@class='box']
    Advance Payment
    Active
    Click Save Button

Guide_Trip
    Click Add new + for cost
    Component Type    Guide
    Click Per Trip
    Wait Until Element Is Not Visible    id=ddlVehicle
    Wait Until Element Is Not Visible    id=txtSupplierCode
    Wait Until Element Is Not Visible    id=ddlPaxCombination
    Language
    Currency    AOA
    Cost Trip
    Wait Until Element Is Not Visible    xpath=.//label[@for='cbComponentAutoEmail']/span[@class='box']
    Active
    Supplier
    Click Save Button

Conducto_Person
    Click Add new + for cost
    Component Type    Conductor
    Wait Until Element Is Visible    xpath=.//label[@for='CostType-0']/span[@class='check']
    Wait Until Element Is Not Visible    id=ddlVehicle
    Wait Until Element Is Not Visible    id=txtSupplierCode
    Language
    Pax Combination
    Currency    AON
    Adult
    Child1
    Child2
    Infant
    Wait Until Element Is Not Visible    xpath=.//label[@for='cbComponentAutoEmail']/span[@class='box']
    Advance Payment
    Active
    Click Save Button

Conductor_Trip
    Click Add new + for cost
    Component Type    Conductor
    Click Per Trip
    Wait Until Element Is Not Visible    id=ddlVehicle
    Wait Until Element Is Not Visible    id=txtSupplierCode
    Wait Until Element Is Not Visible    id=ddlPaxCombination
    Language
    Currency    ARS
    Cost Trip
    Wait Until Element Is Not Visible    xpath=.//label[@for='cbComponentAutoEmail']/span[@class='box']
    Active
    Supplier
    Click Save Button

MISC_Person
    Click Add new + for cost
    Component Type    Misc
    Wait Until Element Is Visible    xpath=.//label[@for='CostType-0']/span[@class='check']
    Wait Until Element Is Not Visible    id=ddlVehicle
    Wait Until Element Is Not Visible    id=ddlLanguge
    Supplier
    Name
    Pax Combination
    Currency    ATS
    Adult
    Child1
    Child2
    Infant
    Auto Email to Supplier
    Advance Payment
    Active
    Click Save Button

MISC_Trip
    Click Add new + for cost
    Component Type    Misc
    Click Per Trip
    Wait Until Element Is Not Visible    id=ddlVehicle
    Wait Until Element Is Not Visible    id=ddlLanguge
    Supplier
    Name
    Wait Until Element Is Not Visible    id=ddlPaxCombination
    Currency    AUD
    Cost Trip
    Auto Email to Supplier
    Advance Payment
    Active
    Click Save Button

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
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']/div[@class='datepicker-days']/table/tbody/tr[6]/td[@class='day'][text()='31']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']/div[@class='datepicker-days']/table/tbody/tr[6]/td[@class='day'][text()='31']

Click Add Period
    Click Button    id=btnSaveCost
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.

Click Add new + for cost
    Click Element    id=btnAddNewCostComponent
    Wait Until Element Is Visible    id=ddlComponenttype

Empty value for DDL with error msg
    [Arguments]    ${ObjErrMsg}
    Click Button    id=btnSaveComponent
    Wait Until Element Contains    ${ObjErrMsg}    This field is required.

Select by label
    [Arguments]    ${Label}    ${ObjID}
    Select From List By Label    ${ObjID}    ${Label}

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
    Click Button    id=btnSaveComponent
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

Component Type
    [Arguments]    ${Label}
    Select by label    ${Label}    id=ddlComponenttype

Vehicle Type
    Empty value for DDL with error msg    id=ddlVehicle-error
    Select by index with no error Msg    id=ddlVehicle    id=ddlVehicle-error

Select by index with no error Msg
    [Arguments]    ${ObjID}    ${ErrObjID}
    Select From List By Index    ${ObjID}    1
    Click Button    id=btnSaveComponent
    Wait Until Element Does Not Contain    ${ErrObjID}    This field is required.

Pax Combination
    Empty value for DDL with error msg    id=ddlPaxCombination-error
    Select by index with no error Msg    id=ddlPaxCombination    id=ddlPaxCombination-error

Currency
    [Arguments]    ${Currency}
    Empty value for DDL with error msg    id=ddlCurrency-error
    Select by label    ${Currency}    id=ddlCurrency    id=ddlCurrency-error

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

Cost Trip
    Fill nothing with error message function    This field is required.    id=txtPerTripCost    id=txtPerTripCost-error
    Fill English letter with not allow function    id=txtPerTripCost
    Fill Special character with not allow function    id=txtPerTripCost
    Fill Number with allow and have ObjError function    200    id=txtPerTripCost    id=txtPerTripCost-error

Auto Email to Supplier
    Click Element    xpath=.//label[@for='cbComponentAutoEmail']/span[@class='box']
    Checkbox Should Be Selected    id=cbComponentAutoEmail
    Click Element    xpath=.//label[@for='cbComponentAutoEmail']/span[@class='check']
    Checkbox Should Not Be Selected    id=cbComponentAutoEmail

Advance Payment
    Click Element    xpath=.//label[@for='cbComponentAdvance']/span[@class='box']
    Checkbox Should Be Selected    id=cbComponentAdvance
    Click Element    xpath=.//label[@for='cbComponentAdvance']/span[@class='check']
    Checkbox Should Not Be Selected    id=cbComponentAdvance

Active
    Click Element    xpath=.//label[@for='cbComponentActive']/span[@class='check']
    Checkbox Should Not Be Selected    id=cbComponentActive
    Click Element    xpath=.//label[@for='cbComponentActive']/span[@class='box']
    Checkbox Should Be Selected    id=cbComponentActive

Click Save Button
    Scroll Page To Location    0    1000
    Click Button    id=btnSaveComponent
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.
    Wait Until Element Is Visible    id=btnAddNewCostComponent

Supplier
    Do not select any supplier
    Selecy any supplier

Do not select any supplier
    Click Button    id=btnSaveComponent
    Wait Until Element Contains    id=txtSupplierCode-error    This field is required.

Selecy any supplier
    Click Button    id=btnSearchSupplier
    Wait Until Element Is Visible    id=txtSupplierName
    Input Text    id=txtSupplierName    ${SupplierName}
    Click Button    id=btnSearchSupplier
    Click Button    id=1
    Element Should Not Be Visible    id=txtSupplierCode-error    This field is required.

Click Per Trip
    Click Element    xpath=.//label[@for='CostType-1']/span[@class='box']
    Wait Until Element Is Visible    xpath=.//label[@for='CostType-1']/span[@class='check']

Click Per Distance
    Click Element    xpath=.//label[@for='CostType-2']/span[@class='box']
    Wait Until Element Is Visible    xpath=.//label[@for='CostType-2']/span[@class='check']

Cost Distance
    Fill nothing with error message function    This field is required.    id=txtByDistanceCost    id=txtByDistanceCost-error
    Fill English letter with not allow function    id=txtByDistanceCost
    Fill Special character with not allow function    id=txtByDistanceCost
    Fill Number with allow and have ObjError function    300    id=txtByDistanceCost    id=txtByDistanceCost-error

Buffer
    Fill nothing with error message function    This field is required.    id=txtBufferAmount    id=txtBufferAmount-error
    Fill English letter with not allow function    id=txtBufferAmount
    Fill Special character with not allow function    id=txtBufferAmount
    Fill Number with allow and have ObjError function    400    id=txtBufferAmount    id=txtBufferAmount-error

Language
    Empty value for DDL with error msg    id=ddlLanguge-error
    Select by index with no error Msg    id=ddlLanguge    id=ddlLanguge-error

Name
    Do not fill anything with error message    This field is required.    id=txtFareComponentName-error
    Fill English and check    id=txtFareComponentName
    Fill Number and check    id=txtFareComponentName
    Fill Special character and check    id=txtFareComponentName
    Fill All characters and check    id=txtFareComponentName    id=txtFareComponentName-error

Do not fill anything with error message
    [Arguments]    ${ErrMessage}    ${ErrObj}
    Click Button    id=btnSaveComponent
    Wait Until Element Contains    ${ErrObj}    ${ErrMessage}

Fill English and check
    [Arguments]    ${ObjID}
    input text    ${ObjID}    ABCDEFG
    Textfield Should Contain    ${ObjID}    ABCDEFG

Fill Number and check
    [Arguments]    ${ObjID}
    input text    ${ObjID}    1234567
    Textfield Should Contain    ${ObjID}    1234567

Fill Special character and check
    [Arguments]    ${ObjID}
    input text    ${ObjID}    !@#$%
    Textfield Should Contain    ${ObjID}    !@#$%

Fill All characters and check
    [Arguments]    ${ObjID}    ${ErrObjID}
    input text    ${ObjID}    ABC !@# 123
    Textfield Should Contain    ${ObjID}    ABC !@# 123
    Wait Until Element Is Not Visible    ${ErrObjID}    This field is required.

Click Edit Period
    Wait Until Element Is Visible    xpath=//*[@id='btnEditCost_undefined'][1]
    Click Element    xpath=//*[@id='btnEditCost_undefined'][1]
    Wait Until Element Is Visible    id=btnAddNewCostComponent
    Scroll Page To Location    0    1000
