*** Settings ***
Documentation                    This is a invalied login test
Library                          Selenium2Library

*** Variables ***
${Browser}                      firefox
${URL}                          https://tester.codersguru.pl/login
${USER}                         kordecki.k@gmail.com
${PASSWORD}                     codersguru


*** Test Cases ***
Empty Password[N]
    [Documentation]                 Should be "To pole jest wymagane"
    open browser                    ${URL}   ${Browser}
    maximize browser window
    clear element text              id=username
    clear element text              id=password
    input text                      id=username     ${USER}
    click button                    id=_submit
    click button                    id=_submit
    element should contain          xpath=//span      To pole jest wymagane
    close browser

Empty Username[N]
    [Documentation]                 Should be "To pole jest wymagane"
    open browser                    ${URL}   ${Browser}
    maximize browser window
    clear element text              id=username
    clear element text              id=password
    input password                  id=password     ${PASSWORD}
    click button                    id=_submit
    click button                    id=_submit
    element should contain          xpath=//span      To pole jest wymagane
    close browser

Empty Username And Password[N]
    [Documentation]                 Should be "To pole jest wymagane"
    open browser                    ${URL}   ${Browser}
    maximize browser window
    clear element text              id=username
    clear element text              id=password
    click button                    id=_submit
    element should contain          xpath=//span      To pole jest wymagane
    close browser

Invalid Username[N]
    [Documentation]                 Should be "Nieprawidłowe dane"
    open browser                    ${URL}   ${Browser}
    maximize browser window
    clear element text              id=username
    clear element text              id=password
    input text                      id=username     kordecki.k
    input password                  id=password     ${PASSWORD}
    click button                    id=_submit
    click button                    id=_submit
    element should contain          xpath=/html/body/div/div[1]     Nieprawidłowe dane.
    close browser

Invalid Password[N]
    [Documentation]                 Should be "Nieprawidłowe dane"
    open browser                    ${URL}   ${Browser}
    maximize browser window
    clear element text              id=username
    clear element text              id=password
    input text                      id=username     ${USER}
    input password                  id=password     ${USER}
    click button                    id=_submit
    click button                    id=_submit
    element should contain          xpath=/html/body/div/div[1]     Nieprawidłowe dane.
    close browser

Invalid Username And Password[N]
    [Documentation]                 Should be "Nieprawidłowe dane"
    open browser                    ${URL}   ${Browser}
    maximize browser window
    clear element text              id=username
    clear element text              id=password
    input text                      id=username     codersguru
    input password                  id=password     ${USER}
    click button                    id=_submit
    click button                    id=_submit
    element should contain          xpath=/html/body/div/div[1]     Nieprawidłowe dane.
    close browser