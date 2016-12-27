*** Settings ***
Resource          Configuration.txt

*** Variables ***

*** Test Cases ***
Go to Transfer Edit
    Set Selenium Speed    0.25
    Set Selenium Implicit Wait    10
    Go to Transfer Edit page
    Close Window
    Select Window    title=Travpax
    Wait Until Element Is Visible    id=ainfo
    Sleep    1

Move scroll up button
    Scroll Page To Location    0    2000
    Click Element    xpath=//*[@class='icon-arrow-up']

Cancel button
    Sleep    2
    Click button    id=btnCancel
    Wait Until Element Is Visible    id=transferName
    input text    id=transferName    ${TransferName}
    Click Button    id=fromsearch
    Sleep    3
    Wait Until Element Is Visible    css=.fa.fa-edit
    Click Element    css=.fa.fa-edit
    Close Window
    Select Window    title=Travpax
    Wait Until Element Is Visible    name=TransferName

Content Language
    Select From List By Label    ddlLangCode    Bahasa Indonesia

Clear Element
    Clear All Element

Transfer Name
    Do not input anything For Transfer Name
    Input English letter for Transfer Name
    Input Number for Transfer Name
    Input Special character for Transfer Name
    Input Chinese for Transfer Name
    Input less than 10 characters for Transfer Name
    Input Valid characters for transfer name

Transfer Code
    Do not input anything For Transfer Code
    Input English letter for Transfer Code
    Input Number for Transfer Code
    Input Special character for Transfer Code
    Input Valid characters and not existing for transfer code

Transfer Type
    Check All Value for Transfer Type
    Check Default value for Transfer Type
    Select any value for Transfer Type

Short Description
    Do not input anything for Short Description
    Fill English letter For Short Description
    Fill Number for Short Description
    Fill Special characters for Short Description
    Fill Other Language for Short Description
    Fill any valid characters For Short Description

Full Description
    Fill English letter For Full Description
    Fill Number for Full Description
    Fill Special characters for Full Description
    Fill Other Language for Full Description

From Country
    Do not select anything for From Country
    Select any value for From Country

From City
    Do not select anything for From City
    Select any value for From City

To Country
    Do not select anything for To Country
    Select any value for To Country

To City
    Do not select anything for To City
    Select any value for To City

Booking Lead Time
    Fill English letter for Booking lead time
    Fill Special character for Booking lead time
    Fill nothing for Booking lead time
    Fill Valid Number for Booking lead time

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

Edit Transfer
    Click Button    id=btnSave
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.

Check Value for another language
    Scroll Page To Location    0    -1000
    Click Element    id=aimage
    Wait Until Element Is Visible    id=h3Empty
    Sleep    1
    Click Element    id=ainfo
    Select From List By Label    ddlLangCode    Bahasa Indonesia
    Check Short Description
    Check Full Description
    Check Remark Internal
    Check Remark External

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

Clear All Element
    Clear Element Text    name=TransferName
    Clear Element Text    name=TransferCode
    Select From List By Label    id=ddlTransType    One Way
    Clear Element Text    name=TransferCode
    Clear Element Text    name=shortDescription-id_ID
    Select Frame    xpath=//*[@title='Rich Text Editor, Desc-id_ID']
    Clear Element Text    tag=body
    Unselect Frame
    Select From List By Label    id=ddlCountry    ---Select Country---
    Select From List By Label    id=ddlCity    ---Select City ---
    Select From List By Label    id=ddlToCountry    ---Select Country---
    Select From List By Label    id=ddlToCity    ---Select City ---
    Clear Element Text    name=BookingLeadTime
    Select Frame    xpath=//*[@title='Rich Text Editor, internalRemark-id_ID']
    Clear Element Text    tag=body
    Unselect Frame
    Select Frame    xpath=//*[@title='Rich Text Editor, externalRemark-id_ID']
    Clear Element Text    tag=body
    Unselect Frame

