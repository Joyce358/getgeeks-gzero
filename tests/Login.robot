*Settings*
Documentation           Login Test Suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
User login

    ${user}                     Factory User Login
    Add User From Database      ${user}

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    User Should Be Logged In        ${user}

Incorrect Pass
    [Tags]      inv_pass

    ${user}         Create Dictionary       email=papito@hotmail.com        password=abc123

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Modal Content Should Be     Usuário e/ou senha inválidos.

User Not Found
    [Tags]      user_404

    ${user}         Create Dictionary       email=papito@404.net        password=abc123

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Modal Content Should Be     Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]      inv_email

    ${user}         Create Dictionary       email=papito.com.br        password=abc123

    Go To Login Page
    Fill Credentials    ${user}
    Submit Credentials
    Should Be Type Email

# Desafio 1 módulo PRO
Email Obrigatório
    [Tags]          desafio_campos

    ${user}         Create Dictionary       email=${empty}        password=pwd123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be        E-mail obrigatório

Senha Obrigatória
    [Tags]          desafio_campos

    ${user}         Create Dictionary       email=papito@hotmail.com        password=${empty}

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be        Senha obrigatória

Campos Obrigatórios
    [Tags]          desafio_campos

    Go To Login Page
    Submit Credentials
    Alert Span Should Be        E-mail obrigatório
    Alert Span Should Be        Senha obrigatória

