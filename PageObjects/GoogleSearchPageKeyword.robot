*** Settings ***
Library  SeleniumLibrary
Variables  ../PageUIs/GoogleSearchPageUI.py
Resource  ../Resource/CommonKeyword.robot


*** Keywords ***
Open Google Search Website
    [Arguments]     ${url}     ${browser}
    open page  ${url}     ${browser}


Input Value into Search Textbox
    [Arguments]  ${inputValue}
    wait and input text  ${search_textbox}      ${inputValue}

Click Search Button
    wait and click element  ${search_button}

Close Google Search Website
    close all browsers

Press Enter Keyboard
    Press Key   ${search_textbox}            \ue007

Verify search result is displayed
    [Arguments]     ${resultText}
    verify text is displayed   ${search_result_text}     ${resultText}

Verify search result is not displayed
    page should not contain element  ${search_result_text}