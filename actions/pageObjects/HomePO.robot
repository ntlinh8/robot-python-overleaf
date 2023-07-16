*** Settings ***
Resource    ../common/BasePage.robot
Resource    ../../interfaces/HomeUI.robot
*** Keywords ***
Verify Alert With "${message}" Display
    [Documentation]    
    ...    [Description]    Verify Alert With "${message}" Display
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.15
    Log To Console    Verify Alert With "${message}" Display
    Wait For Element Visible    ${HomePage_text_DynamicAlertByLabel}      ${message}
    ${status}=    Is Element Displayed    ${HomePage_text_DynamicAlertByLabel}      ${message}
    Should Be True    ${status}




