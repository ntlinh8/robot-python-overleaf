*** Settings ***
Library    SeleniumLibrary
Resource    LibraryDefinations.robot
Resource    GlobalConstants.robot
*** Keywords ***
Open Page URL
    [Arguments]    ${url}
    SeleniumLibrary.Open Browser    ${url}

Get Page Title
    ${title}    SeleniumLibrary.Get Title
    [Return]    ${title}
    
Get Page URL
    ${url}    SeleniumLibrary.Get Location
    [Return]    ${url}
    
Get Page Source Code
    ${source}    SeleniumLibrary.Get Source
    [Return]    ${source}
    
Back To Previous Page
    SeleniumLibrary.Go Back
    
Refesh Current Page
    SeleniumLibrary.Reload Page
    
Wait For Alert Presence
    Wait Until Keyword Succeeds    ${retry_timeout}    ${retry_interval_timeout}    SeleniumLibrary.Alert Should Be Present        
  
Accept Alert
    SeleniumLibrary.Handle Alert    ACCEPT
    
Cancle Alert
    SeleniumLibrary.Handle Alert    DISMISS
    
Get Alert Text
    ${message}    SeleniumLibrary.Handle Alert    LEAVE
    [Return]    ${message}
    
Send Key To Alert
    [Arguments]    ${message}
    Wait For Alert Presence    
    SeleniumLibrary.Input Text Into Alert    ${message}
    
Get Window Handles
    ${window_list}    SeleniumLibrary.Get Window Handles  
    [Return]      ${window_list}

Select Window By Title
    [Arguments]    ${title}
    SeleniumLibrary.Select Window    title=${title}
    
Select Window By Name
    [Arguments]    ${name}
    SeleniumLibrary.Select Window    name=${name}
    
Select Window By URL
    [Arguments]    ${url}
    SeleniumLibrary.Select Window    url=${url}
    
Switch To Main Window
    SeleniumLibrary.Select Window    MAIN
    
Switch To New Window
    SeleniumLibrary.Select Window    NEW
    
Switch To Currect Window
    SeleniumLibrary.Select Window    CURRENT
    
Get Dynamic Xpath
    [Arguments]    ${xpath_locator}    @{dynamic_values}
    ${locator}=    Format String    ${xpath_locator}    @{dynamic_values}    
    [Return]    ${locator}

Get WebElement By Locator
    [Arguments]    ${locator}
    ${element}    SeleniumLibrary.Get WebElement    ${locator}
    [Return]    ${element}
    
Get WebElements By Locator
    [Arguments]    ${locator}
    ${element_list}    SeleniumLibrary.Get WebElements    ${locator}
    [Return]    ${element_list}
    
Get Cookies In Current Page
    ${cookie_list}=    SeleniumLibrary.Get Cookies   
    [Return]    ${cookie_list}
    
Set Cookies And Reload Page
    [Arguments]    ${cookie_list}
    FOR    ${cookie}    IN    @{cookie_list}
        ${key}=    Get Dictionary Keys    ${cookie}    
        ${value}=    Get Dictionary Values    ${cookie}    
        SeleniumLibrary.Add Cookie    ${key}    ${value}    
    END
    Sleep    ${sleep_timeout}    
    Refesh Current Page
    
Click To Element By Locator
    [Arguments]    ${locator}    @{dynamic_values}
    ${locator}=    Get Dynamic Xpath    ${locator}    @{dynamic_values}
    SeleniumLibrary.Click Element    ${locator}    
    
Send Key To Element
    [Arguments]    ${locator}    ${value}    @{dynamic_values}
    ${locator}=    Get Dynamic Xpath    ${locator}    @{dynamic_values}
    SeleniumLibrary.Clear Element Text    ${locator}
    SeleniumLibrary.Input Text    ${locator}    ${value}
    
Send Key To Date Textbox
    [Arguments]    ${locator}    ${value}
    Remove Element Attribute By JS    ${locator}    type
    Sleep    ${sleep_timeout}    
    Wait For Element Visible    ${locator}

