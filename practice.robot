*** Settings ***
Library  Selenium2Library

*** Variable ***
${url}  http://www.practiceselenium.com/practice-form.html
${Okb}  class=btn.btn-info
*** Test Case ***
เปิด Browser
    Open Browser  ${url}  gc
    Maximize Browser Window
    
Check title on page
    Title Should Be  practice-form
Input information name 
    Input Text  name=firstname  john
    Input Text  name=lastname  cold  
Click ok 
    Click Button  ${Okb}
Check title on page
    Title Should Be  Welcome   
Back   
    Go Back
Click female
    Select Radio Button  sex  Female
Click Ok
    Click Button  ${Okb}
Check title on page
    Title Should Be  Welcome   
Back   
    Go Back
select 2 checkbox   
    Select Checkbox  id=tea1
    Select Checkbox  id=tea2
unselect 1 checkbox
    Unselect Checkbox  id=tea2
select continent     
    Select From List By Label  id=continents  Asia

select list wait 
    Select From List By Label  id=selenium_commands  Wait Commands
click ok 
    Click Button  ${Okb}
Check title on page
    Title Should Be  Welcome