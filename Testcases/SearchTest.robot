*** Settings ***
Library  SeleniumLibrary
Resource  ../PageObjects/GoogleSearchPageKeyword.robot
Library  DataDriver     ../TestData/SearchData.xlsx     sheet_name=Sheet1

Suite Setup    Open Google Search Website  ${url}      ${browser}
Suite Teardown  Close Google Search Website
Test Template      Google Search

*** Variables ***
${url}      https://www.google.com/
${browser}      firefox


*** Test Cases ***
SearchTest using ${seachValue}      ${seachID}      ${resultText}



*** Keywords ***
Google Search
    [Arguments]  ${seachID}  ${seachValue}      ${resultText}
    Input Value into Search Textbox  ${seachValue}
    Press Enter Keyboard
    sleep  3
    RUN KEYWORD IF  '${seachID}' == '3'     Verify search result is not displayed
    ...     ELSE       Verify search result is displayed    ${resultText}

    