Select Item In Default Dropdown
    [Arguments]    ${locator}    ${expected_item}
    SeleniumLibrary.Select From List By Label    ${locator}    ${expected_item}    
    
Get Selected Item In Default Dropdown
    [Arguments]    ${locator}
    ${actual_item}=    SeleniumLibrary.Get Selected List Label    ${locator}
    [Return]    ${actual_item}
    
Get Element Attribute By Locator
    [Arguments]    ${locator}    ${attribute_name}    
    SeleniumLibrary.Get Element Attribute    ${locator}    ${attribute_name}
    
Get Element Text By Locator
    [Arguments]    ${locator}    @{dynamicValues}
    ${locator}=    Get Dynamic Xpath    ${locator}    @{dynamic_values}
    SeleniumLibrary.Get Text    ${locator}
    
Get Element Size
    [Arguments]    ${locator}
    ${element_list}=    Get WebElements By Locator    ${locator}
    ${size}=    Get Length    ${element_list}
    [Return]    ${size}
    
Check To Default Checkbox/Radio
    [Arguments]    ${locator}
    ${checked_value}=    Get Element Attribute By Locator    ${locator}    checked
    Run Keyword If    ${checked_value}==${None}    Click To Element By Locator    ${locator}
    
Uncheck To Default Checkbox/Radio
    [Arguments]    ${locator}
    ${checked_value}=    Get Element Attribute By Locator    ${locator}    checked
    Run Keyword If    "${checked_value}"=="True"    Click To Element By Locator    ${locator}

Is Element Displayed
    [Arguments]    ${locator}    @{dynamic_values}
    ${locator}=    Get Dynamic Xpath    ${locator}    @{dynamic_values}    
    ${status}=    Run Keyword And Return Status    SeleniumLibrary.Element Should Be Visible    ${locator}
    [Return]    ${status}
    
Is Element Enable
    [Arguments]    ${locator}    @{dynamic_values}
    ${locator}=    Get Dynamic Xpath    ${locator}    @{dynamic_values}    
    ${status}=    Run Keyword And Return Status    SeleniumLibrary.Element Should Be Enabled    ${locator}
    [Return]    ${status}
    
Is Element Selected
    [Arguments]    ${locator}    @{dynamic_values}
    ${locator}=    Get Dynamic Xpath    ${locator}    @{dynamic_values}    
    ${status}=    Run Keyword And Return Status    SeleniumLibrary.Element Should Be Focused    ${locator}
    [Return]    ${status}
   
Is Element Undisplayed
    [Arguments]    ${locator}    @{dynamic_values}
    ${locator}=    Get Dynamic Xpath    ${locator}    @{dynamic_values}    
    SeleniumLibrary.Set Selenium Implicit Wait    ${implicit_short_timeout}
    ${status}=    Run Keyword And Return Status    SeleniumLibrary.Element Should Not Be Visible    ${locator}
    SeleniumLibrary.Set Selenium Implicit Wait    ${implicit_long_timeout}
    [Return]    ${status}
    
Is Element Disable
    [Arguments]    ${locator}    @{dynamic_values}
    ${locator}=    Get Dynamic Xpath    ${locator}    @{dynamic_values} 
    ${status}=    Run Keyword And Return Status    SeleniumLibrary.Element Should Be Disabled    ${locator}
    [Return]    ${status}
    
Switch To Frame By Locator
    [Arguments]    ${locator}
    SeleniumLibrary.Select Frame    ${locator}
    
Mouse To Element By Locator
    [Arguments]    ${locator}
    SeleniumLibrary.Mouse Over    ${locator}
    
Send Keyboard By Locator
    [Arguments]    ${locator}    ${keys}
    SeleniumLibrary.Press Key    ${locator}    ${keys}
    
Double Click To Element By Locator
    [Arguments]    ${locator}
    SeleniumLibrary.Double Click Element    ${locator}
    
Right Click To Element By Locator
    [Arguments]    ${locator}
    SeleniumLibrary.Open Context Menu    ${locator}
    
