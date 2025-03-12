*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_BASE}          http://localhost:8380/mge/
${NAVEGADOR}         Chrome
${USER}              SUP
${PASSWORD1}         123456

*** Test Cases ***
Realizar Login no Sankhya com usuario valido
    Dado que acesso a pagina do login no sankhya
    Quando informo o usuario no login
    E informo a senha no login
    Então valido que estou na tela inicial

*** Keywords ***
Dado que acesso a pagina do login no sankhya
    Open Browser    ${URL_BASE}    ${NAVEGADOR}
    Maximize Browser Window

Quando informo o usuario no login
    Wait Until Keyword Succeeds    5x    2s    Execute JavaScript    return document.querySelector("sankhya-login").shadowRoot.querySelector("input#user")
    ${USER_INPUT} =    Execute JavaScript    return document.querySelector("sankhya-login").shadowRoot.querySelector("input#user")
    Run Keyword If    '${USER_INPUT}' == 'null'    Fail    "Elemento de usuário não encontrado!"
    Input Text    ${USER_INPUT}    ${USER}

E informo a senha no login
    Wait Until Keyword Succeeds    5x    2s    Execute JavaScript    return document.querySelector("sankhya-login").shadowRoot.querySelector("input#password")
    ${PASSWORD_INPUT} =    Execute JavaScript    return document.querySelector("sankhya-login").shadowRoot.querySelector("input#password")
    Run Keyword If    '${PASSWORD_INPUT}' == 'null'    Fail    "Elemento de senha não encontrado!"
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD1}

Então valido que estou na tela inicial
    ${HOME_PAGE} =    Execute JavaScript    return document.querySelector("h1")
    Run Keyword If    '${HOME_PAGE}' == 'null'    Fail    "Elemento da página inicial não encontrado!"
    Page Should Contain Element    ${HOME_PAGE}
    Close Browser



