Feature: Checkout - standard_user
  Como um cliente padrão
  Quero realizar o processo de checkout completo
  Para finalizar minhas compras com sucesso

  Scenario: Realizar checkout completo com sucesso
    Given que eu sou um cliente logado no sistema
    And tenho itens adicionados ao meu carrinho de compras
    When eu acesso a página do carrinho e clico em "Checkout"
    Then eu sou redirecionado para a primeira tela de checkout "Checkout: Your Information"

    Given que eu estou na tela "Checkout: Your Information"
    When eu preencho os campos com dados pessoais
    And clico no botão "Continue"
    Then eu sou redirecionado para a segunda tela de checkout "Checkout: Overview"

    Given que eu estou na tela "Checkout: Overview"
    When eu verifico que os dados de entrega, pagamento e itens estão corretos
    And clico no botão "Finish"
    Then o sistema processa o pedido com sucesso
    And eu recebo uma mensagem de confirmação "Thank you for your order! Your order has been dispatched, and will arrive just as fast as the pony can get there!"

Feature: Checkout - locked_out_user
  Como um cliente com acesso bloqueado
  Quero acessar o sistema
  Para tentar realizar uma compra

  Scenario: Usuário não consegue logar
    Given que o usuário tenta realizar login com o usuário "locked_out_user"
    Then o sistema deve impedir o login e exibir uma mensagem de erro

Feature: Checkout - problem_user
  Como um cliente com comportamento visual inesperado
  Quero preencher corretamente os dados no checkout
  Para completar a compra

  Scenario: Campo "last name" se transforma em "first name"
    Given que eu sou um cliente logado no sistema
    And tenho itens adicionados ao meu carrinho de compras
    When eu acesso a página do carrinho e clico em "Checkout"
    Then eu sou redirecionado para a primeira tela de checkout "Checkout: Your Information"

    Given que eu estou na tela "Checkout: Your Information"
    When eu tento preencher os campos com dados pessoais
    And clico no campo vazio "last name"
    Then o "last name" vira meu "first name" e não é possível completar o checkout

Feature: Checkout - performance_glitch_user
  Como um cliente com lentidão no sistema
  Quero finalizar minha compra mesmo com atrasos
  Para garantir que o sistema funcione sob stress

  Scenario: Realizar checkout completo com lentidão
    Given que eu sou um cliente logado no sistema
    And tenho itens adicionados ao meu carrinho de compras
    When eu acesso a página do carrinho e clico em "Checkout"
    Then eu sou redirecionado para a primeira tela de checkout "Checkout: Your Information"

    Given que eu estou na tela "Checkout: Your Information"
    When eu preencho os campos com dados pessoais
    And clico no botão "Continue"
    Then eu sou redirecionado para a segunda tela de checkout "Checkout: Overview"

    Given que eu estou na tela "Checkout: Overview"
    When eu verifico que os dados de entrega, pagamento e itens estão corretos
    And clico no botão "Finish"
    Then o sistema processa o pedido com sucesso
    And eu recebo uma mensagem de confirmação "Thank you for your order! Your order has been dispatched, and will arrive just as fast as the pony can get there!"

Feature: Checkout - error_user
  Como um cliente que apresenta erro ao preencher dados
  Quero finalizar minha compra
  Para testar o comportamento com informações incompletas

  Scenario: Erro ao preencher o campo "last name"
    Given que eu sou um cliente logado no sistema
    And tenho itens adicionados ao meu carrinho de compras
    When eu acesso a página do carrinho e clico em "Checkout"
    Then eu sou redirecionado para a primeira tela de checkout "Checkout: Your Information"

    Given que eu estou na tela "Checkout: Your Information"
    When eu preencho os campos com dados pessoais sendo impossível preencher o "last name"
    And mesmo com informações faltando clico no botão "Continue"
    Then eu sou redirecionado para a segunda tela de checkout "Checkout: Overview"

    Given que eu estou na tela "Checkout: Overview"
    When eu verifico que os dados de entrega, pagamento e itens estão corretos
    And clico no botão "Finish"
    Then nada acontece, tornando impossível finalizar o checkout

Feature: Checkout - visual_user
  Como um cliente com problemas de interface
  Quero visualizar corretamente o processo de checkout
  Para finalizar minha compra de forma clara

  Scenario: Realizar checkout completo com sucesso
    Given que eu sou um cliente logado no sistema
    And tenho itens adicionados ao meu carrinho de compras
    When eu acesso a página do carrinho e clico em "Checkout"
    Then eu sou redirecionado para a primeira tela de checkout "Checkout: Your Information"

    Given que eu estou na tela "Checkout: Your Information"
    When eu preencho os campos com dados pessoais
    And clico no botão "Continue"
    Then eu sou redirecionado para a segunda tela de checkout "Checkout: Overview"

    Given que eu estou na tela "Checkout: Overview"
    When eu verifico que os dados de entrega, pagamento e itens estão corretos
    And clico no botão "Finish"
    Then o sistema processa o pedido com sucesso
    And eu recebo uma mensagem de confirmação "Thank you for your order! Your order has been dispatched, and will arrive just as fast as the pony can get there!"
