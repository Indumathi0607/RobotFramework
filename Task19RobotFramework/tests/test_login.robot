#Settings imports the common_keywords.robot to utilize keyword definitions
*** Settings ***
Resource    ../resources/common_keywords.robot

#Test cases contains all the testcases
*** Test cases ***
Login successful
    #Below keywords are called from common_keywords.robot file
    Open Webpage
    Enter Login Details    maria    thoushallnotpass
    Verify Login    Submit
    Logout From The Webpage
    [Teardown]    Close Browser

#Reuses the Open Webpage, Enter Login Details keywords from 1st testcase
Login fails for invalid credentials
    Open Webpage
    Enter Login Details    maria    testpassword
    Validate login Error    Invalid username or password.
    [Teardown]    Close Browser