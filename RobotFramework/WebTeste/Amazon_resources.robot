*** Settings ***
Library      SeleniumLibrary

*** Variables ***
${BROWSER}                firefox
${URL}                   http://www.amazon.com.br
${MENU_ELETRONICOS}      (//a[contains(text(),'Eletrônicos')])[1]
${HEADER_ELETRONICO}     (//span[contains(text(),'Eletrônicos e Tecnologia')])[1]
${CAMPO_PESQUISA}        //input[@id='twotabsearchtextbox']
${BOTAO_PESQUISA}        //input[@id='nav-search-submit-button']
${TITULO_ELETRONICOS}    Eletrônicos e Tecnologia | Amazon.com.br
${PRODUTO_XBOX}          Console Xbox Series S
${BOTAO_ADICIONAR_CARRINHO}    //input[@id='add-to-cart-button']
${MENSAGEM_ADICIONADO}   //h1[contains(text(), 'Adicionado ao carrinho')]
${BOTAO_CARRINHO}        //a[@href='/cart?ref_=sw_gtc']
${BOTAO_REMOVER}         //span[@class='a-icon a-icon-small-trash']
${MENSAGEM_REMOVIDO}     (//span[@class='a-size-base sc-list-item-removed-msg-text-delete'])[1]

*** Keywords ***

Abrir o navegador
    Open Browser    ${URL}    browser=${BROWSER} 
    Maximize Browser Window 

Fechar o navegador
    Capture Page Screenshot    screenshot.png
    Close Browser

Acessar a home page
    Go To    ${URL}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}    timeout=10s

Entrar no menu Eletrônicos
    Click Element    ${MENU_ELETRONICOS}

Verificar título da página
    Title Should Be    ${TITULO_ELETRONICOS}

Pesquisar produto
    [Arguments]    ${PRODUTO}
    Input Text    ${CAMPO_PESQUISA}    ${PRODUTO}
    Click Element    ${BOTAO_PESQUISA}
    Wait Until Page Contains    ${PRODUTO}    timeout=10s

Adicionar produto ao carrinho
    Click Element    locator=(//img[@alt='${PRODUTO_XBOX}'])[1]
    Wait Until Element Is Visible    ${BOTAO_ADICIONAR_CARRINHO}    timeout=10s
    Click Element    ${BOTAO_ADICIONAR_CARRINHO}
    Wait Until Element Is Visible    ${MENSAGEM_ADICIONADO}    timeout=10s

Remover produto do carrinho
    Click Element    ${BOTAO_CARRINHO}
    Click Element    ${BOTAO_REMOVER}
    Wait Until Element Is Visible    ${MENSAGEM_REMOVIDO}    timeout=10s

   # GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    
Quando acessar o menu "Eletrônicos"    
    Entrar no menu "Eletrônicos"
    
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

E um produto da linha "Xbox Series S" deve ser mostrado na página   
    verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"