*** Settings ***
Resource    ../common/BasePage.robot
Resource    ../../interfaces/CommonUI.robot
Resource    ../common/GlobalConstants.robot
*** Keywords ***
Open Overleaf Page
    [Documentation]    
    ...    [Description]    Open Overleaf Page
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.15
    Log To Console    Open Overleaf Page    
    SeleniumLibrary.Open Browser    ${base_url}    ${browser}
    SeleniumLibrary.Maximize Browser Window
    
Verify "${actualValue}" Equal "${expectedValue}"
    [Documentation]    
    ...    [Description]    Verify "${actualValue}" Equal "${expectedValue}"
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.15
    Log To Console    Verify "${actualValue}" Equal "${expectedValue}" 
    Should Be Equal    ${actualValue}    ${actualValue}  
Click To Header Link By "${headerLinkLabel}" Label
    [Documentation]    
    ...    [Description]    Click To Header Link By "${buttonLabel}" Label
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.15
    Log To Console    Click To Header Link By "${headerLinkLabel}" Label    
    Wait For Element Clickable    ${Common_button_DynamicHeaderLinkByLabel}     ${headerLinkLabel}    
    Click To Element By Locator    ${Common_button_DynamicHeaderLinkByLabel}     ${headerLinkLabel}

Click To Button By "${buttonLabel}" Label
    [Documentation]    
    ...    [Description]    Click To Header Link By "${buttonLabel}" Label
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.15
    Log To Console    Click To Header Link By "${buttonLabel}" Label    
    Wait For Element Clickable    ${Common_button_DynamicButtonByLabel}     ${buttonLabel}    
    Click To Element By Locator    ${Common_button_DynamicButtonByLabel}     ${buttonLabel}
    
Input "${text}" To Dynamic Textbox By "${textboxID}" ID
    [Documentation]    
    ...    [Description]    Input "${text}" To Dynamic Textbox By "${textboxID}" ID
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.15
    Log To Console    Input "${text}" To Dynamic Textbox By "${textboxID}" ID    
    Wait For Element Clickable    ${Common_textbox_DynamicTextboxByID}     ${textboxID}    
    Send Key To Element    ${Common_textbox_DynamicTextboxByID}    ${text}     ${textboxID}
    
Verify Error Message In "${textboxID}" Field Equal "${expectedMessage}"
    [Documentation]    
    ...    [Description]    Get Error Message In Textbox With "${textboxID}" ID
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.15
    Log To Console    Get Error Message In Textbox With "${textboxID}" ID
    Wait For Element Visible    ${Common_text_DynamicErrorMessageForTextbox}      ${textboxID}
    ${actualMessage}=    Get Element Text By Locator    ${Common_text_DynamicErrorMessageForTextbox}      ${textboxID}   
    Should Be Equal    ${expectedMessage}    ${actualMessage}    