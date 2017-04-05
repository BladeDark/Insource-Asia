*** Settings ***
Library           Selenium2Library

*** Keywords ***
click_PerPax
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=.//*[@for='CostMethod-0']/span[3]
    check_PerPax_IsCheck

click_CostComponent
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=.//*[@for='CostMethod-1']/span[3]
    check_CostComponent_IsCheck

click_PerVehicle
    Wait Until Keyword Succeeds    20    1    Click Element    xpath=.//*[@for='CostMethod-2']/span[3]
    check_PerVehicle_IsCheck

click_PromoFare_Tobe_Active
    Click Element    xpath=.//label[@for='IsPromotion']/span[3]
    Checkbox Should Not Be Selected    id=IsPromotion

click_PromoFare_Tobe_Inactive
    Click Element    xpath=.//label[@for='IsPromotion']/span[2]
    Checkbox Should Not Be Selected    id=IsPromotion

click_PKOnly_Tobe_Active
    Click Element    xpath=.//label[@for='IsPackageType']/span[3]
    Checkbox Should Not Be Selected    id=IsPackageType

click_PKOnly_Tobe_Inactive
    Click Element    xpath=.//label[@for='IsPackageType']/span[2]
    Checkbox Should Not Be Selected    id=IsPackageType

click_SIC_Tobe_Active
    Checkbox Should Not Be Selected    id=IsSIC

click_SIC_Tobe_Inactive
    Checkbox Should Not Be Selected    id=IsSIC

check_PerPax_IsCheck
    Radio Button Should Be Set To    CostMethod    1

check_CostComponent_IsCheck
    Radio Button Should Be Set To    CostMethod    2

check_PerVehicle_IsCheck
    Radio Button Should Be Set To    CostMethod    3

click_Back_To_TransferFare_List
    Wait Until Keyword Succeeds    20    1    Click Element    id=btnBckAgreeList

click_Cancel_btn
    Wait Until Keyword Succeeds    20    1    Click Element    id=btnCancelAgreement
