*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
open page
    [Arguments]  ${url}     ${browser}
    open browser  ${url}     ${browser}
    maximize browser window
    set selenium implicit wait  5 seconds

wait and input text
    [Arguments]  ${locator}     ${inputValue}
    wait until element is visible  ${locator}
    input text  ${locator}     ${inputValue}

wait and click element
    [Arguments]  ${locator}
    wait until element is visible  ${locator}
    wait until element is enabled  ${locator}
    click element  ${locator}

verify text is displayed
    [Arguments]  ${locator}     ${text}
    wait until element is visible  ${locator}
    page should contain     ${text}

verify text is not displayed
    [Arguments]  ${locator}
    wait until element is not visible  ${locator}
    page should not contain element  ${locator}