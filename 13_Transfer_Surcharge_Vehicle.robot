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
    Edit Agreement function    3
    Go to Surcharge tab
    Click Add new +

ValidFrom
    Select Date From

ValidTo
    Select Date To

Category
    Do not select value for DDL with error msg function    This field is required.    id=ddlCategory-error
    Select any value for DLL function    DropOff    id=ddlCategory

Type
    Do not select value for DDL with error msg function    This field is required.    id=ddlSurchargeType-error
    Select any value for DLL function    Location    id=ddlSurchargeType
    Wait Until Element Is Enabled    id=ddlLocationType

Location Type
    Check Location Type

Country
    Do not select value for DDL with error msg function    *Please select a country*    id=errorddlTransferCountry
    Select any value for DLL function    Thailand    id=ddlTransferCountry
    Wait Until Element Is Enabled    id=ddlcityselect

City
    Do not select value for DDL with error msg function    *Please select a city*    id=errorTxtddlcityselect
    Select any value for DLL function    Bangkok    id=ddlcityselect

CityZone
    ${LocationType}=    Get Selected List Label    id=ddlLocationType
    Run Keyword If    '${LocationType}' == 'Airport'    Element Should Be Disabled    id=ddlCityZone
    Run Keyword If    '${LocationType}' == 'Hotel'    Wait Until Element Is Enabled    id=ddlCityZone
    Run Keyword If    '${LocationType}' == 'Other'    Element Should Be Disabled    id=ddlCityZone

Charge Basis
    Check Default Charge Basis

Cost
    Fill English letter with not allow function    id=tripRate
    Fill Special character with not allow function    id=tripRate
    Fill Number with allow and have no ObjError function    100    id=tripRate

Back to Surcharge List
    Scroll Page To Location    0    -1000
    Click Element    id=btnBacktoSurchargeList
    Wait Until Element Is Visible    id=btnAddNewSurcharge

Add Surcharge with Extra Hours
    Click Add new +
    Select Date From
    Select Date To
    Select any value for DLL function    DropOff    id=ddlCategory
    Select any value for DLL function    Extra Hours    id=ddlSurchargeType
    Check Location Type
    Fill Number with allow and have ObjError function    10    id=tripRate    id=errortxtTriprate
    Click Button    id=btnSaveSurcharge
    Wait Until Element Contains    css=div.toast-message    Data successfully saved
    Wait Until Element Is Visible    id=btnAddNewSurcharge

Add Surcharge with Luggage
    Click Add new +
    Select Date From
    Select Date To
    Select any value for DLL function    DropOff    id=ddlCategory
    Select any value for DLL function    Luggage    id=ddlSurchargeType
    Check Location Type
    Fill Number with allow and have ObjError function    20    id=tripRate    id=errortxtTriprate
    Click Button    id=btnSaveSurcharge
    Wait Until Element Contains    css=div.toast-message    Data successfully saved
    Wait Until Element Is Visible    id=btnAddNewSurcharge

Add Surcharge with Peak Period
    Click Add new +
    Select Date From
    Select Date To
    Select any value for DLL function    DropOff    id=ddlCategory
    Select any value for DLL function    Peak Period    id=ddlSurchargeType
    Check Location Type
    Fill Number with allow and have ObjError function    30    id=tripRate    id=errortxtTriprate
    Click Button    id=btnSaveSurcharge
    Wait Until Element Contains    css=div.toast-message    Data successfully saved
    Wait Until Element Is Visible    id=btnAddNewSurcharge

Add Surcharge with Location
    Click Add new +
    Select Date From
    Select Date To
    Select any value for DLL function    DropOff    id=ddlCategory
    Select any value for DLL function    Location    id=ddlSurchargeType
    Check Location Type
    Select any value for DLL function    Thailand    id=ddlTransferCountry
    Wait Until Element Is Enabled    id=ddlcityselect
    Select any value for DLL function    Bangkok    id=ddlcityselect
    Sleep    2
    Select Location list for Location
    Fill Number with allow and have ObjError function    40    id=tripRate    id=errortxtTriprate
    Click Button    id=btnSaveSurcharge
    Wait Until Element Contains    css=div.toast-message    Data successfully saved
    Wait Until Element Is Visible    id=btnAddNewSurcharge

