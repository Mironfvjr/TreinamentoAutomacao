*** Settings ***
Library          SeleniumLibrary
Resource         ../Page/Keywords/Teste-aula5.resource
Test Setup       Dado que acesso a pagina do login no sankhya
Test Teardown    Close Browser 



*** Test Cases ***
Realizar Login no Sankhya com usuario valido
  [Tags]    login    prioridade
  Quando informo o usuario no login    sup
  Validar dados errado 
  E informo a senha no login
  #Então valido que estou na tela inicial

Realizar Login no Sankhya com usuario valido 2
  [Tags]    login    
  Quando informo o usuario no login    sup
  Validar dados errado 
  E informo a senha no login
  #Então valido que estou na tela inicial




