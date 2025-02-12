*** Settings ***
Library    SeleniumLibrary

Suite Setup    Open Browser    https://automationexercise.com/    chrome
Suite Teardown    Close Browser

*** Variables ***
${USERNAME}    omega1234az    # Update this with the desired username
${EMAIL}       omega1234azaza@gmail.com
${PASSWORD}    0956798405sT_
${DAY}          24
${MOUNT}        7
${YEAR}         2003
${Firstname}    Suphakit
${Lastname}     Ranphol   
${Company}      Thai Company     
${Address}      733 moo1 phayao
${Address2}     733 moo1 phayao
${Country}      United States
${State}        Phayao
${City}         Phayao
${Zipcode}      56000
${Number}       0891234567

*** Keywords ***
Click Register Button
    Click Element    xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a

Input Username
    [Arguments]    ${USERNAME}
    Input Text    xpath=//*[@id="form"]/div/div/div[3]/div/form/input[2]    ${USERNAME}

Input Email
    [Arguments]    ${EMAIL}
    Input Text    xpath=//*[@id="form"]/div/div/div[3]/div/form/input[3]    ${EMAIL}

Submit Registration
    Click Element    xpath=//*[@id="form"]/div/div/div[3]/div/form/button

Select Gender
    Click Element    id=uniform-id_gender2

Input Password
    [Arguments]    ${PASSWORD}
    Input Text    xpath=//*[@id="password"]    ${PASSWORD}    delay=1.5s

SelectDate
    [Arguments]    ${DAY}    ${MOUNT}    ${YEAR}
    Select From List By Value    id=days    ${DAY}
    Select From List By Value    id=months    ${MOUNT}
    Select From List By Value    id=years    ${YEAR}

Input Address Information
    [Arguments]    ${Firstname}    ${Lastname}    ${Company}    ${Address}    ${Address2}  ${Country}    ${State}    ${City}    ${Zipcode}    ${Number}
    Input Text    name=first_name    ${Firstname}
    Input Text    name=last_name    ${Lastname}
    Input Text    name=company    ${Company}
    Input Text    name=address1    ${Address}
    Input Text    name=address2    ${Address2}
    Select From List By Value    id=country    ${Country}

    Input Text    name=state    ${State}
    Input Text    name=city    ${City}    
    Input Text    name=zipcode    ${Zipcode}
    Input Text    name=mobile_number    ${Number}

Submit Create
    Click Element    xpath=//*[@id="form"]/div/div/div/div[1]/form/button

Click continue
    Click Element    xpath=//*[@id="form"]/div/div/div/div/a

Click Delete
    Click Element     xpath=//*[@id="header"]/div/div/div/div[2]/div/ul/li[5]/a
*** Test Cases ***
Test01
    Page Should Contain    Automation Exercise
    Click Register Button
    Page Should Contain    New User Signup!
    Input Username    ${USERNAME}
    Input Email    ${EMAIL}
    Submit Registration
    Page Should Contain    Enter Account Information
    Select Gender
    Input Password    ${PASSWORD}
    SelectDate    ${DAY}    ${MOUNT}    ${YEAR}
    Select Checkbox    id=newsletter
    Select Checkbox    id=optin
    Input Address Information    ${Firstname}    ${Lastname}    ${Company}    ${Address}    ${Address2}  ${Country}    ${State}    ${City}    ${Zipcode}    ${Number}
    Submit Create
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Account Created!')]    10s
    Page Should Contain    Account Created!
    Click continue
    Page Should Contain     Logged in as omega1234az
    Click Delete
    Sleep    5s
    Page Should Contain     ACCOUNT DELETED!

    