Do not input anything For Transfer Name
    Clear Element Text    name=TransferName
    Click Button    id=btnSave
    Set Selenium Implicit Wait    5
    Wait Until Element Contains    id=TransferName-error    This field is required.

Input English letter for Transfer Name
    input text    name=TransferName    ABCDEFG
    Textfield Should Contain    name=TransferName    ABCDEFG

Input Number for Transfer Name
    input text    name=TransferName    1234567
    Textfield Should Contain    name=TransferName    1234567

Input Special character for Transfer Name
    input text    name=TransferName    !@#$%
    Textfield Should Contain    name=TransferName    !@#$%

Input Chinese for Transfer Name
    input text    name=TransferName    中文
    Textfield Should Contain    name=TransferName    中文

Input Valid characters for transfer name
    input text    name=TransferName    Travpax Automation Transfer
    Click Button    id=btnSave
    Wait Until Element Does Not Contain    id=TransferName-error    This field is required.

Do not input anything For Transfer Code
    Click Button    id=btnSave
    Set Selenium Implicit Wait    5
    Wait Until Element Contains    id=TransferCode-error    This field is required.

Input English letter for Transfer Code
    input text    name=TransferCode    ABCDEFG
    Textfield Should Contain    name=TransferCode    ABCDEFG

Input Number for Transfer Code
    input text    name=TransferCode    1234567
    Textfield Should Contain    name=TransferCode    1234567

Input Special character for Transfer Code
    input text    name=TransferCode    !@#$%
    Click Button    id=btnSave
    Wait Until Element Contains    id=TransferCode-error    Not allow to fill special characters

Input Valid characters and not existing for transfer code
    input text    name=TransferCode    ${TransferCode}
    Click Button    id=btnSave
    Set Selenium Implicit Wait    5
    Wait Until Element Does Not Contain    id=TransferCode-error    This field is required.

Check Default value for Transfer Type
    ${TransferType}=    Get Selected List Label    id=ddlTransType
    Should Be Equal    ${TransferType}    One Way

Select any value for Transfer Type
    Select From List By Label    id=ddlTransType    Round Trip

Check All Value for Transfer Type
    ${TransferTypeList}=    Get List Items    id=ddlTransType
    ${TransferTypeLength}=    Get Length    ${TransferTypeList}
    ${TransferTypeLength}=    Convert To String    ${TransferTypeLength}
    Should Be Equal    ${TransferTypeLength}    2

Do not input anything for Short Description
    Click Button    id=btnSave
    Wait Until Element Contains    id=shortDescription-id_ID-error    This field is required.

Fill English letter For Short Description
    input text    name=shortDescription-id_ID    ABCDEFG
    Textfield Should Contain    name=shortDescription-id_ID    ABCDEFG

Fill Number for Short Description
    input text    name=shortDescription-id_ID    1234567
    Textfield Should Contain    name=shortDescription-id_ID    1234567

Fill Special characters for Short Description
    input text    name=shortDescription-id_ID    !@#$%
    Textfield Should Contain    name=shortDescription-id_ID    !@#$%

Fill Other Language for Short Description
    input text    name=shortDescription-id_ID    中文
    Textfield Should Contain    name=shortDescription-id_ID    中文

Fill any valid characters For Short Description
    input text    name=shortDescription-id_ID    123ABC!@#
    Click Button    id=btnSave
    Set Selenium Implicit Wait    5
    Wait Until Element Does Not Contain    id=shortDescription-id_ID-error    This field is required.

Fill English letter For Full Description
    Select Frame    xpath=//*[@title='Rich Text Editor, Desc-id_ID']
    input text    tag=body    ABCDEF
    Element Should Contain    tag=body    ABCDEF

Fill Number for Full Description
    input text    tag=body    1234567
    Element Should Contain    tag=body    1234567

Fill Special characters for Full Description
    input text    tag=body    !@#$%
    Element Should Contain    tag=body    !@#$%

