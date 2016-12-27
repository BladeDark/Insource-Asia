*** Settings ***
Resource          Configuration.txt

*** Variables ***

*** Test Cases ***
Go to Edit Page
    Set Selenium Speed    0.25
    Set Selenium Implicit Wait    10
    Go to Transfer Edit page

Pax Combination Cancellation
    Go to Agreement tab
    Edit Agreement function    1
    Go to Cancellation tab
    Click Expand Penalty
    Check Day before Departure
    Check Penalty
    Select Date From
    Select Date To
    Non Refundable
    Active
    Click Button    id=btnCancellationSave
    Wait Until Element Contains    css=div.toast-message    Data successfully saved
    Reset Button
    Delete Button

Cost Component Cancellation
    Scroll Page To Location    0    -1000
    Go to Agreement tab
    Edit Agreement function    2
    Go to Cancellation tab
    Click Expand Penalty
    Check Day before Departure
    Check Penalty
    Select Date From
    Select Date To
    Non Refundable
    Active
    Click Button    id=btnCancellationSave
    Wait Until Element Contains    css=div.toast-message    Data successfully saved
    Reset Button
    Delete Button

Vehicle Cancellation
    Scroll Page To Location    0    -1000
    Go to Agreement tab
    Edit Agreement function    3
    Go to Cancellation tab
    Click Expand Penalty
    Check Day before Departure
    Check Penalty
    Select Date From
    Select Date To
    Non Refundable
    Active
    Click Button    id=btnCancellationSave
    Wait Until Element Contains    css=div.toast-message    Data successfully saved
    Reset Button
    Delete Button

Close Browser
    Close Browser

*** Keywords ***
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
    Wait Until Element Is Visible    id=aCancellationPeriod

Go to Cancellation tab
    Click Element    id=aCancellationPeriod
    Wait Until Element Is Visible    id=btnCancellationSave

Check Default value for DBF function
    [Arguments]    ${number}    # 1. First row 2. Second row 3. Third row
    ${DBF}=    Get Value    xpath=//div[${number}][@class='RootTemplete']/div[1]/div[1]/input[@name='txtDaysbeforeDeparture']
    Should Be Equal    ${DBF}    10

Fill English letter for DBF function
    [Arguments]    ${number}    # 1. First row 2. Second row 3. Third row
    input text    xpath=//div[${number}][@class='RootTemplete']/div[1]/div[1]/input[@name='txtDaysbeforeDeparture']    ABCDEFG
    ${DBF}=    Get Value    xpath=//div[${number}][@class='RootTemplete']/div[1]/div[1]/input[@name='txtDaysbeforeDeparture']
    Should Not Be Equal    ${DBF}    ABCDEFG

Fill Special character for DBF function
    [Arguments]    ${number}    # 1. First row 2. Second row 3. Third row
    input text    xpath=//div[${number}][@class='RootTemplete']/div[1]/div[1]/input[@name='txtDaysbeforeDeparture']    !@#$%
    ${DBF}    Get Value    xpath=//div[${number}][@class='RootTemplete']/div[1]/div[1]/input[@name='txtDaysbeforeDeparture']
    Should Not Be Equal    ${DBF}    !@#$%

Fill nothing for DBF function
    [Arguments]    ${number}    # 1. First row 2. Second row 3. Third row
    Clear Element Text    xpath=//div[${number}][@class='RootTemplete']/div[1]/div[1]/input[@name='txtDaysbeforeDeparture']
    Click Button    id=btnCancellationSave
    Wait Until Element Contains    xpath=//div[${number}][@class='RootTemplete']/div[1]/div[1]/span    This field is required.

Fill Valid Number for DBF function
    [Arguments]    ${number}    # 1. First row 2. Second row 3. Third row
    input text    xpath=//div[${number}][@class='RootTemplete']/div[1]/div[1]/input[@name='txtDaysbeforeDeparture']    8
    Click Button    id=btnCancellationSave
    Wait Until Element Does Not Contain    xpath=//div[${number}][@class='RootTemplete']/div[1]/div[1]/span    This field is required.

