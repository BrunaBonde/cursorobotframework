*** Settings ***
Documentation    
Library    XML

*** Variables ***
${CLIENTE}     www.oboticario.com.br

&{PESSOA}    
...            nome=Bruna    
...            sobrenome=Bonde    
...            idade=19    
...            cpf=12345678911    
...            rg=1234567891

@{FRUTAS}
...            manga
...            melancia
...            abacaxi
...            morango
...            limão

*** Test Cases ***

Cenario 1: Imprimir dicionario no console
    Log To Console    ${PESSOA.nome}    
    Log To Console    ${PESSOA.sobrenome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.cpf}
    Log To Console    ${PESSOA.rg}

Cenario 2: Imprimir lista de frutas no console
    [Tags]        LISTA
    Log To Console    ${FRUTAS[0]}  
    Log To Console    ${FRUTAS[1]}  
    Log To Console    ${FRUTAS[2]}  
    Log To Console    ${FRUTAS[3]}  
    Log To Console    ${FRUTAS[4]}    

Cenario 3: Soma usando argumentos
    [Tags]        SOMA
    Somar dois numeros    2937    2973
	Somar os numeros "1" e "2"

Cenario 4: Desafio de criação de email
    [Tags]        EMAIL
    Criar email    bruna    bonde    19

Cenario 5: Contar de 0 a 9
    [Tags]    CONTA
	#Contar de 0 a 9
	Percorrer lista de frutas

Cenario 6: Imprimindo somente o numero 5 e 8
    [Tags]    if
    Imprimindo somente o 5 e o 8

*** Keywords ***

Somar dois numeros
    [Arguments]        ${NUM_A}    ${NUM_B}
    ${SOMA}            Evaluate    ${NUM_A}+${NUM_B}
    Log To Console     ${SOMA}
    [Return]           ${SOMA}

Somar os numeros "${NUM_A}" e "${NUM_B}"
    ${SOMA}            Evaluate    ${NUM_A}+${NUM_B}
    Log To Console     ${SOMA}
    [Return]           ${SOMA}

Criar email 
    [Arguments]    ${NOME}    ${SOBRENOME}    ${IDADE}
	${EMAIL}       Catenate    SEPARATOR=_    ${NOME}    ${SOBRENOME}    ${IDADE}@robot.com
	Log To Console     ${EMAIL}
	[Return]       ${EMAIL}

Contar de 0 a 9
    FOR    ${COUNT}    IN RANGE    0    9
		Log To Console    ${COUNT}
	END

Percorrer lista de frutas
    @{FRUTAS}    Create List    Banana    Abacaxi    Uva    Morango
	FOR    ${fruta}    IN    @{FRUTAS}
		Log To Console    ${fruta}
	END

Tomar decisões
    IF    '${NOME}'=='Maria'
        Log To Console    Vou fazer isso aqui só quando for a Maria!
	ELSE IF    '${NOME}'=='João'
		Log To Console    Vou fazer isso aqui só quando for o João!
	ELSE 
	    Log To Console    Vou fazer isso aqui só quando for qualquer outra pessoa!
	END

Imprimindo somente o 5 e o 8
    FOR    ${COUNT}    IN RANGE    0    11
		IF    '${COUNT}'=='5'
		    Log To Console    \nEstou no número: ${COUNT}
		ELSE IF    '${COUNT}'=='8'
		    Log To Console    Estou no número: ${COUNT}
		END
	END