*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_BASE}          http://localhost:8380/mge/
${NAVEGADOR}         Chrome
${txt_USER}          document.querySelector("sankhya-login").shadowRoot.querySelector("input#user")
${txt_PASSWORD}      document.querySelector("sankhya-login").shadowRoot.querySelector("input#password")
${USER}              SUP
${PASSWORD1}         123456
${BTN_PROSSEGUIR}    document.querySelector("sankhya-login").shadowRoot.querySelector("Button.account-btn")
${TXT_PESQUISAR}     //*[@id="search-input-element"]
${SENHA_INVALIDA}    653214
${TXT_ERRO}          document.querySelector("Sankhya-login").shadowRoot.querySelector('div.ant-form-item-control-input-content p')
${TEMPO_ESPERA}         10s
${INDEX}                1
${RANGE}                4

*** Test Cases ***
Realizar Login no Sankhya com usuario valido
  Dado que acesso a pagina do login no sankhya
  Quando informo o usuario no login
  Validar dados errado 
  E informo a senha no login
  Então valido que estou na tela inicial

*** Keywords ***
Dado que acesso a pagina do login no sankhya

    Open Browser  ${URL_BASE}   ${NAVEGADOR}
    Maximize Browser Window
  #  IF  '${USER}' == 'SUP'
  #      Log To Console  ESTE USUARIO EH O SUP
  #  ELSE
  #      Log To Console  ESTE USUARIO NAO EH O SUP        
  # END
    Wait For Condition      return document.readyState === "complete"    ${TEMPO_ESPERA}
    Wait Until Element Is Visible    dom:${TXT_USER}    ${TEMPO_ESPERA}    Elemento não foi encontrado
    Input Text    dom:${TXT_USER}    ${USER}
    FOR  ${INDEX}  IN RANGE  3
        Input Text    dom:${TXT_USER}    ${USER}
        IF  ${INDEX} > 1
            Input Text    dom:${TXT_USER}    SUP
        END
        Sleep    1s
    END

Quando informo o usuario no login
    Wait Until Element Is Visible    dom:${txt_USER}    
    Input Text    dom:${txt_USER}    ${USER}
    Wait Until Element Is Visible    dom:${BTN_PROSSEGUIR}
    Click Element    dom:${BTN_PROSSEGUIR}

Validar dados errado 
    Wait Until Element Is Visible    dom:${txt_PASSWORD}    30S    
    Input Text   dom:${txt_PASSWORD}    ${SENHA_INVALIDA}
    Sleep    3s
    Wait Until Element Is Visible    dom:${BTN_PROSSEGUIR}    30s
    Click Element    dom:${BTN_PROSSEGUIR}       
    Wait Until Element Contains    dom:${TXT_ERRO}    Usuário/Senha inválido.         
    Sleep    3s

E informo a senha no login    
    Wait Until Element Is Visible    dom:${txt_PASSWORD}    30S    
    Input Text   dom:${txt_PASSWORD}    ${PASSWORD1}
    Wait Until Element Is Visible    dom:${BTN_PROSSEGUIR}    30s
    Click Element    dom:${BTN_PROSSEGUIR}         

Então valido que estou na tela inicial
    Wait Until Element Is Visible    xpath:${TXT_PESQUISAR}    timeout=15s
    Input Text    xpath:${TXT_PESQUISAR}    Movimentação financeira
    Press Keys    xpath:${TXT_PESQUISAR}    ENTER
    Sleep    5s  # Ajuste conforme necessário