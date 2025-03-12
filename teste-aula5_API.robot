*** Settings ***
Library        RequestsLibrary

*** Variables ***
${BASE_URL}        https://postman-rest-api-learner.glitch.me/
${URI}             /info?id=40293dsasa&nome=sankhya
${URI_POST}        /info

*** Test Cases ***
Validando API do postman GET
    Dado que acesso a api do postman GET

Validando API do postman POST
    Dado que acesso a api do postman POST

*** Keywords ***
Dado que acesso a api do postman GET
    Create Session    jsonplaceholder    ${BASE_URL}
    ${RESPONSE}=      GET On Session    jsonplaceholder    ${URI}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200
    Should Contain    ${RESPONSE.json()["message"]}    You made a GET request!
    Should Be Equal   ${RESPONSE.json()["message"]}    You made a GET request!
    Log To Console    RESPONSE:> ${RESPONSE}

Dado que acesso a api do postman POST
    Create Session    jsonplaceholder    ${BASE_URL}
    ${COLAB}          Create Dictionary    nome=Gustavo    cargo=QA
    ${DATA}=          Create Dictionary    userID=1    nome=sankhya    cod-empresa=10 Colab${COLAB}
    ${RESPONSE}=      POST On Session    jsonplaceholder    ${URI_POST}    json=${DATA}
    Should Contain    ${RESPONSE.jon()["data]["colab"]["nome"]"]}   gustavo
    
    Log To Console    DATA:> ${DATA}
    
    Log To Console    RESPONSE:> ${RESPONSE.json()}


    #Should Be Equal As Numbers    ${RESPONSE.status_code}    200
    #Should Contain    ${RESPONSE.json()["message"]}    You made a POST request with the following data!
    #Should Contain   ${RESPONSE.json()["data"]["nome"]}    sankhya
