*** Settings ***
Documentation    A suite testa o site de Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
#Test Teardown    Fechar o navegador


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
    [Tags]             menus    categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então a categoria "Computadores e Informática" deve ser exibida na página
    #o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    #E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    #E a categoria "Computadores e Informática" deve ser exibida na página
    
#Caso de Teste 02 - Pesquisa de um Produto
#   [Documentation]    Esse teste valida a busca dos produtos
  # [Tags]             Busca_produtos    Listar_busca
   #Dado que estou na home page da Amazon.com.br
   #Quando pesquisar pelo produto "Xbox Series S"
   #Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
   #E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Testes 03 - Adicionar Produto no Carrinho
    #Dado que estou na home page da amazon.com.br
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho

Caso de Teste 04 - Remover Produto do Carrinho
     #Dado que estou na home page da Amazon.com.br
     Dado que existe o produto "Console Xbox Series S" no carrinho
     #E existe o produto "Console Xbox Series S" no carrinho
     Quando remover o produto "Console Xbox Series S" do carrinho 
     Então o carrinho deve ficar vazio