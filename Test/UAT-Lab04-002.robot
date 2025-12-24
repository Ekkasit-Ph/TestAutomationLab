*** settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${REGISTER_URL}    http://localhost:7272/Lab4/Registration.html
${SUCCESS_URL}    http://localhost:7272/Lab4/Success.html

*** Test Cases ***
Open Workshop Registration Page
    Open Browser To Registration Page
    Close Browser

Empty First Name
    Open Browser To Registration Page
    Input Text    id=lastname    Sodyod
    Input Text    id=organization    CS KKU 
    Input Text    id=email    somyod@kkumail.com
    Input Text    id=phone    091-001-1234
    Submit Register
    Verify Fail Register    Please enter your first name!!
    Close Browser

Empty Last Name
    Open Browser To Registration Page
    Input Text    id=firstname    Somyod
    Input Text    id=organization    CS KKU 
    Input Text    id=email    somyod@kkumail.com
    Input Text    id=phone    091-001-1234
    Submit Register
    Verify Fail Register    Please enter your last name!!
    Close Browser

Empty First Name and Last Name
    Open Browser To Registration Page
    Input Text    id=organization    CS KKU 
    Input Text    id=email    somyod@kkumail.com
    Input Text    id=phone    091-001-1234
    Submit Register
    Verify Fail Register    Please enter your name!!
    Close Browser

Empty Email
    Open Browser To Registration Page
    Input Text    id=firstname    Somyod
    Input Text    id=lastname    Sodsai
    Input Text    id=organization    CS KKU 
    Input Text    id=phone    091-001-1234
    Submit Register
    Verify Fail Register    Please enter your email!!
    Close Browser

Empty Phone Number
    Open Browser To Registration Page
    Input Text    id=firstname    Somyod
    Input Text    id=lastname    Sodsai
    Input Text    id=organization    CS KKU 
    Input Text    id=email    somyod@kkumail.com
    Submit Register
    Verify Fail Register    Please enter your phone number!!
    Close Browser

Invalid Phone Number
    Open Browser To Registration Page
    Input Text    id=firstname    Somyod
    Input Text    id=lastname    Sodsai
    Input Text    id=organization    CS KKU 
    Input Text    id=email    somyod@kkumail.com
    Input Text    id=phone    1234
    Submit Register
    Verify Fail Register    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)
    Close Browser


*** Keywords ***
Open Browser To Registration Page
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Location Should Be    ${REGISTER_URL}

Submit Register
    Click Button    id=registerButton

Verify Fail Register
    [Arguments]    ${error}
    Location Should Contain    ${REGISTER_URL}
    Page Should Contain    ${error}