Check Day before Departure
    Check Default value for DBF function    1
    Fill English letter for DBF function    1
    Fill Special character for DBF function    1
    Fill nothing for DBF function    1
    Fill Valid Number for DBF function    1
    Check Default value for DBF function    2
    Fill English letter for DBF function    2
    Fill Special character for DBF function    2
    Fill nothing for DBF function    2
    Fill Valid Number for DBF function    2
    Check Default value for DBF function    3
    Fill English letter for DBF function    3
    Fill Special character for DBF function    3
    Fill nothing for DBF function    3
    Fill Valid Number for DBF function    3

Fill English letter for Penalty function
    [Arguments]    ${number}    # 1. First row 2. Second row 3. Third row
    input text    xpath=.//div[@class='RootTemplete'][${number}]/div[2]/div/input[@name='txtPenalty']    ABCDEFG
    ${Penalty1}=    Get Value    xpath=.//div[@class='RootTemplete'][${number}]/div[2]/div/input[@name='txtPenalty']
    Should Not Be Equal    ${Penalty1}    ABCDEFG

Fill Special character for Penalty function
    [Arguments]    ${number}    # 1. First row 2. Second row 3. Third row
    input text    xpath=.//div[@class='RootTemplete'][${number}]/div[2]/div/input[@name='txtPenalty']    !@#$%
    ${Penalty1}    Get Value    xpath=.//div[@class='RootTemplete'][${number}]/div[2]/div/input[@name='txtPenalty']
    Should Not Be Equal    ${Penalty1}    !@#$%

Fill nothing for Penalty function
    [Arguments]    ${number}    # 1. First row 2. Second row 3. Third row
    Clear Element Text    xpath=.//div[@class='RootTemplete'][${number}]/div[2]/div/input[@name='txtPenalty']
    Click Button    id=btnCancellationSave
    Wait Until Element Contains    xpath=//div[${number}][@class='RootTemplete']/div[2]/div[1]/span    This field is required.

Fill Valid Number for Penalty function
    [Arguments]    ${number}    # 1. First row 2. Second row 3. Third row
    input text    xpath=.//div[@class='RootTemplete'][${number}]/div[2]/div/input[@name='txtPenalty']    20
    Click Button    id=btnCancellationSave
    Wait Until Element Does Not Contain    xpath=.//div[${number}][@class='RootTemplete']/div[2]/div[1]/span    This field is required.

Check Penalty
    Fill English letter for Penalty function    1
    Fill Special character for Penalty function    1
    Fill nothing for Penalty function    1
    Fill Valid Number for Penalty function    1
    Fill English letter for Penalty function    2
    Fill Special character for Penalty function    2
    Fill nothing for Penalty function    2
    Fill Valid Number for Penalty function    2
    Fill English letter for Penalty function    3
    Fill Special character for Penalty function    3
    Fill nothing for Penalty function    3
    Fill Valid Number for Penalty function    3

Click Expand Penalty
    Click Element    xpath=//div[1][@class='RootTemplete']/div[4]/div[1]/button[1]
    Wait Until Element Is Visible    xpath=//div[2][@class='RootTemplete']/div[1]/div[1]/input[@name='txtDaysbeforeDeparture']
    Click Element    xpath=//div[2][@class='RootTemplete']/div[4]/div[1]/button[1]
    Wait Until Element Is Visible    xpath=//div[3][@class='RootTemplete']/div[1]/div[1]/input[@name='txtDaysbeforeDeparture']

Select Date From
    Sleep    1
    Click Element    xpath=.//*[@id='travelDeparture']/input[1]
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Wait Until Element Is Visible    xpath=//span[@class='month'][text()='Jan']
    Click Element    xpath=//span[@class='month'][text()='Jan']
    Wait Until Element Is Visible    xpath=.//td[@class='day'][text()='1']
    Click Element    xpath=.//td[@class='day'][text()='1']

