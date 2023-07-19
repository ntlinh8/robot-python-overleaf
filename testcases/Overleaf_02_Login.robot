*** Settings ***
Resource    ../actions/pageObjects/CommonPO.robot
Resource    ../actions/pageObjects/HomePO.robot
Suite Setup    Open Overleaf Page
Suite Teardown    Close All Browsers
*** Variables ***
${wrong_email}                     Elon
${incomplete_email}                Elon@
${incorrect_password}              Abc13579

*** Test Cases ***
TC05 - Login With Empty Data
    [Documentation]    
    ...    [Description]    Login With Empty Data
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.19
    Click To Header Link By "Log In" Label
    Input "${EMPTY}" To Dynamic Textbox By "email" ID
    Input "${EMPTY}" To Dynamic Textbox By "password" ID
    Click To Button By "Log in with your email" Label
    Verify Error Message In "email" Field Equal "Please fill out this field."
    Verify Error Message In "password" Field Equal "Please fill out this field."
    
TC06 - Login With Wrong Format Email
    [Documentation]    
    ...    [Description]    Login With Wrong Format Email
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.19
    Refesh Current Page
    Input "${wrong_email}" To Dynamic Textbox By "email" ID
    Input "${EMPTY}" To Dynamic Textbox By "password" ID
    Click To Button By "Log in with your email" Label
    Verify Error Message In "email" Field Equal "Please include an '@' in the email address. '${wrong_email}' is missing an '@'."
    Verify Error Message In "password" Field Equal "Please fill out this field."

TC07 - Login With Incomplete Email
    [Documentation]    
    ...    [Description]    Login With Incomplete Email
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.19
    Refesh Current Page
    Input "${incomplete_email}" To Dynamic Textbox By "email" ID
    Input "${EMPTY}" To Dynamic Textbox By "password" ID
    Click To Button By "Log in with your email" Label
    Verify Error Message In "email" Field Equal "Please enter a part following '@'. '${incomplete_email}' is incomplete."
    Verify Error Message In "password" Field Equal "Please fill out this field."

TC08 - Login With Incorrect Password    
    [Documentation] 
    ...    [Description]    Login With Incorrect Password    
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.19
    Refesh Current Page
    Input "${email}" To Dynamic Textbox By "email" ID
    Input "${incorrect_password}" To Dynamic Textbox By "password" ID
    Click To Button By "Log in with your email" Label
    Verify Alert With "Your email or password is incorrect." Display
    
TC09 - Login With Correct Password
    [Documentation] 
    ...    [Description]    Login With Correct Password   
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.19
    Refesh Current Page
    Input "${email}" To Dynamic Textbox By "email" ID
    Input "${password}" To Dynamic Textbox By "password" ID
    Click To Button By "Log in with your email" Label
    Verify Header Link By "Account" Label Display
