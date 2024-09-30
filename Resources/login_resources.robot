*** Settings ***

Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem
Library    JSONLibrary
Library    String
Library    XML
Library    FakerLibrary    locale=pt_BR

*** Variables ***

${Campo_Login}          //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input
${Campo_Senha}          //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/div[2]/input
${Input_Login}          Admin
${Input_Senha}          admin123
${Btn_Login}            //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
${Btn_Upgrade}          //*[@id="app"]/div[1]/div[1]/header/div[1]/div[2]/a/button
${Btn_Admin}            //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[1]/a
${Btn_Add}              //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[1]/button
${Combo_User_Role}      //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[1]/div/div[2]/div/div/div[2]/i
${Option_Admin}         (//div[contains(.,'Admin')])[18]
${Campo_Name}           //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[2]/div/div[2]/div/div/input
${Option_Nikita}        (//div[contains(.,'Test User 485128')])[1]
${Combo_Status}         //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[3]/div/div[2]/div/div/div[2]/i
${Status_Enable}        (//div[contains(.,'Enabled')])[14]
${Campo_Username}       //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[1]/div/div[4]/div/div[2]/input
${Campo_Password}       //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[2]/div/div[1]/div/div[2]/input
${Campo_Conf_Pass}      //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[2]/div/div[2]/div/div[2]/input
${Btn_Save}             //*[@id="app"]/div[1]/div[2]/div[2]/div/div/form/div[3]/button[2]
${Btn_Search}           //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/button[2]
${Campo_User_Search}    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[1]/div/div[2]/input
${Btn_Trash}            //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[6]/div/button[1]/i
${Btn_Yes_Delete}       //*[@id="app"]/div[3]/div/div/div/div[3]/button[2]
${Btn_Top_User}         //*[@id="app"]/div[1]/div[1]/header/div[1]/div[3]/ul/li/span/p
${Btn_Logout}           //*[@id="app"]/div[1]/div[1]/header/div[1]/div[3]/ul/li/ul/li[4]/a


*** Keywords ***

Dado que acesso o site
    Open Browser    browser=chrome    url=https://opensource-demo.orangehrmlive.com/         
    Maximize Browser Window


Quando realizo o login
  Wait Until Element Is Visible    ${Campo_Login}
  Log To Console    Variável 'Campo_Login': ${Campo_Login}
  Input Text    ${Campo_Login}  ${Input_Login}

  Wait Until Element Is Visible    ${Campo_Senha}
  Log To Console    Variável 'Campo_Login': ${Campo_Senha}
  Input Text    ${Campo_Senha}  ${Input_Senha}
  Click Element    ${Btn_Login}
  Wait Until Element Is Visible    ${Btn_Upgrade}

E cadastro um novo user admin
    Click Element    ${Btn_Admin}
    Wait Until Element Is Visible    ${Btn_Add}
    Click Element    ${Btn_Add}
    Wait Until Element Is Visible    ${Combo_User_Role}
    Click Element    ${Combo_User_Role}
    Wait Until Element Is Visible    ${Option_Admin}
    Click Element    ${Option_Admin}
    Click Element    ${Campo_Name} 
    Input Text    ${Campo_Name}    Test User 485128
    Sleep    2s
    Press Keys   ${Campo_Name}    DOWN
    Press Keys   ${Campo_Name}    ENTER
    Click Element    ${Combo_Status} 
    Wait Until Element Is Visible    ${Status_Enable}
    Click Element    ${Status_Enable}
    Input Text    ${Campo_Username}    DanTestesRD
    Input Text    ${Campo_Password}    Test@123
    Input Text    ${Campo_Conf_Pass}    Test@123
    Click Element    ${Btn_Save}
    
    
E valido que foi cadastrado com sucesso
    Wait Until Element Is Visible    //*[contains(., "Success")]


E busco o admin cadastrado
    Wait Until Element Is Visible    ${Campo_User_Search}
    Input Text    ${Campo_User_Search}    DanTestesRD
    Click Element    ${Btn_Search}
    Wait Until Element Is Visible    //*[contains(., "DanTestesRD")]


Entao excluo o user e realizo logout
    Sleep    3s
    Scroll Element Into View    ${Btn_Trash}
    Click Element    ${Btn_Trash}
    Wait Until Element Is Visible    ${Btn_Yes_Delete} 
    Click Element    ${Btn_Yes_Delete} 
    Wait Until Element Is Visible    //*[contains(., "Success")]
    Wait Until Element Is Visible    ${Btn_Top_User}
    Click Element    ${Btn_Top_User}
    Click Element    ${Btn_Logout}
    


