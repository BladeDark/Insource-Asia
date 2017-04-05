*** Settings ***
Library           Selenium2Library
Resource          ../Resource/Variable.robot

*** Keywords ***
Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

Text field is able to type english
    [Arguments]    ${element}
    Input Text    ${element}    abc
    ${text}=    Get Value    ${element}
    Should Be Equal    ${text}    abc

Text field is able to type number
    [Arguments]    ${element}
    Input Text    ${element}    123
    ${text}=    Get Value    ${element}
    Should Be Equal    ${text}    123

Text field is able to type special character
    [Arguments]    ${element}
    Input Text    ${element}    !@#
    ${text}=    Get Value    ${element}
    Should Be Equal    ${text}    !@#

Text field fill less than 10 and show error
    [Arguments]    ${element}    ${errElement}    ${errMsg}
    Input Text    ${element}    12ab!@
    Wait Until Element Contains    ${errElement}    ${errMsg}

Text field default value
    [Arguments]    ${element}    ${default_value}
    ${value}=    Get Value    ${element}
    Should Contain    ${value}    ${default_value}

Any field do nothing and have error
    [Arguments]    ${errElement}    ${errMsg}    ${BtnName}
    Wait Until Keyword Succeeds    20    1    Click Button    ${BtnName}
    Wait Until Element Contains    ${errElement}    ${errMsg}

Text field is able to fill valid
    [Arguments]    ${element}    ${value}
    Wait Until Keyword Succeeds    20    1    Input Text    ${element}    ${value}
    ${status}    ${value_return}=    Run Keyword And Ignore Error    Element Should Contain    ${element}    ${value}
    Run Keyword If    '${status}' == 'PASS'    Pass Execution
    Run Keyword Unless    '${status}' == 'PASS'    Input Text    ${element}    ${value}

Drop down check length
    [Arguments]    ${element}    ${expected_Length}
    ${elementList}=    Get List Items    ${element}
    ${elementLength}=    Get Length    ${elementList}
    ${length}=    Convert To String    ${elementLength}
    Should Be Equal    ${length}    ${expected_Length}

Drop down check default value
    [Arguments]    ${element}    ${default_value}
    ${txtElement}=    Get Selected List Label    ${element}
    Should Be Equal    ${txtElement}    ${default_value}

Drop down select value by label
    [Arguments]    ${element}    ${value}
    Wait Until Keyword Succeeds    20    1    Select From List By Label    ${element}    ${value}
    ${txtElement}=    Get Selected List Label    ${element}
    Should Be Equal    ${txtElement}    ${value}

Drop down select value by value
    [Arguments]    ${element}    ${value}
    Select From List By Value    ${element}    ${value}
    ${txtElement}=    Get Selected List Value    ${element}
    Should Be Equal    ${txtElement}    ${value}

Drop down select value by index
    [Arguments]    ${element}    ${index}
    Select From List By Index    ${element}    ${index}

RichText is able to type english
    [Arguments]    ${element}
    input text    ${element}    ABCDEF
    Element Should Contain    ${element}    ABCDEF

RichText is able to type number
    [Arguments]    ${element}
    input text    ${element}    12345
    Element Should Contain    ${element}    12345

RichText is able to type special character
    [Arguments]    ${element}
    input text    ${element}    !@#$
    Element Should Contain    ${element}    !@#$

Text field is not able to type english
    [Arguments]    ${element}
    Input Text    ${element}    abc
    ${text}=    Get Value    ${element}
    Should Not Be Equal    ${text}    abc

Text field is not able to type number
    [Arguments]    ${element}
    Input Text    ${element}    123
    ${text}=    Get Value    ${element}
    Should Not Be Equal    ${text}    123

Text field is not able to type special character
    [Arguments]    ${element}
    Input Text    ${element}    !@#
    ${text}=    Get Value    ${element}
    Should Not Be Equal    ${text}    !@#

Select Supplier
    [Arguments]    ${button}    ${elementText}
    Wait Until Keyword Succeeds    20    1    Click Button    ${button}
    Wait Until Element Is Enabled    id=txtSupplierName
    Text field is able to fill valid    id=txtSupplierName    ${variable_supplierName}
    Click Button    id=btnSearchSupplier
    Wait Until Keyword Succeeds    20    1    Wait Until Element Contains    xpath=.//*[@id='datatable_suppliers']/tbody/tr[1]/td[4]    ${variable_supplierName}
    Click Button    xpath=//tr[@class='odd']/td[1]/input
    Sleep    3
    ${text}=    Get Value    ${elementText}
    Should Contain    ${variable_supplierName}    ${text}

Select agent for agent field
    [Arguments]    ${SpecificAgent}
    Wait Until Keyword Succeeds    20    1    Click Button    id=btnSearchAgent
    Wait Until Element Is Visible    id=txtAgentName
    Text field is able to fill valid    id=txtAgentName    ${SpecificAgent}
    Click Button    id=btnAgentSearch
    Click Element    xpath=//tr[@class='odd']/td[1]/input
    Click Button    id=btnSaveAgents
    Click Button    id=btnSaveAgreement
    Scroll Page To Location    0    -2000
    Element Should Be Visible    xpath=//span[contains(.,'${SpecificAgent}')]

Text field fill nothing and show error
    [Arguments]    ${element}    ${errElement}    ${errMsg}    ${btnName}
    Wait Until Keyword Succeeds    20    1    Clear Element Text    ${element}
    Wait Until Keyword Succeeds    20    1    Click Button    ${btnName}
    Wait Until Element Contains    ${errElement}    ${errMsg}

Text field check decimal number must not more than expected
    [Arguments]    ${element}    ${value}
    input text    ${element}    ${value}
    ${ObjectValue}=    Get Value    ${element}
    Should Not Be Equal    ${ObjectValue}    ${value}

Check box default value is unchecked
    [Arguments]    ${id_or_name}
    Checkbox Should Not Be Selected    ${id_or_name}

Check box default value is checked
    [Arguments]    ${id_or_name}
    Checkbox Should Be Selected    ${id_or_name}

Check box tick to be active
    [Arguments]    ${element}    ${id_or_name}
    Wait Until Keyword Succeeds    20    1    Click Element    ${element}
    Checkbox Should Be Selected    ${id_or_name}

Check box tick to be inactive
    [Arguments]    ${element}    ${id_or_name}
    Wait Until Keyword Succeeds    20    1    Click Element    ${element}
    Checkbox Should Not Be Selected    ${id_or_name}

Click Exclude for Service Charge
    [Arguments]    ${element}    ${groupname}
    Wait Until Keyword Succeeds    20    1    Click Element    ${element}
    Radio Button Should Be Set To    ${groupname}    false

Click Include For Service Charge
    [Arguments]    ${element}    ${groupname}
    Wait Until Keyword Succeeds    20    1    Click Element    ${element}
    Radio Button Should Be Set To    ${groupname}    true
