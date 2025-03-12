*** Settings ***
Library      SeleniumLibrary

*** Variables ***

${url}    http://www.amazon.com.br
${MENU_ELETRONICOS}     //a[contains(text(),'Eletrônicos')]
${HERDER_ELETRONICO}    (//span[contains(text(),'Eletrônicos e Tecnologia')])[1]
${TEXTO_HERDER}         Eletrônicos e Tecnologia

*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window 

Fechar o navegador 
    Close Browser


Acessar a home page do site Amazon.com.br
     Go To    url=${url} 
     Sleep    10s
     Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
     Wait Until Page Contains         text=${TEXTO_HERDER}
     Wait Until Element Is Visible    locator=${HERDER_ELETRONICO}