*** Settings ***
Resource          Configuration.txt

*** Variables ***

*** Test Cases ***
Go to Edit Page
    Set Selenium Speed    0.25
    Set Selenium Implicit Wait    10
    Go To Transfer Edit page

Go to Agreement tab and click add new
    Sleep    1
    Go to Agreement tab
    Click Add new

Supplier
    Do not select any supplier for Supplier
    Select Supplier for Supplier

Cost Method
    Do not select anything for Cost Method
    Select Per Pax for Cost Method

Market
    Do not select any market for Market field
    Select market for Market field

Currency
    Do not selecy any currency for Currency field
    Select THB for Currency field

Agent
    Select any agent for agent field

Min Child Age 1
    Check Default value for Min Child Age 1
    Fill English letter for Min Child Age 1
    Fill Special character for Min Child Age 1
    Fill nothing for Min Child Age 1
    Fill more than Max Child Age 1
    Fill Valid Number for Min Child Age 1

Max Child Age 1
    Check Default value for Max Child Age 1
    Fill English letter for Max Child Age 1
    Fill Special character for Max Child Age 1
    Fill nothing for Max Child Age 1
    Fill Valid Number for Max Child Age 1

Min Child Age 2
    Check Default value for Min Child Age 2
    Fill More than Max child Age 2

Max Child Age 2
    Check Default value for Max Child Age 2
    Fill English letter for Max Child Age 2
    Fill Special character for Max Child Age 2
    Fill nothing for Max Child Age 2
    Fill Valid Number for Max Child Age 2

Free Luggage
    Fill English letter with not allow function    id=FreeLugguage
    Fill Special character with not allow function    id=FreeLugguage
    Fill nothing with error message function    This field is required.    id=FreeLugguage    xpath=.//*[@id='lugguageFree']/span/span
    Fill Valid Number with allow function    11    id=FreeLugguage    xpath=.//*[@id='lugguageFree']/span/span

Extra Lugguage Charge
    Fill English letter with not allow function    id=ExtraLugguageCharge
    Fill Special character with not allow function    id=ExtraLugguageCharge
    Check Decimal number not more than 2 digits function    id=ExtraLugguageCharge
    Fill nothing with error message function    This field is required.    id=ExtraLugguageCharge    xpath=.//*[@id='lugguageChargeExtra']/span/span
    Fill Valid Number with allow function    12    id=ExtraLugguageCharge    xpath=.//*[@id='lugguageChargeExtra']/span/span

Maximum
    Fill English letter with not allow function    id=MaximumLugguage
    Fill Special character with not allow function    id=MaximumLugguage
    Fill nothing with error message function    This field is required.    id=MaximumLugguage    xpath=.//*[@id='lugguageMaximum']/span/span
    Fill Valid Number with allow function    13    id=MaximumLugguage    xpath=.//*[@id='lugguageMaximum']/span/span

OperationHourFrom
    Scroll Page To Location    0    1000
    Check Default value for Operation Hours From

OperationHourTo
    Check Default value for Operation Hours To

Not Sell Out of Operating Hour
    Check Default value for Not Sell Out of Operating Hour
    Tick Checkbox for Not Sell Out of Operating Hour
    Untick Checkbox for Not Sell Out of Operating Hour

Service Charge
    Do not select anything for Service Charge
    Select anything for Service Charge
    Click Exclude for Service Charge
    Click Include For Service Charge

VAT
    Do not select anything for VAT
    Select anything for VAT
    Click Exclude for VAT
    Click Include For VAT

TAX RATE
    Do not select anything for TAX RATE
    Select anything for TAX RATE
    Click Exclude for TAX RATE
    Click Include For TAX RATE

Promo Fare
    Check Default value for Promo Fare
    Tick Checkbox for Promo Fare
    Untick Checkbox for Promo Fare

For Package Only
    Check Default value for Package Only
    Tick Checkbox for Package Only
    Untick Checkbox for Package Only

SIC Basic
    Check Default value for SIC Basic
    Tick Checkbox for SIC Basic
    Untick Checkbox for SIC Basic

Remark Internal
    Fill English letter For Remark Internal
    Fill Number for Remark Internal
    Fill Special characters for Remark Internal
    Fill Other Language for Remark Internal

Remark External
    Fill English letter For Remark External
    Fill Number for Remark External
    Fill Special characters for Remark External
    Fill Other Language for Remark External

Active
    Check Default value for Active
    Untick Checkbox for Active
    Tick Checkbox for Active

Add New Agreement
    Click Button    id=btnSaveAgreement
    Wait Until Element Contains    css=div.toast-message    Data successfully saved

Close Browser
    Close Browser

*** Keywords ***
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
    Click Element    id=afareareement

