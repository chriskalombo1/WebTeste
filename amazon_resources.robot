*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}                 https://www.amazon.com.br
${MENU_VENDA}       //a[contains(.,'Mais Vendidos')]
${LOGIN}            https://www.amazon.com.br/ap/signin?openid.pape.max_auth_age=900&openid.return_to=https%3A%2F%2Fwww.amazon.com.br%2Fgp%2Fyourstore%2Fhome%3Fpath%3D%252Fgp%252Fyourstore%252Fhome%26signIn%3D1%26useRedirectOnSuccess%3D1%26action%3Dsign-out%26ref_%3Dnav_AccountFlyout_signout&openid.assoc_handle=brflex&openid.mode=checkid_setup&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0
${PASSWORD}        //div[contains(@class,'a-box-inner a-padding-extra-large')]
${ELETRONICO}      //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics']
${VISIBLE}         //h1[contains(.,'Eletrônicos e Tecnologia')]
${Header_TITLE_COMP_INFO}  //h1[contains(.,'Computadores e Informática')]
${ADICIONAR_NO_CARRINHO}
${REMOVER_DO_CARRINHO}  //h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
${EXCLUIR}         //div[@class='a-section'][contains(.,'Excluir')]
${HEADER_TITLE_CARRINHO}  //h1[contains(.,'Carrinho de compras')]
${CARRINHO}          //span[contains(@class,'nav-cart-icon nav-sprite')]
${BUTTON_CARRINHO}  //button[contains(@id,'a-autoid-2-announce')]


*** Keywords ***
Abrir o navegador
    Open Browser   browser=chrome   options=add_experimental_option("detach", True)

Fechar o navegador
    Capture Page Screenshot    
    Close Browser

Acessar o home page do site Amazon.com.br
    Go To    url=${URL}
    Title Should Be    title=Amazon.com.br | Tudo pra você, de A a Z.
    Wait Until Element Is Visible    locator=${MENU_VENDA}

Realizar o login na pagina Amazon.com.br
    Go To    url=${LOGIN}
    Wait Until Element Is Visible    locator=${PASSWORD} 
    Input Text      id:ap_email  chriskalo1@gmail.com
    Click Element   id:continue

    Input Password  id:ap_password  sIRIUS01
    Click Element   id:signInSubmit
    Wait Until Page Contains Element    locator=${ELETRONICO}

Entrar no menu "Eletrônicos"
    Click Element    locator=${ELETRONICO}
    Wait Until Page Contains Element   locator=${VISIBLE}
#Verificar se o título da página fica "${TITULO}"
    #Title Should Be    title=${TITULO}
Verificar se aparece a categoria "Computadores e Informática"
   Click Element    locator=//a[@aria-label='Computadores e Informática']
   #Element Should Be Visible    locator=locator=//a[@aria-label=${NOME_CATEGORIA}]
   Wait Until Page Contains Element   locator=${Header_TITLE_COMP_INFO} 

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=//input[contains(@type,'text')]   text=${PRODUTO}

Clicar no botão de pesquisa
    Click Button    locator=//input[contains(@value,'Ir')]
Conferir o resultado da pesquisa, listando o produto pesquisado "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')])[1]

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    locator=${BUTTON_CARRINHO}
    #Wait Until Element Is Visible    locator=

Verificar a presencia do produto "${PRODUTO}" no carrinho
    Click Element   locator=${CARRINHO}
    #Wait Until Element Is Visible    locator=
    Wait Until Page Contains Element   locator=${HEADER_TITLE_CARRINHO}

Remover o produto "Console Xbox Series S" no carrinho
    Wait Until Page Contains Element   locator=${HEADER_TITLE_CARRINHO}
    Click Button    locator=${EXCLUIR}

Verificar se o carrinho esta vazio
    Wait Until Page Contains Element locator=${REMOVER_DO_CARRINHO}
    #Wait Until Element Is Visible    locator


#GHERKIN STEP

 Dado que estou na home page da Amazon.com.br
    Acessar o home page do site Amazon.com.br
    
Quando acessar o menu "Eletrônicos"
  Realizar o login na pagina Amazon.com.br
  Entrar no menu "Eletrônicos"

Então a categoria "Computadores e Informática" deve ser exibida na página
  Verificar se aparece a categoria "Computadores e Informática"

Quando adicionar o produto "${PRODUTO}" no carrinho
  Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
  Clicar no botão de pesquisa
  Conferir o resultado da pesquisa, listando o produto pesquisado "${PRODUTO}"
  Adicionar o produto "${PRODUTO}" no carrinho
Então o produto "${PRODUTO}" deve ser mostrado no carrinho
  Verificar a presencia do produto "${PRODUTO}" no carrinho


Dado que existe o produto "${PRODUTO}" no carrinho
  Verificar a presencia do produto "${PRODUTO}" no carrinho
 
Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" no carrinho
Então o carrinho deve ficar vazio
  Wait Until Page Contains Element locator=${REMOVER_DO_CARRINHO}

  
