*** Settings ***
Resource    ../actions/pageObjects/CommonPO.robot
Resource    ../actions/pageObjects/HomePO.robot
Suite Setup    Open Overleaf Page
Suite Teardown    Close All Browsers
*** Variables ***

*** Test Cases ***
TC01 - Register With Empty Data
    [Documentation]    
    ...    [Description]    Register With Empty Data
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.15
    Click To Header Link By "Register" Label
    Input "${EMPTY}" To Dynamic Textbox By "email" ID
    Input "${EMPTY}" To Dynamic Textbox By "passwordField" ID
    Click To Button By "Register using your email" Label
    
    Verify Error Message In "email" Field Equal "Please fill out this field."
    Verify Error Message In "passwordField" Field Equal "Please fill out this field."
    
TC02 - Register With Wrong Format Email
    [Documentation]    
    ...    [Description]    Register With Wrong Format Email
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.16
    Click To Header Link By "Register" Label
    Input "Elon" To Dynamic Textbox By "email" ID
    Input "${EMPTY}" To Dynamic Textbox By "passwordField" ID
    Click To Button By "Register using your email" Label
    
    Verify Error Message In "email" Field Equal "Please include an '@' in the email address. 'Elon' is missing an '@'."
    Verify Error Message In "passwordField" Field Equal "Please fill out this field."

TC03 - Register With Incomplete Email
    [Documentation]    
    ...    [Description]    Register With Incomplete Email
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.16
    Click To Header Link By "Register" Label
    Input "Elon@" To Dynamic Textbox By "email" ID
    Input "${EMPTY}" To Dynamic Textbox By "passwordField" ID
    Click To Button By "Register using your email" Label
    
    Verify Error Message In "email" Field Equal "Please enter a part following '@'. 'Elon@' is incomplete."
    Verify Error Message In "passwordField" Field Equal "Please fill out this field."

TC04 - Register With Exist Email
    [Documentation]    
    ...    [Description]    Register With Exist Email
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.16
    Click To Header Link By "Register" Label
    Input "thuylinh2409nguyen@gmail.com" To Dynamic Textbox By "email" ID
    Input "Abc13579" To Dynamic Textbox By "passwordField" ID
    Click To Button By "Register using your email" Label
    
    Verify Alert With "This email is already registered" Display

