*** Settings ***
Resource       ../Resources/login_resources.robot

*** Test Cases ***

Caso de Teste 01 - Cadastrar adm, buscar, apagar adm e realizar logout
    [Documentation]  O teste tem objetivo de realizar login
    [Tags]            Validar_login
          
    Dado que acesso o site
    Quando realizo o login
    E cadastro um novo user admin
    E valido que foi cadastrado com sucesso
    E busco o admin cadastrado
    Entao excluo o user e realizo logout
