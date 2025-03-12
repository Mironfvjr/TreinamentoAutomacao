*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}              https://www.saucedemo.com/
${BROWSER}          Chrome
${USERNAME}         standard_user
${PASSWORD}         secret_sauce

*** Test Cases ***
Primeiro teste no robot
    [Documentation]    Testa o login e adição de item ao carrinho no SauceDemo
    Dado que acesso o sistema saucedemo
    Quando digito credenciais válidas
    Então faço login com sucesso e adiciono item ao carrinho

*** Keywords ***
Dado que acesso o sistema saucedemo
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    id:user-name    timeout=10s

Quando digito credenciais válidas
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}

Então faço login com sucesso e adiciono item ao carrinho
    Click Element    id:login-button
    Wait Until Element Is Visible    class:inventory_list    timeout=10s    # Verifica se a página de produtos carregou
    Click Element    id:add-to-cart-sauce-labs-bike-light
    Wait Until Element Is Visible    class:shopping_cart_badge    timeout=5s
    Element Text Should Be    class:shopping_cart_badge    1    # Verifica se o contador do carrinho é 1
    Close Browser


