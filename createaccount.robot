*** Settings ***
Library  SeleniumLibrary

Suite Setup  Suite Setup

Test Setup  Reload Page

Suite Teardown  Close Browser


*** Variables ***
${idCreateAccountError}  //*[@id="create_account_error"]/ol/li
${emailAlready}  An account using this email address has already been registered. Please enter a valid password or request a new one.


*** Keywords ***
Suite Setup
    Open url
    Set Selenium Timeout  10

Open url
    Open Browser  http://automationpractice.com/index.php?controller=authentication&back=my-account#account-creation  gc
    Maximize Browser Window

Click button create an account 
    Wait Until Element Is Visible   id=SubmitCreate
    Click Button  id=SubmitCreate

Click Button Register
    Wait Until Element Is Visible   id=submitAccount
    Click Button  id=submitAccount

Check message should be
    [Arguments]  ${idLocator}  ${massage}
    Wait Until Element Is Visible  ${idLocator} 
    Element Text Should Be  ${idLocator}  ${massage}

Input email with "${email}"
    Wait Until Element Is Visible  id=email_create
    Input text  id=email_create  ${email}


Choose title with "${gender}"
    Wait Until Element Is Visible  class=radio-inline
    Select Radio Button  id_gender  ${gender}

Input firstname with "${firstname}"
    Wait Until Element Is Visible  id=customer_firstname
    Input Text  name=customer_firstname  ${firstname}

Input lastname with "${lastname}"
    Wait Until Element Is Visible  id=customer_lastname
    Input Text  name=customer_lastname  ${lastname}

Input Password with "${password}"
    Wait Until Element Is Visible  id=passwd
    Input Password  id=passwd  ${password}

Select Birthday date with "${date}"
    Wait Until Element Is Visible  id=uniform-days   
    Select From List By Value  id=days  ${date} 

Select Birthday month with "${months}"
    Wait Until Element Is Visible  id=uniform-months   
    Select From List By Value  id=months  ${months}

Select Birthday yesr with "${years}"
    Wait Until Element Is Visible  id=uniform-years   
    Select From List By Value  id=years  ${years}  

Input address with "${address}" 
    Wait Until Element Is Visible  id=address1
    Input Text  name=address1  ${address} 

Input city with "${city}"
    Wait Until Element Is Visible  id=city
    Input Text  name=city  ${city}

Select State with "${state}"
    Wait Until Element Is Visible  id=uniform-id_state
    Select From List By Label  id=id_state  ${state}

Input mobile phone with "${mobile}"
    Wait Until Element Is Visible  id=phone_mobile
    Input Text  name=phone_mobile  ${mobile}

Input future reference with "${future}"
    Wait Until Element Is Visible  id=alias
    Input Text  name=alias   ${future}

Input zip code with "${code}"
    Wait Until Element Is Visible  id=postcode
    Input Text  name=postcode  ${code}

Should show invalid email error
   Wait Until Element Contains  ${id_create_account_error}  Invalid email address. 

Should show title name with "${titleName}"
    Title Should Be    ${titleName}

Should show text error create
    Wait Until Element Contains  //*[@id="center_column"]/div/p  There are 8 errors

Should show error email already
    Wait Until Element Contains   ${id_create_account_error}  ${EmailAlready}

*** Test Cases ***

Scenario: Create account without input email
    Should show title name with "Login - My Store"
    Click button create an account 
    Should show invalid email error  


Scenario: Create account with invalid form
    Should show title name with "Login - My Store"
    Input email with "haha@mci,co"
    Click button create an account 
    Should show invalid email error

Scenario: Create account with valid form
    Should show title name with "Login - My Store"
    Input email with "test4@today.com"
    Click button create an account
    Should show title name with "Login - My Store"

Scenario: Create account not input in all required field
    Should show title name with "Login - My Store"
    Input email with "test4@today.com"
    Click button create an account
    Click button Register 
    Should show text error create
    
Scenario: Create account input all required field   
    Should show title name with "Login - My Store"
    Input email with "test4@today.com"
    Click button create an account
    Choose title with "2" 
    Input firstname with "sky"
    Input lastname with "sky"
    Input Password with "12345"
    Select Birthday date with "13"
    Select Birthday month with "4"
    Select Birthday yesr with "1999"
    Input address with "AAAAA" 
    Input city with "BBBB"   
    Select State with "Alabama"
    Input zip code with "11111"
    Input mobile phone with "012345678"
    Input future reference with "future"
    #Click button Register 
    #Should show title name with "My account - My Store"

Scenario: Create account with same email
    Should show title name with "Login - My Store"
    Input email with "test3@today.com"
    Click button create an account
    Should show error email already


    
    


    

    
   