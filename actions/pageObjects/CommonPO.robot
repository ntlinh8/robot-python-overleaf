*** Settings ***
Resource    ../common/BasePage.robot
Resource    ../../interfaces/CommonUI.robot
Resource    ../common/GlobalConstants.robot
*** Keywords ***
Open Overleaf Page And Login
    [Documentation]    
    ...    [Description]    Open Overleaf Page And Login
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.19
    Log To Console    Open Overleaf Page And Login 
    Open Overleaf Page
    Click To Header Link By "Log In" Label
    Input "${email}" To Dynamic Textbox By "email" ID
    Input "${password}" To Dynamic Textbox By "password" ID
    Click To Button By "Log in with your email" Label
    Verify Header Link By "Account" Label Display

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
    ...    [Description]    Verify Error Message In "${textboxID}" Field Equal "${expectedMessage}"
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.15
    Log To Console    Verify Error Message In "${textboxID}" Field Equal "${expectedMessage}"
    Wait For Element Visible    ${Common_text_DynamicErrorMessageForTextbox}      ${textboxID}
    ${actualMessage}=    Get Element Text By Locator    ${Common_text_DynamicErrorMessageForTextbox}      ${textboxID}   
    Should Be Equal    ${expectedMessage}    ${actualMessage}    
    
Verify Header Link By "${headerLinkLabel}" Label Display
    [Documentation]    
    ...    [Description]    Verify Header Link By "${headerLinkLabel}" Label Display
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.19
    Log To Console    Verify Header Link By "${headerLinkLabel}" Label Display 
    Wait For Element Visible    ${Common_button_DynamicHeaderLinkByLabel}     ${headerLinkLabel}    
    ${status}=    Is Element Displayed    ${Common_button_DynamicHeaderLinkByLabel}      ${headerLinkLabel}
    Should Be True    ${status}
    
Wait For Loading Icon Invisible
    [Documentation]    
    ...    [Description]    Wait For Loading Icon Invisible
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.19
    Log To Console    Wait For Loading Icon Invisible
    Wait For Element Invisible    ${Common_icon_LoadingIcon}
    ${status}=    Is Element Undisplayed    ${Common_button_DynamicHeaderLinkByLabel}
    Should Be True    ${status}