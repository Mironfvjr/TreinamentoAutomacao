*** Settings ***
Library          SeleniumLibrary
Resource      ../Objects/tela-login.resource
Resource      ../Objects/tela-home.resource
Resource      ../../Data/teste-aula5.resource

*** Keywords ***
Dado que acesso a pagina do login no sankhya

    Open Browser  ${URL_BASE}   ${NAVEGADOR}
    Maximize Browser Window
    
    Wait For Condition      return document.readyState === "complete"    ${TEMPO_ESPERA}
    Wait Until Element Is Visible    dom:${TXT_USER}    ${TEMPO_ESPERA}    Elemento não foi encontrado
    Input Text    dom:${TXT_USER}    ${USER}
    FOR  ${INDEX}  IN RANGE  3
        Input Text    dom:${TXT_USER}    ${USER}
        IF  ${INDEX} > 1
            Input Text    dom:${TXT_USER}    Automacao
        END
        Sleep    1s
    END

Quando informo o usuario no login
    [Arguments]    ${USER_ARG}
    Wait For Condition      return document.readyState === "complete"    ${TEMPO_ESPERA}
    Wait Until Element Is Visible    dom:${TXT_USER}    ${TEMPO_ESPERA}    Elemento não foi encontrado
    
    Input Text    dom:${TXT_USER}    ${USER_ARG}
    FOR  ${INDEX}  IN RANGE  3
        Input Text    dom:${TXT_USER}    ${USER}
        IF  ${INDEX} > 1
            Input Text    dom:${TXT_USER}    Automacao
        END
        Sleep    1s
    END

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
    Wait Until Element Is Visible    ${TXT_PESQUISAR}     
    Sleep    10s
    #Close Browser