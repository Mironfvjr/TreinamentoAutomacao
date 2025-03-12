*** Settings ***
Library      SeleniumLibrary

*** Variables ***

${url}    http://www.amazon.com.br
${menu_eletronico}    //a[contains(text(),'Eletrônicos')]  

*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window 

Fechar o navegador 
    Close Browser


Acessar a home page do site Amazon.com.br
     Go To    url=${url} 
     Sleep    25s
     Wait Until Element Is Visible    locator=${menu_eletronico}
