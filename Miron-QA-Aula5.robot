*** Settings ***
Library        RequestsLibrary


*** Variables ***
${BASE_URL}         https://postman-rest-api-learner.glitch.me/
${URI}              /info?id=40293dsasa&nome=sankhya
${URI_POST}         /info
${DATA}

*** Test Cases ***
Validando API do postmam GET
    Dado que acesso a api do postmam GET


Validando API do postmam POST
    Dado que acesso a api do postmam POST

*** Keywords ***
Dado que acesso a api do postmam GET
    Create Session   jsonplaceholder    ${BASE_URL}
    ${RESPONSE}=    GET On Session    jsonplaceholder    ${URI}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200
    Should Contain    ${RESPONSE.json()["message"]}    You made a GET request!
    Should Be Equal       ${RESPONSE.json()["message"]}  You made a GET req
    Log To Console    RESPONSE:> ${RESPONSE}  

Dado que acesso a api do postmam POST
    Create Session   jsonplaceholder    ${BASE_URL}
    ${DATA}=    Create Dictionary    nome=sankhya    cod-empresa=10
    ${RESPONSE}=    POST    jsonplaceholder    ${URI_POST}     data=${DATA}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200
    Should Contain    ${RESPONSE.json()["message"]}    You made a POST request with the following data!
    Should Be Equal   ${RESPONSE.json()["data"]["nome"]}  sankhya
      