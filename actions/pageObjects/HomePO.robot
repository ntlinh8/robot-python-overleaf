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
    
Input "${project_name}" To Project Name Textbox
    [Documentation]    
    ...    [Description]    Input "${project_name}" To Project Name Textbox
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.19
    Log To Console    Input "${project_name}" To Project Name Textbox
    Wait For Element Visible    ${HomePage_textbox_NewProject}    
    Send Key To Element    ${HomePage_textbox_NewProject}    ${project_name}    