Add Surcharge with Not in Service
    Click Add new +
    Select Date From
    Select Date To
    Select any value for DLL function    DropOff    id=ddlCategory
    Select any value for DLL function    Not In Service    id=ddlSurchargeType
    Check Location Type
    Select any value for DLL function    Singapore    id=ddlTransferCountry
    Wait Until Element Is Enabled    id=ddlcityselect
    Select any value for DLL function    Singapore    id=ddlcityselect
    Sleep    2
    Select Location list for Not In Service
    Click Button    id=btnSaveSurcharge
    Wait Until Element Contains    css=div.toast-message    Data successfully saved
    Wait Until Element Is Visible    id=btnAddNewSurcharge

Check table added lists
    Wait Until Element Is Visible    xpath=.//td[text()='Extra Hours']
    Wait Until Element Is Visible    xpath=.//td[text()='Luggage']
    Wait Until Element Is Visible    xpath=.//td[text()='Peak Period']
    Wait Until Element Is Visible    xpath=.//td[text()='Location ']
    Wait Until Element Is Visible    xpath=.//td[text()='Not In Service']

Edit Surcharge with no location
    Click Element    xpath=.//*[@id='datatable_surcharge']/tbody/tr[1]/td[12]/a[1]/i
    Wait Until Element Is Visible    id=ddlCategory
    Element Should Be Disabled    id=validFrom
    Element Should Be Disabled    id=ddlCategory
    Element Should Be Disabled    id=ddlSurchargeType
    Element Should Be Disabled    id=ddlLocationType
    Element Should Be Disabled    id=ddlTransferCountry
    Element Should Be Disabled    id=ddlcityselect
    Element Should Be Disabled    id=ddlCityZone
    Element Should Be Disabled    id=chargebasis
    Element Should Be Enabled    id=tripRate
    Element Should Be Disabled    id=ddlCurrency
    Element Should Be Enabled    id=IsActive
    Clear Element Text    id=tripRate
    Fill English letter with not allow function    id=tripRate
    Fill Special character with not allow function    id=tripRate
    Fill Number with allow and have ObjError function    100    id=tripRate    id=errortxtTriprate
    Click Button    id=btnSaveSurcharge
    Wait Until Element Contains    css=div.toast-message    Data successfully saved
    Wait Until Element Is Visible    id=btnAddNewSurcharge

Edit Surhcarge with Location
    Scroll Page To Location    0    1000
    Click Element    xpath=.//*[@id='datatable_surcharge']/tbody/tr[4]/td[12]/a[1]/i
    Wait Until Element Is Visible    id=ddlCategory
    Element Should Be Disabled    id=validFrom
    Element Should Be Disabled    id=ddlCategory
    Element Should Be Disabled    id=ddlSurchargeType
    Element Should Be Disabled    id=ddlLocationType
    Element Should Be Enabled    id=ddlTransferCountry
    Element Should Be Enabled    id=ddlcityselect
    Element Should Be Disabled    id=ddlCityZone
    Element Should Be Disabled    id=chargebasis
    Element Should Be Enabled    id=tripRate
    Element Should Be Disabled    id=ddlCurrency
    Element Should Be Enabled    id=IsActive
    Clear Element Text    id=tripRate
    Fill English letter with not allow function    id=tripRate
    Fill Special character with not allow function    id=tripRate
    Fill Number with allow and have ObjError function    100    id=tripRate    id=errortxtTriprate
    Click Button    id=btnSaveSurcharge
    Wait Until Element Contains    css=div.toast-message    Data successfully saved
    Wait Until Element Is Visible    id=btnAddNewSurcharge

Edit Surcharge with Not In Service
    Scroll Page To Location    0    1000
    Click Element    xpath=.//*[@id='datatable_surcharge']/tbody/tr[5]/td[12]/a[1]/i
    Wait Until Element Is Visible    id=ddlCategory
    Element Should Be Disabled    id=validFrom
    Element Should Be Disabled    id=ddlCategory
    Element Should Be Disabled    id=ddlSurchargeType
    Element Should Be Disabled    id=ddlLocationType
    Element Should Be Disabled    id=ddlTransferCountry
    Element Should Be Disabled    id=ddlcityselect
    Element Should Be Enabled    id=ddlCityZone
    Element Should Be Disabled    id=chargebasis
    Element Should Be Enabled    id=tripRate
    Element Should Not Be Visible    id=txtbxAdult
    Element Should Not Be Visible    id=txtbxChild1
    Element Should Not Be Visible    id=txtbxChild2
    Element Should Not Be Visible    id=txtbxInfant
    Element Should Be Disabled    id=ddlCurrency
    Element Should Be Enabled    id=IsActive
    Click Button    id=btnSaveSurcharge
    Wait Until Element Contains    css=div.toast-message    Data successfully saved
    Wait Until Element Is Visible    id=btnAddNewSurcharge

