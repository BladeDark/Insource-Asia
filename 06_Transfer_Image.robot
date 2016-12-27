*** Settings ***
Resource          Configuration.txt

*** Variables ***

*** Test Cases ***
Go to Edit Transfer
    Set Selenium Speed    0.25
    Set Selenium Implicit Wait    10
    Go to Transfer Edit page

Go to Image tab and Click Add new button
    Sleep    3
    Go to Image tab
    Click Add new + button

Image name
    Do not input anything For Image Name
    Input English letter for Image Name
    Input Number for Image Name
    Input Special character for Image Name

Image
    Do not select any picture
    Upload picture

Add new image
    Add image

Delete Image
    Click Element    css=.btn.default.btdelete.roledelete
    Wait Until Element Is Visible    css=.btn.btn-primary
    Click Element    css=.btn.btn-primary
    Wait Until Element Contains    css=div.toast-message    Data deleted successfully.

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

Go to Image tab
    Click Element    id=aimage

Click Add new + button
    Wait Until Element Is Visible    id=btnAdd
    Click Element    id=btnAdd

Do not input anything For Image Name
    Click Button    xpath=//button[@value='Submit']
    Wait Until Element Contains    xpath=(//label[@name='lblRequired'])[2]    This field is required

Input English letter for Image Name
    input text    id=titleImage    ABCDEFG
    Textfield Should Contain    id=titleImage    ABCDEFG

Input Number for Image Name
    input text    id=titleImage    1234567
    Textfield Should Contain    id=titleImage    1234567

Input Special character for Image Name
    input text    id=titleImage    !@#$%
    Textfield Should Contain    id=titleImage    !@#$%

Do not select any picture
    Click Button    xpath=//button[@value='Submit']
    Wait Until Element Contains    xpath=//*[@id='0']/div[2]/div/div/div[1]/div[2]/label    This field is required

Upload picture
    Choose File    id=Photo    ${ImagePath}

Add image
    input text    id=titleImage    Handsome
    Click Button    xpath=//button[@value='Submit']
    Wait Until Element Contains    css=div.toast-message    Data saved successfully.
    Sleep    2