Drag And Drop By Locator
    [Arguments]    ${source_locator}    ${defination_locator}
    SeleniumLibrary.Drag And Drop    ${source_locator}    ${defination_locator}

Upload File
    [Arguments]    ${locator}    ${path_file}
    Send Key To Element    ${locator}    ${path_file}   
    
Upload Multiple File
    [Arguments]     ${locator}    ${folder_name}    @{file_list}
    ${full_path}=    Set Variable    ${none}
    FOR    ${file_name}    IN    @{file_list}
        ${full_path}=    Catenate    SEPARATOR=\n    ${full_path}    ${file_name}
    END
    Send Key To Element    ${locator}    ${full_path}    

Scroll To Bottom Page By JS
    SeleniumLibrary.Execute Javascript    window.scrollBy(0,document.body.scrollHeight)

Click To Element By JS
    [Arguments]    ${locator}
    ${element}=    Get WebElement By Locator    ${locator}
    SeleniumLibrary.Execute Javascript    arguments[0].click();    ARGUMENTS    ${element}
    
Scroll On Down To Element By Locator
    [Arguments]    ${locator}
    ${element}=    Get WebElement By Locator    ${locator}
    SeleniumLibrary.Execute Javascript    arguments[0].scrollIntoView(false);    ARGUMENTS    ${element}
    
Scroll On Top Element By Locator
    [Arguments]    ${locator}
    ${element}=    Get WebElement By Locator    ${locator}
    SeleniumLibrary.Execute Javascript    arguments[0].scrollIntoView(true);    ARGUMENTS    ${element}
    
Remove Element Attribute By JS
    [Arguments]    ${locator}    ${attribute_name}
    ${element}=    Get WebElement By Locator    ${locator}
    SeleniumLibrary.Execute Javascript    arguments[0].removeAttribute('${attribute_name}');    ARGUMENTS    ${element}
      
Add Element Attribute By JS
    [Arguments]    ${locator}    ${attribute_name}    ${attribute_value}
    ${element}=    Get WebElement By Locator    ${locator}
    SeleniumLibrary.Execute Javascript    arguments[0].setAttribute('${attribute_name}', '${attribute_value}');    ARGUMENTS    ${element}
    
Get Element Validation Message
    [Arguments]    ${locator}
    ${element}=    Get WebElement By Locator    ${locator}
    SeleniumLibrary.Execute Javascript    return arguments[0].validationMessage;    ARGUMENTS    ${element}
    
Wait For Page Ready By JS
    Wait Until Keyword Succeeds    ${retry_timeout}    ${retry_interval_timeout}    Is Page Ready

Is Page Ready
    ${flag1}=    SeleniumLibrary.Execute Javascript    return (window.jQuery != null) && (jQuery.active ===0);    
    ${flag2}=    SeleniumLibrary.Execute Javascript    return document.readyState        
    ${is_ready}    Evaluate    ${flag1} and ${flag2}    
    [Return]    ${is_ready}
    
Wait For Element Visible
    [Arguments]    ${locator}    @{dynamic_values}
    ${locator}=    Get Dynamic Xpath    ${locator}    @{dynamic_values}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator} 
    
Wait For Element Invisible
    [Arguments]    ${locator}    @{dynamic_values}
    ${locator}=    Get Dynamic Xpath    ${locator}    @{dynamic_values}
    SeleniumLibrary.Set Selenium Implicit Wait    ${implicit_short_timeout}
    SeleniumLibrary.Wait Until Element Is Not Visible    ${locator}    
    SeleniumLibrary.Set Selenium Implicit Wait    ${implicit_long_timeout}

Wait For Element Clickable
    [Arguments]    ${locator}    @{dynamic_values}
    ${locator}=    Get Dynamic Xpath    ${locator}    @{dynamic_values}
    Wait Until Element Is Enabled    ${locator}    
    
Wait For Element Presence
    [Arguments]    ${locator}    @{dynamic_values}
    ${locator}=    Get Dynamic Xpath    ${locator}    @{dynamic_values}
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}  
    




