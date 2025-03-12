*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_BASE}          http://localhost:8380/mge/
${NAVEGADOR}         Chrome
${USER}              SUP
${PASSWORD_CORRETA}  111111
${SENHA_INVALIDA}    653214
${TXT_PESQUISAR}     //*[@id="search-input-element"]
${OPCAO_MOV_FIN}     //div[contains(@class, 'search-result-item') and contains(text(), 'Movimentação Financeira')]
${TITULO_MOV_FIN}    //h1[contains(text(), 'Movimentação Financeira')]

*** Test Cases ***
Realizar Login e acessar Movimentação Financeira
    [Documentation]    Testa login com senha inválida e válida no Sankhya e navega até a tela de Movimentação Financeira
    Dado que acesso a pagina do login no sankhya
    Quando informo o usuario no login
    Validar dados errado
    E informo a senha correta no login
    Então valido que estou na tela inicial
    E acesso a tela de Movimentação Financeira
    Close Browser

*** Keywords ***
Dado que acesso a pagina do login no sankhya
    Open Browser    ${URL_BASE}    ${NAVEGADOR}
    Maximize Browser Window
    Sleep    3s   # Ajuste conforme necessário

Quando informo o usuario no login
    ${USER_INPUT}=    Execute JavaScript    return document.querySelector("sankhya-login").shadowRoot.querySelector("input#user")
    Call Method    ${USER_INPUT}    focus
    Call Method    ${USER_INPUT}    setAttribute    value    ${USER}
    
    ${BTN_PROSSEGUIR}=    Execute JavaScript    return document.querySelector("sankhya-login").shadowRoot.querySelector("Button.account-btn")
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${BTN_PROSSEGUIR}

Informo a senha 
    ${PASSWORD_INPUT}=    Execute JavaScript    return document.querySelector("sankhya-login").shadowRoot.querySelector("input#password")
    Call Method    ${PASSWORD_INPUT}    focus
    Call Method    ${PASSWORD_INPUT}    setAttribute    value    ${PASSWORD_CORRETA}
    
    ${BTN_PROSSEGUIR}=    Execute JavaScript    return document.querySelector("sankhya-login").shadowRoot.querySelector("Button.account-btn")
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${BTN_PROSSEGUIR}

Então valido que estou na tela inicial
    Wait Until Element Is Visible    xpath:${TXT_PESQUISAR}    timeout=30s
    Input Text    xpath:${TXT_PESQUISAR}    Movimentação financeira
    Press Keys    xpath:${TXT_PESQUISAR}    ENTER
    Sleep    2s

E acesso a tela de Movimentação Financeira
    Wait Until Element Is Visible    xpath:${OPCAO_MOV_FIN}    timeout=10s
    Click Element    xpath:${OPCAO_MOV_FIN}
    Wait Until Element Is Visible    xpath:${TITULO_MOV_FIN}    timeout=15s
    Element Should Be Visible    xpath:${TITULO_MOV_FIN}
