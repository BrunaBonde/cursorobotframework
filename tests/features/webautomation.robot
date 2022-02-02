*** Settings ***
Documentation    Aqui estarão presentes todos os testes automatizados do módulo de automação web

Resource         ../../src/config/package.robot

Suite Setup       Abrir Navegador
Suite Teardown    Fechar Navegador

*** Variables ***
&{NOVO_USUARIO}
...        nome=Bruna
...        ult_nome=Bonde
...        email=bruna.teste@robot.com
...        endereço=Rua Aprendendo Automação
...        universidade=UTFPR
...        profissao=Analista de teste JR
...        genero=Feminino
...        idade=19


*** Test Cases ***

Cenario: Criar usuário com sucesso 
    [Tags]    abre_navegador
    
    #Fluxo do teste
    Title Should Be    Automação com Batista 
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Novo Usuário!!')]

    Input Text    id=user_name          ${NOVO_USUARIO.nome}
    Input Text    id=user_lastname      ${NOVO_USUARIO.ult_nome}
    Input Text    id=user_email         ${NOVO_USUARIO.email}
    Input Text    id=user_address       ${NOVO_USUARIO.endereço}
    Input Text    id=user_university    ${NOVO_USUARIO.universidade}
    Input Text    id=user_profile       ${NOVO_USUARIO.profissao}
    Input Text    id=user_gender        ${NOVO_USUARIO.genero}
    Input Text    id=user_age           ${NOVO_USUARIO.idade}

    Click Element    xpath=//input[@value='Criar']

    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Usuário Criado com sucesso')]

    Wait Until Page Contains    ${NOVO_USUARIO.nome}
    Wait Until Page Contains    ${NOVO_USUARIO.ult_nome}
    Wait Until Page Contains    ${NOVO_USUARIO.email}
    Wait Until Page Contains    ${NOVO_USUARIO.endereço}
    Wait Until Page Contains    ${NOVO_USUARIO.universidade}
    Wait Until Page Contains    ${NOVO_USUARIO.profissao}
    Wait Until Page Contains    ${NOVO_USUARIO.genero}
    Wait Until Page Contains    ${NOVO_USUARIO.idade}

    Sleep    2
    
Cenario: Criar usuário com sucesso usando BDD
    [Tags]    BDD
    Dado que o cliente esteja na tela de cadastro
    E preencheu todos os campos    
    Quando clicar em Criar
    Então deve ser apresentada a mensagem "Usuário Criado com sucesso"

Cenario: Criar usuário sem informar o nome
    [Tags]    bug
    Dado que o cliente esteja na tela de cadastro
    E preencheu todos os campos exceto o campo nome  
    Quando clicar em Criar
    Então deve ser apresentada a mensagem        Name translation missing: pt-BR.activerecord.errors.models.user.attributes.name.blank
Cenario: Criar usuário sem informar o email
    [Tags]    bug
    Dado que o cliente esteja na tela de cadastro
    E preencheu todos os campos exceto o campo email  
    Quando clicar em Criar
    Então deve ser apresentada a mensagem        Email translation missing: pt-BR.activerecord.errors.models.user.attributes.email.blank

Cenario: Criar usuario atraves de sessão de lista de usuários
    [Tags]        lista
    Dado que eu esteja na tela de lista de usuários
    E clique na opção NOVO USUÁRIO 
    Quando finalizar o cadastro preenchendo todos os campos
    Então deve ser apresentada a mensagem "Usuário Criado com sucesso"