Click Add new
    Sleep    5
    Wait Until Element Is Visible    id=btnAddNewFare
    Click Element    id=btnAddNewFare
    Wait Until Element Is Visible    id=txtSupplierCode

Do not select any supplier for Supplier
    Click Button    id=btnSaveAgreement
    Scroll Page To Location    0    -2000
    Wait Until Element Contains    id=txtSupplierCode-error    This field is required.

Select Supplier for Supplier
    Click Button    id=btnSearchSupplier
    Wait Until Element Is Visible    id=txtSupplierName
    Input Text    id=txtSupplierName    ${SupplierName}
    Click Button    id=btnSearchSupplier
    Click Button    id=1
    Click Button    id=btnSaveAgreement
    Scroll Page To Location    0    -2000
    Element Should Not Be Visible    id=txtSupplierCode-error    This field is required.

Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})
    Sleep    1

Do not select anything for Cost Method
    Click Button    id=btnSaveAgreement
    Scroll Page To Location    0    -2000
    Wait Until Element Contains    css=#costmethoderrmsg > span.error > span    This field is required.

Select Per Pax for Cost Method
    Click Element    xpath=//*[@id='divFormAddEditControls']/div[1]/div[2]/div/div[1]/div[1]/label/span[3]
    Click Button    id=btnSaveAgreement
    Scroll Page To Location    0    -2000
    Element Should Not Be Visible    css=#costmethoderrmsg > span.error > span

Do not select any market for Market field
    Click Button    id=btnSaveAgreement
    Scroll Page To Location    0    2000
    Wait Until Element Contains    id=ddlMarket-error    This field is required.

Select market for Market field
    Select From List By Index    id=ddlMarket    1
    Click Button    id=btnSaveAgreement
    Scroll Page To Location    0    -2000
    Element Should Not Be Visible    id=txtSupplierCode-error

Do not selecy any currency for Currency field
    Click Button    id=btnSaveAgreement
    Scroll Page To Location    0    2000
    Wait Until Element Contains    id=ddlCurrency-error    This field is required.

Select THB for Currency field
    Select From List By Value    id=ddlCurrency    THB
    Click Button    id=btnSaveAgreement
    Scroll Page To Location    0    -2000
    Element Should Not Be Visible    id=ddlCurrency-error

Select any agent for agent field
    Click Button    id=btnSearchAgent
    Wait Until Element Is Visible    id=txtAgentName
    Input Text    id=txtAgentName    Insource Test
    Click Button    id=btnAgentSearch
    Click Element    id=76
    Click Button    id=btnSaveAgents
    Click Button    id=btnSaveAgreement
    Scroll Page To Location    0    -2000
    Element Should Be Visible    xpath=//*[@id='76']/span

Check Default value for Min Child Age 1
    ${Child_One}=    Get Value    id=MinChild1Age
    Should Be Equal    ${Child_One}    2

Fill English letter for Min Child Age 1
    input text    id=MinChild1Age    ABCDEFG
    ${Child_One}=    Get Value    id=MinChild1Age
    Should Not Be Equal    ${Child_One}    ABCDEFG

Fill Special character for Min Child Age 1
    input text    id=MinChild1Age    !@#$%
    ${Child_One}=    Get Value    id=MinChild1Age
    Should Not Be Equal    ${Child_One}    !@#$%

Fill nothing for Min Child Age 1
    Clear Element Text    id=MinChild1Age
    Click Button    id=btnSaveAgreement
    Wait Until Element Contains    css=#childage1Min > span.error > span    This field is required.

Fill Valid Number for Min Child Age 1
    Input Text    id=MinChild1Age    3
    Click Button    id=btnSaveAgreement
    Element Should Not Be Visible    css=#childage1Min > span.error > span

Check Default value for Max Child Age 1
    ${Child_One}=    Get Value    id=MaxChild1Age
    Should Be Equal    ${Child_One}    5

Fill English letter for Max Child Age 1
    input text    id=MaxChild1Age    ABCDEFG
    ${Child_One}=    Get Value    id=MaxChild1Age
    Should Not Be Equal    ${Child_One}    ABCDEFG

Fill Special character for Max Child Age 1
    input text    id=MaxChild1Age    !@#$%
    ${Child_One}=    Get Value    id=MaxChild1Age
    Should Not Be Equal    ${Child_One}    !@#$%

Fill nothing for Max Child Age 1
    Clear Element Text    id=MaxChild1Age
    Click Button    id=btnSaveAgreement
    Wait Until Element Contains    css=#childage1Max > span.error > span    This field is required.

Fill Valid Number for Max Child Age 1
    Input Text    id=MaxChild1Age    7
    Click Button    id=btnSaveAgreement
    Element Should Not Be Visible    css=#childage1Max > span.error > span

