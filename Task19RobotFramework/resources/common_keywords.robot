#Settings imports the Selenium library
*** Settings ***
Library    SeleniumLibrary

#Variables: used to define the static test data
*** Variables ***
${BROWSER}    Chrome
${URL}    https://robotsparebinindustries.com/

#Keywords define the test steps for each keyword used in the test file.
#Here the test steps utilizes the predefined Selenium Library functions
*** Keywords ***
#Open Webpage keyword is to launch https://robotsparebinindustries.com/ in Chrome window
Open Webpage
    #Values of URL and BROWSER are fetched from the Variables
    Open Browser    ${URL}    ${BROWSER}
    #Maximizes the browser window
    Maximize Browser Window

#Fills in the username, password and click on SLogin button
Enter Login Details
    #Arguments defines the parameters used within this keyword
    #and the parameter values are fetched from the test steps
    [Arguments]    ${username}    ${password}
    Input Text    id=username    ${username}    clear=True
    Input Password    name=password    ${password}    clear=True
    Click Button    //button[@type='submit']
    Capture Page Screenshot    loginscreen_${username}.png

#Verifies login success or not
Verify Login
    [Arguments]    ${Submit}
    Wait Until Element Is Visible    //input[@id='firstname']    10    Login failed
    Element Should Be Visible    //input[@id='firstname']
    Capture Page Screenshot    login_success.png

#Performs Logout and validate the logout is success
Logout From The Webpage
    Click Button    //button[@id='logout']
    Wait Until Element Is Visible    //input[@id='username']    10    Logout failed
    Element Should Be Visible    //input[@id='username']    logout success
    Capture Page Screenshot    logout_success.png

#Validates error message is shown for invalid login credentials
Validate login Error
    [Arguments]    ${error_msg}
    Wait Until Element Is Visible    //div[@class = 'alert alert-warning']    10
    Element Text Should Be       //div[@class = 'alert alert-warning']    ${error_msg}    Login error not shown for invalid credentials
    Capture Page Screenshot    invalid_login_error.png


