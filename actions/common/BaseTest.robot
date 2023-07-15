*** Settings ***
Library    SeleniumLibrary    
Resource    GlobalConstants.robot
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