Check Default value for Min Child Age 2
    ${Child_Two}=    Get Value    id=MinChild2Age
    Should Be Equal    ${Child_Two}    8

Fill English letter for Max Child Age 2
    input text    id=MaxChild2Age    ABCDEFG
    ${Child_Two}=    Get Value    id=MaxChild2Age
    Should Not Be Equal    ${Child_Two}    ABCDEFG

Fill Special character for Max Child Age 2
    input text    id=MaxChild2Age    !@#$%
    ${Child_Two}=    Get Value    id=MaxChild2Age
    Should Not Be Equal    ${Child_Two}    !@#$%

Fill nothing for Max Child Age 2
    Clear Element Text    id=MaxChild2Age
    Click Button    id=btnSaveAgreement
    Wait Until Element Contains    css=#childage2Max > span.error > span    This field is required.

Fill Valid Number for Max Child Age 2
    Input Text    id=MaxChild2Age    11
    Click Button    id=btnSaveAgreement
    Element Should Not Be Visible    css=#childage2Max > span.error > span

Check Default value for Max Child Age 2
    ${Child_Two}=    Get Value    id=MaxChild2Age
    Should Be Equal    ${Child_Two}    12

Fill more than Max Child Age 1
    Input Text    id=MinChild1Age    10
    Click Button    id=btnSaveAgreement
    Wait Until Element Contains    css=#childage1 > span.error > span    Max age must be greater than min age

Fill More than Max child Age 2
    Input Text    id=MaxChild1Age    13
    ${Child_Two}=    Get Value    id=MinChild2Age
    Should Be Equal    ${Child_Two}    14
    Click Button    id=btnSaveAgreement
    Wait Until Element Contains    css=#childage2 > span.error > span    Max age must be greater than min age
    Fill Valid Number for Max Child Age 1
    Check Default value for Min Child Age 2

Check Default value for Operation Hours From
    ${OperationHourFrom}=    Get Value    name=OperationHourFrom
    Should Be Equal    ${OperationHourFrom}    8:00

Check Default value for Operation Hours To
    ${OperationHourTo}=    Get Value    name=OperationHourTo
    Should Be Equal    ${OperationHourTo}    16:00

Check Default value for Not Sell Out of Operating Hour
    Checkbox Should Not Be Selected    id=IsNotSellOutOfOperatingHour

Tick Checkbox for Not Sell Out of Operating Hour
    Click Element    css=div.md-checkbox > label > span.box
    Checkbox Should Be Selected    id=IsNotSellOutOfOperatingHour

Untick Checkbox for Not Sell Out of Operating Hour
    Click Element    css=div.md-checkbox > label > span.check
    Checkbox Should Not Be Selected    id=IsNotSellOutOfOperatingHour

Do not select anything for Service Charge
    Click Button    id=btnSaveAgreement
    Wait Until Element Contains    id=ServiceChargeType-error    This field is required.

Select anything for Service Charge
    Select From List By Index    id=ServiceChargeType    1
    Click Button    id=btnSaveAgreement
    Element Should Not Be Visible    id=ServiceChargeType-error

Click Exclude for Service Charge
    Scroll Page To Location    0    -50
    Wait Until Element Is Visible    xpath=.//label[@for='IsServiceChargeInclude-1']/span[@class='box']
    Click Element    xpath=.//label[@for='IsServiceChargeInclude-1']/span[@class='box']
    Radio Button Should Be Set To    IsServiceChargeInclude    false

Click Include For Service Charge
    Scroll Page To Location    0    -50
    Wait Until Element Is Visible    xpath=.//label[@for='IsServiceChargeInclude-0']/span[@class='box']
    Click Element    xpath=.//label[@for='IsServiceChargeInclude-0']/span[@class='box']
    Radio Button Should Be Set To    IsServiceChargeInclude    true

Do not select anything for VAT
    Click Button    id=btnSaveAgreement
    Wait Until Element Contains    id=VatType-error    This field is required.

Select anything for VAT
    Select From List By Index    id=VatType    1
    Click Button    id=btnSaveAgreement
    Element Should Not Be Visible    id=VatType-error

Click Exclude for VAT
    Scroll Page To Location    0    -50
    Wait Until Element Is Visible    xpath=.//label[@for='IsVatInclude-1']/span[@class='box']
    Click Element    xpath=.//label[@for='IsVatInclude-1']/span[@class='box']
    Radio Button Should Be Set To    IsVatInclude    false

Click Include For VAT
    Scroll Page To Location    0    -50
    Wait Until Element Is Visible    xpath=.//label[@for='IsVatInclude-0']/span[@class='box']
    Click Element    xpath=.//label[@for='IsVatInclude-0']/span[@class='box']
    Radio Button Should Be Set To    IsVatInclude    true

