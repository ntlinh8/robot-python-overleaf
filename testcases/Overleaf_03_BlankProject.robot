*** Settings ***
Resource    ../actions/pageObjects/CommonPO.robot
Resource    ../actions/pageObjects/HomePO.robot
Suite Setup    Open Overleaf Page And Login
Suite Teardown    Close All Browsers
*** Variables ***
# Blank project
${BlankProjectName}    bankprojectname

*** Test Cases ***
TC10 - Create Blank Project
    [Documentation]    
    ...    [Description]    Create Blank Project
    ...    [Author]         Sunny Nguyen
    ...    [Update Date]    2023.07.19
    Click To Button By "New Project" Label
    Click To Header Link By "Blank Project" Label
    Input "${BlankProjectName}" To Project Name Textbox
    Click To Button By "Create" Label
    
    Wait For Loading Icon Invisible
    Verify The Current Page Title Is "${BlankProjectName} - Online LaTeX Editor Overleaf"