Delete Surcharge
    Scroll Page To Location    0    -1000
    Click Element    xpath=.//*[@id='datatable_surcharge']/tbody/tr[1]/td[12]/a[2]/span/i
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
    Wait Until Element Is Visible    id=adivSurCharge

Go to Surcharge tab
    Click Element    id=adivSurCharge
    Wait Until Element Is Visible    id=btnAddNewSurcharge

Click Add new +
    Click Element    id=btnAddNewSurcharge
    Wait Until Element Is Visible    id=ddlCategory

Select Date From
    Click Element    id=validFrom
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Wait Until Element Is Visible    xpath=//span[@class='month'][text()='Jan']
    Click Element    xpath=//span[@class='month'][text()='Jan']
    Wait Until Element Is Visible    xpath=.//td[@class='day'][text()='1']
    Click Element    xpath=.//td[@class='day'][text()='1']

Select Date To
    Click Element    id=validTo
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-days']/table/tbody/tr[4]/td[2]
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-days']/table/tbody/tr[4]/td[2]

Do not select value for DDL with error msg function
    [Arguments]    ${ErrMessage}    ${errObject}
    Click Button    id=btnSaveSurcharge
    Wait Until Element Contains    ${errObject}    ${ErrMessage}

Select any value for DLL function
    [Arguments]    ${Input}    ${ObjectID}
    Select From List By Label    ${ObjectID}    ${Input}

Check Default Charge Basis
    ${ChargeBasis}=    Get Value    id=chargebasis
    Should Be Equal    ${ChargeBasis}    Per Vehicle

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
    Wait Until Element Is Not Visible    ${ErrObjectID}

Fill Number with allow and have no ObjError function
    [Arguments]    ${Input}    ${ObjectID}
    Input Text    ${ObjectID}    ${Input}

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

Check Location Type
    ${Type}=    Get Selected List Label    id=ddlSurchargeType
    Run Keyword If    '${Type}' == 'Extra Hours'    Element Should Be Disabled    id=ddlLocationType
    Run Keyword If    '${Type}' == 'Location '    Wait Until Element Is Enabled    id=ddlLocationType
    Run Keyword If    '${Type}' == 'Location '    Select any value for DLL function    Airport    id=ddlLocationType
    Run Keyword If    '${Type}' == 'Luggage'    Element Should Be Disabled    id=ddlLocationType
    Run Keyword If    '${Type}' == 'Not In Service'    Wait Until Element Is Enabled    id=ddlLocationType
    Run Keyword If    '${Type}' == 'Not In Service'    Select any value for DLL function    Hotel    id=ddlLocationType
    Run Keyword If    '${Type}' == 'Peak Period'    Element Should Be Disabled    id=ddlLocationType

Select Location list for Location
    Wait Until Element Is Visible    xpath=.//li[@class='ms-elem-selectable']/span[text()='Suvarnabhumi Airport']
    Click Element    xpath=.//li[@class='ms-elem-selectable']/span[text()='Suvarnabhumi Airport']
    Click Element    xpath=.//li[@class='ms-elem-selectable']/span[text()='Don Mueang International Airport']
    Element Should Not Be Visible    xpath=.//li[@class='ms-elem-selectable']/span[text()='Suvarnabhumi Airport']
    Element Should Not Be Visible    xpath=.//li[@class='ms-elem-selectable']/span[text()='Suvarnabhumi Airport']
    Wait Until Element Is Visible    xpath=.//li[@class='ms-elem-selection ms-selected']/span[text()='Suvarnabhumi Airport']
    Wait Until Element Is Visible    xpath=.//li[@class='ms-elem-selection ms-selected']/span[text()='Don Mueang International Airport']

Select Location list for Not In Service
    Wait Until Element Is Visible    xpath=.//li[@class='ms-elem-selectable']/span[text()='Melia At Scotts']
    Click Element    xpath=.//li[@class='ms-elem-selectable']/span[text()='Melia At Scotts']
    Click Element    xpath=.//li[@class='ms-elem-selectable']/span[text()='Village Hotel Bugis']
    Element Should Not Be Visible    xpath=.//li[@class='ms-elem-selectable']/span[text()='Melia At Scotts']
    Element Should Not Be Visible    xpath=.//li[@class='ms-elem-selectable']/span[text()='Village Hotel Bugis']
    Wait Until Element Is Visible    xpath=.//li[@class='ms-elem-selection ms-selected']/span[text()='Melia At Scotts']
    Wait Until Element Is Visible    xpath=.//li[@class='ms-elem-selection ms-selected']/span[text()='Village Hotel Bugis']