Fill Other Language for Full Description
    input text    tag=body    中文
    Element Should Contain    tag=body    中文
    Unselect Frame

Do not select anything for From Country
    Click Element    id=btnSave
    Set Selenium Implicit Wait    5
    Wait Until Element Contains    id=ddlCountry-error    This field is required.

Select any value for From Country
    Select From List By Label    id=ddlCountry    Thailand
    Click Element    id=btnSave
    Set Selenium Implicit Wait    5
    Wait Until Element Does Not Contain    id=ddlCountry-error    This field is required.

Do not select anything for From City
    Click Button    id=btnSave
    Set Selenium Implicit Wait    5
    Wait Until Element Contains    id=ddlCity-error    This field is required.

Select any value for From City
    Select From List By Label    id=ddlCity    Bangkok
    Click Button    id=btnSave
    Set Selenium Implicit Wait    5
    Wait Until Element Does Not Contain    id=ddlCity-error    This field is required.

Do not select anything for To Country
    Click Button    id=btnSave
    Set Selenium Implicit Wait    5
    Wait Until Element Contains    id=ddlToCountry-error    This field is required.

Select any value for To Country
    Select From List By Label    id=ddlToCountry    Thailand
    Click Button    id=btnSave
    Set Selenium Implicit Wait    5
    Wait Until Element Does Not Contain    id=ddlToCountry-error    This field is required.

Do not select anything for To City
    Click Button    id=btnSave
    Set Selenium Implicit Wait    5
    Wait Until Element Contains    id=ddlToCity-error    This field is required.

Select any value for To City
    Select From List By Label    id=ddlToCity    Boat Lagoon
    Click Button    id=btnSave
    Set Selenium Implicit Wait    5
    Wait Until Element Does Not Contain    id=ddlToCity-error    This field is required.

Fill English letter for Booking lead time
    input text    id=BookingLeadTime    ABCDEFG
    ${BooingLeadTime}=    Get Value    id=BookingLeadTime
    Should Not Be Equal    ${BooingLeadTime}    ABCDEFG

Fill Special character for Booking lead time
    input text    id=BookingLeadTime    !@#$%
    ${BooingLeadTime}=    Get Value    id=BookingLeadTime
    Should Not Be Equal    ${BooingLeadTime}    !@#$%

Fill nothing for Booking lead time
    Clear Element Text    id=BookingLeadTime
    Click Button    id=btnSave
    Wait Until Element Contains    id=BookingLeadTime-error    This field is required.

Fill Valid Number for Booking lead time
    input text    id=BookingLeadTime    10
    Wait Until Element Does Not Contain    id=BookingLeadTime-error    This field is required.

Fill English letter For Remark Internal
    Select Frame    xpath=//*[@title='Rich Text Editor, internalRemark-id_ID']
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
    Select Frame    xpath=//*[@title='Rich Text Editor, externalRemark-id_ID']
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

Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

Input less than 10 characters for Transfer Name
    input text    name=TransferName    123456
    Click Button    id=btnSave
    Wait Until Element Contains    id=TransferName-error    Please enter at least 10 characters.

Check Short Description
    ${ShortDescription}=    Get Value    name=shortDescription-id_ID
    Should Be Equal    ${ShortDescription}    123ABC!@#

Check Full Description
    Select Frame    xpath=//*[@title='Rich Text Editor, Desc-id_ID']
    ${FullDC}=    Get Text    tag=body
    Should Be Equal    ${FullDC}    中文
    Unselect Frame

Check Remark Internal
    Select Frame    xpath=//*[@title='Rich Text Editor, internalRemark-id_ID']
    ${RemarkInternal}=    Get Text    tag=body
    Should Be Equal    ${RemarkInternal}    中文
    Unselect Frame

Check Remark External
    Select Frame    xpath=//*[@title='Rich Text Editor, externalRemark-id_ID']
    ${RemarkExternal}=    Get Text    tag=body
    Should Be Equal    ${RemarkExternal}    中文
    Unselect Frame