Do not select anything for TAX RATE
    Click Button    id=btnSaveAgreement
    Wait Until Element Contains    id=PKTaxRate-error    This field is required.

Select anything for TAX RATE
    Select From List By Index    id=PKTaxRate    1
    Element Should Not Be Visible    id=PKTaxRate-error

Click Exclude for TAX RATE
    Scroll Page To Location    0    -50
    Wait Until Element Is Visible    xpath=.//label[@for='IsTaxInclude-1']/span[@class='box']
    Click Element    xpath=.//label[@for='IsTaxInclude-1']/span[@class='box']
    Radio Button Should Be Set To    IsTaxInclude    false

Click Include For TAX RATE
    Scroll Page To Location    0    -50
    Wait Until Element Is Visible    xpath=.//label[@for='IsTaxInclude-0']/span[@class='box']
    Click Element    xpath=.//label[@for='IsTaxInclude-0']/span[@class='box']
    Radio Button Should Be Set To    IsTaxInclude    true

Check Default value for Promo Fare
    Checkbox Should Not Be Selected    id=IsPromotion

Tick Checkbox for Promo Fare
    Click Element    xpath=.//label[@for='IsPromotion']/span[@class='box']
    Checkbox Should Be Selected    id=IsPromotion

Untick Checkbox for Promo Fare
    Click Element    xpath=.//label[@for='IsPromotion']/span[@class='check']
    Checkbox Should Not Be Selected    id=IsPromotion

Check Default value for Package Only
    Checkbox Should Not Be Selected    id=IsPackageType

Tick Checkbox for Package Only
    Click Element    xpath=.//label[@for='IsPackageType']/span[@class='box']
    Checkbox Should Be Selected    id=IsPackageType

Untick Checkbox for Package Only
    Click Element    xpath=.//label[@for='IsPackageType']/span[@class='check']
    Checkbox Should Not Be Selected    id=IsPackageType

Check Default value for SIC Basic
    Checkbox Should Not Be Selected    id=IsSIC

Tick Checkbox for SIC Basic
    Click Element    xpath=.//label[@for='IsSIC']/span[@class='box']
    Checkbox Should Be Selected    id=IsSIC

Untick Checkbox for SIC Basic
    Click Element    xpath=.//label[@for='IsSIC']/span[@class='check']
    Checkbox Should Not Be Selected    id=IsSIC

Fill English letter For Remark Internal
    Select Frame    xpath=//*[@title='Rich Text Editor, RemarkInternalAgg']
    input text    tag=body    ABCDEF
    Element Should Contain    tag=body    ABCDEF

Fill Number for Remark Internal
    input text    tag=body    1234567
    Element Should Contain    tag=body    1234567

Fill Special characters for Remark Internal
    input text    tag=body    !@#$%
    Element Should Contain    tag=body    !@#$%

Fill Other Language for Remark Internal
    input text    tag=body    中文
    Element Should Contain    tag=body    中文
    Unselect Frame

Fill English letter For Remark External
    Select Frame    xpath=//*[@title='Rich Text Editor, RemarkExternalAgg']
    input text    tag=body    ABCDEF
    Element Should Contain    tag=body    ABCDEF

Fill Number for Remark External
    input text    tag=body    1234567
    Element Should Contain    tag=body    1234567

Fill Special characters for Remark External
    input text    tag=body    !@#$%
    Element Should Contain    tag=body    !@#$%

Fill Other Language for Remark External
    input text    tag=body    中文
    Element Should Contain    tag=body    中文
    Unselect Frame

Check Default value for Active
    Checkbox Should Be Selected    id=chkIsActive

Untick Checkbox for Active
    Click Element    css=div.col-md-4 > div.md-checkbox > label > span.check
    Checkbox Should Not Be Selected    id=chkIsActive

Tick Checkbox for Active
    Click Element    css=div.col-md-4 > div.md-checkbox > label > span.box
    Checkbox Should Be Selected    id=chkIsActive

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
    Click Button    id=btnSaveAgreement
    Wait Until Element Contains    ${ErrObjectID}    ${ErrMessage}

Fill Valid Number with allow function
    [Arguments]    ${Input}    ${ObjectID}    ${ErrObjectID}
    Input Text    ${ObjectID}    ${Input}
    Click Button    id=btnSaveAgreement
    Element Should Not Be Visible    ${ErrObjectID}

Check Decimal number not more than 2 digits function
    [Arguments]    ${ObjectID}
    input text    ${ObjectID}    200.4567
    ${ObjectValue}=    Get Value    ${ObjectID}
    Should Not Be Equal    ${ObjectValue}    200.4567
