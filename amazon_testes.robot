*** Settings ***
Documentation    A suite testa o site de Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***

#Caso de Teste 00 - Validar o login
   # [Documentation]    Validar o login na pagina web
   # [Tags]             Login
   # Acessar o home page do site Amazon.com.br
   # Realizar o login na pagina Amazon.com.br
    #Open Browser     https://www.amazon.com.br/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com.br%2Fref%3Dnav_ya_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=brflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0  chrome
    #Wait Until Element Is Visible    locator=${PASSWORD} 
     #Input Text      id:ap_email  chriskalo1@gmail.com
     #Click Element   id:continue
     #Input Password  id:ap_password  sIRIUS01
     #Click Element   id:signInSubmit
    
    

Caso de Teste 01 - Acesso ao menu "MENU_ELETRONICO"
    [Documentation]    Esse teste verifica o menu do site Amazon.com.br, validando a categoria Computaodres e informatica
    [Tags]             Menus    categorias
    Acessar o home page do site Amazon.com.br
    Realizar o login na pagina Amazon.com.br
    Entrar no menu "Eletrônicos"
    # Verificar se aparece a frase "Eletrônicos e Tecnologia"
    #Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    
Caso de Teste 02 - Pesquisa de um Produto
   [Documentation]    Esse teste valida a busca dos produtos
   [Tags]             Busca_produtos    Listar_busca
   Acessar o home page do site Amazon.com.br
   Realizar o login na pagina Amazon.com.br
   Digitar o nome de produto "Xbox Series S" no campo de pesquisa
   Clicar no botão de pesquisa
   Conferir o resultado da pesquisa, listando o produto pesquisado "Xbox Series S"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Este teste valida a adição de um produto no carrinho de Computadores
    [Tags]             adicionar_carrinho
    Acessar o home page do site Amazon.com.br
    Realizar o login na pagina Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Conferir o resultado da pesquisa, listando o produto pesquisado "Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar a presencia do produto "Console Xbox Series S" no carrinho

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Este teste valida a adição de um produto no carrinho de Computadores
    [Tags]             remover_carrinho
    #Verifica a presencia do produto "Console Xbox Series S" no carrinho
    Remover o produto "Console Xbox Series S" no carrinho
    Verificar se o carrinho esta vazio