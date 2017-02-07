*** Settings ***
Resource          Configuration.txt

*** Variables ***

*** Test Cases ***
Go to Transfer Edit page
    Set Selenium Speed    0.25
    Set Selenium Implicit Wait    10
    Go to Transfer Edit page
    Search Transfer

Go to close out tab and click add new
    Go to Close out tab
    Click Add new button

Supplier
    Select Supplier

Date From
    Select Date From

Date To
    Select Date To

Day of week
    Check default value

Add new close out
    Click button    id=btnSaveCloseOut
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.

Add overlap close out
    Sleep    2
    Click Add new button
    Select Supplier
    Select Date From
    Select Date To
    Click button    id=btnSaveCloseOut
    Wait Until Element Contains    css=div.toast-message    Overlapped period is not allowed.

Delete Close out
    Click Element    id=btnBackCloseOutDetail
    Sleep    1
    Wait Until Element Is Visible    id=btnnew
    Choose Ok On Next Confirmation
    Click Element    xpath=//*[@id='aDeleteCloseOut1']/span/i
    Wait Until Element Is Visible    css=button.btn.btn-primary
    Click Element    css=button.btn.btn-primary
    Wait Until Element Contains    css=div.toast-message    Data successfully deleted

Close Browser
    Close Browser

*** Keywords ***
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

Go to Close out tab
    Sleep    2
    Wait Until Element Is Visible    id=acloseout
    Click Element    id=acloseout

Click Add new button
    Sleep    2
    Wait Until Element Is Visible    id=btn_add_new
    Click Element    id=btn_add_new

Check default value
    Checkbox Should Be Selected    id=cbDayAllCloseOut

Select Supplier
    Sleep    2
    Click Element    id=s2id_ddlSupplier
    Input Text    xpath=(//*[contains(@style, 'block')])/div/input    ${SupplierName}
    Click Element    xpath=(//*[contains(@id, 'select2-result-label')])[1]

Search Transfer
    input text    id=transferName    ${TransferName}
    Click Button    id=fromsearch
    Sleep    2
    Wait Until Element Is Visible    css=.fa.fa-edit
    Click Element    css=.fa.fa-edit
    Close Window
    Select Window    title=Travpax
    Wait Until Element Is Visible    id=ainfo

Select Date From
    Sleep    2
    Click Element    id=datePickerFromCloseOutEdit
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-months']/table[@class='table-condensed'][1]/tbody/tr/td/span[@class='month'][text()='Jan']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-months']/table[@class='table-condensed'][1]/tbody/tr/td/span[@class='month'][text()='Jan']
    Wait Until Element Is Visible    xpath=.//td[@class='day'][text()='1']
    Click Element    xpath=.//td[@class='day'][text()='1']

Select Date To
    Sleep    2
    Click Element    id=datePickerToCloseOutEdit
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-days']/table/tbody/tr[3]/td[1]
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']/div[@class='datepicker-days']/table/tbody/tr[3]/td[1]
