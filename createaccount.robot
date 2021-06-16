*** Settings ***
Library  SeleniumLibrary

Suite Setup  Set Selenium Timeout  10

Test Setup  Open url
#Test Teardown  Close Browser


*** Variables ***
${idCreateAccountError}  //*[@id="create_account_error"]/ol/li
#${invalidEmail}  Invalid email address.
${idError}  //*[@id="center_column"]/div/p
${validEmail}  test1@today.com
${errorCreate}  There are 8 errors
${emailAlready}  An account using this email address has already been registered. Please enter a valid password or request a new one.
${locatorAlready}  //*[@id="create_account_error"]/ol/li


*** Keywords ***
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
    Input text  id=email_create  ${email}


Choose Title
    [Arguments]  ${gender}
    Select Radio Button  id_gender  ${gender}

Input firstname
    [Arguments]  ${firstname}
    Input Text  name=customer_firstname  ${firstname}

Input lastname
    [Arguments]  ${lastname}
    Input Text  name=customer_lastname  ${lastname}

Password   
    [Arguments]   ${password}  
    Input Password  id=passwd  ${password}

Select Birthday
    [Arguments]  ${datelocator}  ${date}
    Wait Until Element Is Visible  ${datelocator}   
    Select From List By Value  ${datelocator}  ${date} 

Input address with "${address}" 
    Input Text  name=address1  ${address} 

Input city
    [Arguments]  ${city}
    Input Text  name=city  ${city}

Select State
    [Arguments]  ${state}
    Select From List By Label  id=id_state  ${state}

Input mobile phone
    [Arguments]  ${mobile}
    Input Text  name=phone_mobile  ${mobile}

Input future reference.
    [Arguments]  ${future}
    Input Text  name=alias   ${future}

Input zip code
    [Arguments]  ${code}
    Input Text  name=postcode  ${code}

Should show invalid email error
   Wait Until Element Contains  ${id_create_account_error}  ${invalid_email} 

Should show title name with "${titleName}"
    Check title name    ${titleName}

*** Test Cases ***

Create account without input email
    Should show title name with "Login - My Store"
    Click button create an account 
    Should show invalid email error  


Create account with invalid form
    Should show title name with "Login - My Store"
    Input email with "haha@mci,co"
    Click button create an account 
    Should show invalid email error

Create account with valid form
    Should show title name with "Login - My Store"
    Input email with "test3@today.com"
    Click button create an account
    Should show title name with "Login - My Store"

Create account not input in all required field
    Check title name    ${titleLogin}
    Input email    id=email_create    ${valid email}
    Click button create an account
    Set Browser Implicit Wait  15
    Click button Register 
    Wait Until Page Contains Element  ${id_error}   15
    Check message should be    ${id_error}    ${error_create}
    
Create account input all required field
    Check title name    ${titleLogin}
    Input email    id=email_create    ${valid email}
    Click button create an account
    Set Browser Implicit Wait  15
    Choose Title    id_gender2
    Input firstname  sky
    Input lastname   sky
    Password    12345
    Select Birthday      id=days    3
    Select Birthday      id=months    4
    Select Birthday    id=years    1999
    Input address with "AAAAA" 
    Input address with "AAAA" and "BBBB" 
    Input city    BBB
    Select State    Alabama
    Input zip code    11111
    Input mobile phone    012345678
    Input future reference.    future
    Click button Register 
    Set Browser Implicit Wait  10
    Should show title name with "My account - My Store"

Create account with same email
    Check title name    ${titleLogin}
    Input email    id=email_create    ${valid email}
    Click button create an account
    Wait Until Element Is Visible   ${id_create_account_error}  10
    Check message should be    ${Locator_already}  ${EmailAlready}


    
    


    

    
   