Select Date To
    Click Element    xpath=.//*[@id='travelDeparture']/input[2]
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-days']/table/tbody/tr[6]/td[@class='day'][text()='31']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-days']/table/tbody/tr[6]/td[@class='day'][text()='31']

Non Refundable
    Click Element    xpath=.//label[@for='cbNonRefundable']/span[@class='box']
    Checkbox Should Be Selected    id=cbNonRefundable
    Element Should Be Disabled    xpath=.//div[@class='RootTemplete'][1]/div[2]/div/input[@name='txtPenalty']
    Element Should Be Disabled    xpath=.//div[@class='RootTemplete'][2]/div[2]/div/input[@name='txtPenalty']
    Element Should Be Disabled    xpath=.//div[@class='RootTemplete'][3]/div[2]/div/input[@name='txtPenalty']
    Element Should Be Disabled    xpath=.//div[@class='RootTemplete'][1]/div[2]/div/input[@name='txtPenalty']
    Element Should Be Disabled    xpath=.//div[@class='RootTemplete'][2]/div[2]/div/input[@name='txtPenalty']
    Element Should Be Disabled    xpath=.//div[@class='RootTemplete'][3]/div[2]/div/input[@name='txtPenalty']
    Element Should Be Disabled    xpath=.//div[@class='RootTemplete'][1]/div[3]/div/select[@name='ddlPenaltyType']
    Element Should Be Disabled    xpath=.//div[@class='RootTemplete'][2]/div[3]/div/select[@name='ddlPenaltyType']
    Element Should Be Disabled    xpath=.//div[@class='RootTemplete'][3]/div[3]/div/select[@name='ddlPenaltyType']
    Click Element    xpath=.//label[@for='cbNonRefundable']/span[@class='check']
    Wait Until Element Is Enabled    xpath=.//div[@class='RootTemplete'][1]/div[2]/div/input[@name='txtPenalty']
    Wait Until Element Is Enabled    xpath=.//div[@class='RootTemplete'][2]/div[2]/div/input[@name='txtPenalty']
    Wait Until Element Is Enabled    xpath=.//div[@class='RootTemplete'][3]/div[2]/div/input[@name='txtPenalty']
    Wait Until Element Is Enabled    xpath=.//div[@class='RootTemplete'][1]/div[2]/div/input[@name='txtPenalty']
    Wait Until Element Is Enabled    xpath=.//div[@class='RootTemplete'][2]/div[2]/div/input[@name='txtPenalty']
    Wait Until Element Is Enabled    xpath=.//div[@class='RootTemplete'][3]/div[2]/div/input[@name='txtPenalty']
    Wait Until Element Is Enabled    xpath=.//div[@class='RootTemplete'][1]/div[3]/div/select[@name='ddlPenaltyType']
    Wait Until Element Is Enabled    xpath=.//div[@class='RootTemplete'][2]/div[3]/div/select[@name='ddlPenaltyType']
    Wait Until Element Is Enabled    xpath=.//div[@class='RootTemplete'][3]/div[3]/div/select[@name='ddlPenaltyType']

Active
    Click Element    xpath=.//*[@for='cbActiveCancellation']/span[@class='box']
    Checkbox Should Be Selected    id=cbActiveCancellation
    Click Element    xpath=.//*[@for='cbActiveCancellation']/span[@class='check']
    Checkbox Should Not Be Selected    id=cbActiveCancellation

Reset Button
    Click Expand Penalty
    Scroll Page To Location    0    1000
    Click Button    id=btnCancellationReset
    Wait Until Element Is Not Visible    xpath=//div[2][@class='RootTemplete']/div[1]/div[1]/input[@name='txtDaysbeforeDeparture']
    Wait Until Element Is Not Visible    xpath=//div[3][@class='RootTemplete']/div[1]/div[1]/input[@name='txtDaysbeforeDeparture']

Delete Button
    Click Element    css=.glyphicon.glyphicon-trash
    Wait Until Element Is Visible    css=.btn.btn-primary
    Click Element    css=.btn.btn-primary
    Wait Until Element Contains    css=div.toast-message    Data successfully deleted
