*** Settings ***
Library      SeleniumLibrary

*** Variables ***
${url}    http://www.amazon.com.br
${MENU_ELETRONICOS}     //a[contains(text(),'Eletrônicos')]
${HEADER_ELETRONICO}    (//span[contains(text(),'Eletrônicos e Tecnologia')])[1]

*** Keywords ***

Abrir o navegador
    Open Browser    ${url}    browser=chrome
    Maximize Browser Window 

Fechar o navegador
    Capture Page Screenshot    screenshot.png
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    ${url}  
    Sleep    5s
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}    timeout=10s

Entrar no menu "Eletrônicos"
    Sleep    2s
    Click Element    ${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    ${FRASE}    timeout=10s
    Wait Until Element Is Visible    ${HEADER_ELETRONICO}    timeout=10s

Verificar se o título da página fica "${TITULO}"
    Title Should Be    Eletrônicos e Tecnologia | Amazon.com.br

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//span[@dir='auto'][normalize-space()='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa 
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button
    
Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Page Contains    ${PRODUTO}    timeout=10s


    