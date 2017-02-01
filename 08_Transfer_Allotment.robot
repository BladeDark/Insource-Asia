*** Settings ***
Resource          Configuration.txt

*** Variables ***

*** Test Cases ***
Go to Edit Page
    Set Selenium Speed    0.25
    Set Selenium Implicit Wait    10
    Go to Transfer Edit page

Pax Combination Allotment
    Go to Agreement tab
    Edit Agreement Array    1
    Go to Allotment tab
    Check Cost Type function    id=rdbPPC    id=rdbPV
    Fill English letter for Inventory
    Fill Special character for Inventory
    Fill nothing for Inventory
    Fill Valid Number for Inventory
    Check Default value for Cut Off
    Fill English letter for Cut Off
    Fill Special character for Cut Off
    Fill nothing for Cut Off
    Fill Valid Number for Cut Off
    Unselect All Days for Day of week
    Select All Days for Day of week
    Select Valid From
    Select Valid To
    Add New Allotment
    Add Allotment with overlap date
    Click Back to Allotment List button
    Edit Allotment
    Delete Allotment

Cost Component Allotment
    Go to Agreement tab
    Edit Agreement Array    2
    Go to Allotment tab
    Check Cost Type function    id=rdbPPC    id=rdbPV
    Fill English letter for Inventory
    Fill Special character for Inventory
    Fill nothing for Inventory
    Fill Valid Number for Inventory
    Check Default value for Cut Off
    Fill English letter for Cut Off
    Fill Special character for Cut Off
    Fill nothing for Cut Off
    Fill Valid Number for Cut Off
    Unselect All Days for Day of week
    Select All Days for Day of week
    Select Valid From
    Select Valid To
    Add New Allotment
    Add Allotment with overlap date
    Click Back to Allotment List button
    Edit Allotment
    Delete Allotment

Vehicle Allotment
    Go to Agreement tab
    Edit Agreement Array    3
    Go to Allotment tab
    Check Cost Type function    id=rdbPV    id=rdbPPC
    Fill English letter for Inventory
    Fill Special character for Inventory
    Fill nothing for Inventory
    Fill Valid Number for Inventory
    Check Default value for Cut Off
    Fill English letter for Cut Off
    Fill Special character for Cut Off
    Fill nothing for Cut Off
    Fill Valid Number for Cut Off
    Unselect All Days for Day of week
    Select All Days for Day of week
    Select Valid From
    Select Valid To
    Add New Allotment
    Add Allotment with overlap date
    Click Back to Allotment List button
    Edit Allotment
    Delete Allotment

Close Browser
    Close Browser

*** Keywords ***
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

Edit Agreement Array
    [Arguments]    ${AgreementMethod}    # 1. Pax Combination 2. Cost Component 3. Vehicle
    Wait Until Element Is Visible    xpath=//*[@data-pkcostmethod='${AgreementMethod}']
    Click Element    xpath=//*[@data-pkcostmethod='${AgreementMethod}']
    Scroll Page To Location    0    -2000
    Wait Until Element Is Visible    id=aAllotment

Go to Allotment tab
    Click Allotment tab
    Click Add new button

Fill English letter for Inventory
    input text    id=txtInventory    ABCDEFG
    ${Inventory}=    Get Value    id=txtInventory
    Should Not Be Equal    ${Inventory}    ABCDEFG

Fill Special character for Inventory
    input text    id=txtInventory    !@#$%
    ${Inventory}=    Get Value    id=txtInventory
    Should Not Be Equal    ${Inventory}    !@#$%

Fill nothing for Inventory
    Clear Element Text    id=txtInventory
    Click Button    id=btnadd
    Wait Until Element Contains    id=txtInventory-error    This field is required.

Fill Valid Number for Inventory
    input text    id=txtInventory    10
    Wait Until Element Does Not Contain    txtInventory-error    This field is required.

Check Default value for Cut Off
    ${CutOff}=    Get Value    id=txtCuttoff
    Should Be Equal    ${CutOff}    3

Fill English letter for Cut Off
    input text    id=txtCuttoff    ABCDEFG
    ${CutOff}=    Get Value    id=txtCuttoff
    Should Not Be Equal    ${CutOff}    ABCDEFG

Fill Special character for Cut Off
    input text    id=txtCuttoff    !@#$%
    ${CutOff}    Get Value    id=txtCuttoff
    Should Not Be Equal    ${CutOff}    !@#$%

Fill nothing for Cut Off
    Clear Element Text    id=txtCuttoff
    Click Button    id=btnadd
    Wait Until Element Contains    id=txtCuttoff-error    This field is required.

Fill Valid Number for Cut Off
    input text    id=txtCuttoff    7
    Wait Until Element Does Not Contain    id=txtCuttoff-error    This field is required.

Unselect All Days for Day of week
    Click Element    id=spnall
    Checkbox Should Not Be Selected    id=chkall

Select All Days for Day of week
    Click Element    id=spnall
    Checkbox Should Be Selected    id=chkall

Select Valid From
    Click Element    id=txt_validfromallot
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']//div[@class='datepicker-days']//table//thead//tr//th[@class='datepicker-switch']
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']//div[@class='datepicker-months']//table[@class='table-condensed'][1]//thead//tr/th[@class='next']
    Wait Until Element Is Visible    xpath=//span[@class='month'][text()='Jan']
    Click Element    xpath=//span[@class='month'][text()='Jan']
    Wait Until Element Is Visible    xpath=.//td[@class='day'][text()='1']
    Click Element    xpath=.//td[@class='day'][text()='1']

Select Valid To
    Click Element    id=txt_validToallot
    Wait Until Element Is Visible    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']/div[@class='datepicker-days']/table/tbody/tr[1]/td[@class='day'][text()='2']
    Click Element    xpath=//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-bottom']/div[@class='datepicker-days']/table/tbody/tr[1]/td[@class='day'][text()='2']

Add New Allotment
    Click Button    id=btnadd
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.

Add Allotment with overlap date
    Click Add new button
    Input Text    id=txtInventory    10
    Input Text    id=txtInventory    10
    Input Text    id=txtCuttoff    5
    Select Valid From
    Select Valid To
    Click Button    id=btnadd
    Wait Until Element Contains    css=div.toast-message    Overlapped period is not allowed.

Click Add new button
    Click Element    id=addNew
    Wait Until Element Is Visible    id=ddl_supplier
    Sleep    2

Click Allotment tab
    Click Element    id=aAllotment
    Wait Until Element Is Visible    id=addNew

Click Back to Allotment List button
    Click Element    id=btn_back
    Wait Until Element Is Visible    id=addNew

Edit Allotment
    Wait Until Element Is Visible    css=i.fa.fa-edit
    Click Element    css=i.fa.fa-edit
    Wait Until Element Is Visible    id=ddl_supplier
    Input Text    id=txtCuttoff    88
    Click Button    id=btnsave
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.
    Sleep    2

Delete Allotment
    Click Element    css=.glyphicon.glyphicon-trash
    Wait Until Element Is Visible    css=.btn.btn-primary
    Click Element    css=.btn.btn-primary
    Wait Until Element Contains    css=div.toast-message    Data successfully deleted.

Check Cost Type function
    [Arguments]    ${Select}    ${Unselect}
    Checkbox Should Be Selected    ${Select}
    Checkbox Should Not Be Selected    ${Unselect}
