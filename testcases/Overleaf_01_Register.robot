*** Settings ***
Resource    ../actions/pageObjects/CommonPO.robot
Resource    ../actions/common/BaseTest.robot
Test Setup    Open Overleaf Page
Test Teardown    Close All Browsers
*** Variables ***

*** Test Cases ***
TC01 - Register With Empty Data
    [Documentation]    
    ...    [Description]    Register webpage with empty data
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.15
    Click To Header Link By "Register" Label
    Input "${EMPTY}" To Dynamic Textbox By "email" ID
    Input "${EMPTY}" To Dynamic Textbox By "passwordField" ID
    Click To Button By "Register using your email" Label
    
    ${email_error_message}=    Get Error Message In Textbox With "email" ID
    ${password_error_message}=    Get Error Message In Textbox With "passwordField" ID
    Verify "${email_error_message}" Equal "Please fill out this field."
    Verify "${password_error_message}" Equal "Please fill out this field."
