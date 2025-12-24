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

Register Success
    Open Browser To Registration Page
    Input Text    id=firstname    Somyod
    Input Text    id=lastname    Sodsai
    Input Text    id=organization    CS KKU 
    Input Text    id=email    somyod@kkumail.com
    Input Text    id=phone    091-001-1234
    Submit Register
    Verify Success Page
    Close Browser

Register Success No Organization Info
    Open Browser To Registration Page
    Input Text    id=firstname    Somyod
    Input Text    id=lastname    Sodsai
    Input Text    id=email    somyod@kkumail.com
    Input Text    id=phone    091-001-1234
    Submit Register
    Verify Success Page
    Close Browser
    
*** Keywords ***
Open Browser To Registration Page
    Open Browser    ${REGISTER_URL}    ${BROWSER}
    Location Should Be    ${REGISTER_URL}

Submit Register
    Click Button    id=registerButton

Verify Success Page
    Location Should Contain    ${SUCCESS_URL}
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.