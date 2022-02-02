*** Settings ***
Documentation    Aqui estarão presentes todas as keywords responsáveis pelos testes WEB

Resource         ../../config/package.robot


*** Keywords ***
Dado que o cliente esteja na tela de cadastro
    Title Should Be    Automação com Batista 
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Novo Usuário!!')]
E preencheu todos os campos
    #[Arguments]        ${NOME}    ${SOBRENOME}    ${EMAIL}    ${ENDERECO}    ${UNIVERSIDADE}    ${PROFISSAO}    ${GENERO}    ${IDADE}
    Input Text    id=user_name          ${NOVO_USUARIO.nome}
    Input Text    id=user_lastname      ${NOVO_USUARIO.ult_nome}
    Input Text    id=user_email         ${NOVO_USUARIO.email}
    Input Text    id=user_address       ${NOVO_USUARIO.endereço}
    Input Text    id=user_university    ${NOVO_USUARIO.universidade}
    Input Text    id=user_profile       ${NOVO_USUARIO.profissao}
    Input Text    id=user_gender        ${NOVO_USUARIO.genero}
    Input Text    id=user_age           ${NOVO_USUARIO.idade}

Quando clicar em Criar
    Click Element    xpath=//input[@value='Criar']
Então deve ser apresentada a mensagem "${MENSAGEM}"
    Wait Until Element Is Visible    xpath=//*[contains(text(), '${MENSAGEM}')]

    Wait Until Page Contains    ${NOVO_USUARIO.nome}
    Wait Until Page Contains    ${NOVO_USUARIO.ult_nome}
    Wait Until Page Contains    ${NOVO_USUARIO.email}
    Wait Until Page Contains    ${NOVO_USUARIO.endereço}
    Wait Until Page Contains    ${NOVO_USUARIO.universidade}
    Wait Until Page Contains    ${NOVO_USUARIO.profissao}
    Wait Until Page Contains    ${NOVO_USUARIO.genero}
    Wait Until Page Contains    ${NOVO_USUARIO.idade}
    Sleep    2

E preencheu todos os campos exceto o campo nome  
    Input Text    id=user_lastname      ${NOVO_USUARIO.ult_nome}
    Input Text    id=user_email         ${NOVO_USUARIO.email}
    Input Text    id=user_address       ${NOVO_USUARIO.endereço}
    Input Text    id=user_university    ${NOVO_USUARIO.universidade}
    Input Text    id=user_profile       ${NOVO_USUARIO.profissao}
    Input Text    id=user_gender        ${NOVO_USUARIO.genero}
    Input Text    id=user_age           ${NOVO_USUARIO.idade}
    Capture Page Screenshot

E preencheu todos os campos exceto o campo email  
    Input Text    id=user_name          ${NOVO_USUARIO.nome}
    Input Text    id=user_lastname      ${NOVO_USUARIO.ult_nome}
    Input Text    id=user_address       ${NOVO_USUARIO.endereço}
    Input Text    id=user_university    ${NOVO_USUARIO.universidade}
    Input Text    id=user_profile       ${NOVO_USUARIO.profissao}
    Input Text    id=user_gender        ${NOVO_USUARIO.genero}
    Input Text    id=user_age           ${NOVO_USUARIO.idade}
    Capture Page Screenshot

Então deve ser apresentada a mensagem
    [Arguments]                 ${ERRO}
    Wait Until Page Contains    ${ERRO}
    IF    '${ERRO}'=='Name translation missing: pt-BR.activerecord.errors.models.user.attributes.name.blank'
        Clear Element Text    id=user_email
    END

Dado que eu esteja na tela de lista de usuários
    Title Should Be    Automação com Batista 
    Wait Until Element Is Visible    xpath=//*[contains(text(), "Lista de Usuários!!")]

E clique na opção NOVO USUÁRIO 
    Click Element                     xpath=//*[contains(text(), 'Novo Usuário')]
    Wait Until Element Is Visible     xpath=//*[contains(text(), 'Novo Usuário!!')]

Quando finalizar o cadastro preenchendo todos os campos
    Wait Until Element Is Visible     xpath=//*[contains(text(), 'Novo Usuário!!')]
    E preencheu todos os campos
    Quando clicar em Criar