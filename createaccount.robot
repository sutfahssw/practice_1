*** Settings ***
Library  SeleniumLibrary
Test Setup  Open url
#Test Teardown  Close Browser


*** Variables ***
${id_create_account_error}  //*[@id="create_account_error"]/ol/li
${titleLogin}  Login - My Store
${titleMyAccount}  My account - My Store
${invalid_email}  Invalid email address.
${id_error}  //*[@id="center_column"]/div/p
${valid email}  test1@today.com
${error_create}  There are 8 errors
${EmailAlready}  An account using this email address has already been registered. Please enter a valid password or request a new one.
${Locator_already}  //*[@id="create_account_error"]/ol/li


*** Keywords ***
Open url
    Open Browser  http://automationpractice.com/index.php?controller=authentication&back=my-account#account-creation  gc
    Maximize Browser Window

Click button create an account 
    Click Button  id=SubmitCreate

Click Button Register
    Click Button  id=submitAccount

Check message should be
    [Arguments]  ${idLocator}  ${massage}
    Element Text Should Be  ${idLocator}  ${massage}

Input email
    [Arguments]  ${idLocator}  ${email}
    Input text  ${idLocator}  ${email}

Check title name
    [Arguments]  ${nametitle}
    Title Should Be  ${nametitle}

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
    Select From List By Value  ${datelocator}  ${date}

Input address
    [Arguments]  ${address}
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
*** Test Cases ***

Create account without input email
     Check title name    ${titleLogin}
     Click button create an account 
     Wait Until Element Is Visible   ${id_create_account_error}  10
     Check message should be    ${id_create_account_error}    ${invalid_email}

Create account with invalid form
    Check title name    ${titleLogin}
    Input email    id=email_create    haha@mci,co
    Click button create an account 
    Wait Until Element Is Visible   ${id_create_account_error}  10
    Check message should be    ${id_create_account_error}    ${invalid_email}

Create account with valid form
    Check title name    ${titleLogin}
    Input email    id=email_create    ${valid email}
    Click button create an account
    Check title name    ${titleLogin}

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
    Input address    AAAA
    Input city    BBB
    Select State    Alabama
    Input zip code    11111
    Input mobile phone    012345678
    Input future reference.    future
    Click button Register 
    Set Browser Implicit Wait  10
    Check title name    ${titleMyAccount}

Create account with same email
    Check title name    ${titleLogin}
    Input email    id=email_create    ${valid email}
    Click button create an account
    Wait Until Element Is Visible   ${id_create_account_error}  10
    Check message should be    ${Locator_already}  ${EmailAlready}


    
    


    

    
   