*** Settings ***
Library  Selenium2Library

*** Variable ***
${url}  http://www.practiceselenium.com/practice-form.html
${Okb}  class=btn.btn-info

*** Keywords ***
Open url
    Open Browser  ${url}  gc
    Maximize Browser Window

Check title on page
    Title Should Be  practice-form

Input firstname 
    [Arguments]  ${firstname}  
    Input Text  name=firstname  ${firstname}
Input lastname
    [Arguments]  ${lastname}
    Input Text  name=lastname   ${lastname}
Click ok 
    Click Button  ${Okb}

Back   
    Go Back
Click sex
    [Arguments]  ${sex}
    Select Radio Button  sex  ${sex}

select 2 checkbox   
    Select Checkbox  id=tea1
    Select Checkbox  id=tea2
unselect 1 checkbox
    Unselect Checkbox  id=tea2
select continent     
    Select From List By Label  id=continents  Asia

select list wait 
    Select From List By Label  id=selenium_commands  Wait Commands


*** Test Case ***

Test input information 
    Open url 
    Check title on page
    Input firstname    jonh 
    Input lastname     cold   
    Click ok
    Back
    Click sex    Female
    Sleep  2
    Click sex    Male
    select 2 checkbox
    unselect 1 checkbox
    select continent
    select list wait 
    Click ok 
    


#Test input thai information 
    # Open url 
    # Check title on page
    # Input firstname    โจ 
    # Input lastname     คูล  
    # Click ok
    # Back
    # Click female
    # select 2 checkbox
    # unselect 1 checkbox
    # select continent
    # select list wait 
    # Click ok 
    # Close Browser
    