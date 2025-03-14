*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         Amazon_resources.robot
Suite Setup      Abrir o navegador
Suite Teardown   Fechar o navegador

*** Test Cases ***

Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletrônico do site da Amazon.com.br e verifica a categoria Computadores e Informática
    [Tags]             menus    categorias
    Acessar a home page
    Entrar no menu Eletrônicos
    Verificar título da página

Caso de teste 02 - Pesquisa de produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos    lista_busca
    Acessar a home page
    Pesquisar produto    Xbox Series S

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page
    Pesquisar produto    Xbox Series S
    Adicionar produto ao carrinho

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page
    Pesquisar produto    Xbox Series S
    Adicionar produto ao carrinho
    Remover produto do carrinho