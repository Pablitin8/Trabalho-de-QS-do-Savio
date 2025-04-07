Feature: Comportamento de alteração de quantidade no carrinho

  Como usuário do sistema
  Quero poder alterar a quantidade de itens no carrinho
  Para que o preço total seja atualizado corretamente

  Scenario: Usuário (error_user) altera a quantidade de itens no carrinho
    Given que o usuário "error_user" adicionou um ou mais itens ao carrinho
    When ele tenta alterar a quantidade de um item
    Then a quantidade deve ser alterada corretamente
    And o preço total do carrinho deve ser recalculado conforme a nova quantidade

  Scenario: Usuário (standard_user) altera a quantidade de itens no carrinho
    Given que o usuário "standard_user" adicionou um ou mais itens ao carrinho
    When ele tenta alterar a quantidade de um item
    Then a quantidade deve ser alterada corretamente
    And o preço total do carrinho deve ser recalculado conforme a nova quantidade

  Scenario: Usuário (problem_user) altera a quantidade de itens no carrinho
    Given que o usuário "problem_user" adicionou um ou mais itens ao carrinho
    When ele tenta alterar a quantidade de um item
    Then a quantidade deve ser alterada corretamente
    And o preço total do carrinho deve ser recalculado conforme a nova quantidade

  Scenario: Usuário (performance_glitch_user) altera a quantidade de itens no carrinho
    Given que o usuário "performance_glitch_user" adicionou um ou mais itens ao carrinho
    When ele tenta alterar a quantidade de um item
    Then a quantidade deve ser alterada corretamente
    And o preço total do carrinho deve ser recalculado conforme a nova quantidade


Feature: Comportamento do botão "Continue Shopping"

  Scenario: Usuário (performance_glitch_user) volta para a aba de produtos
    Given que o usuário "performance_glitch_user" está visualizando o carrinho
    When ele clica em "Continue Shopping"
    Then ele deve ser redirecionado de volta à aba de produtos, mesmo com um leve atraso


Feature: Localização de elementos na interface - visual_user

  Scenario: Carrinho fora da posição esperada
    Given que o usuário "visual_user" está na aba de produtos
    When ele procura o ícone do carrinho
    Then o carrinho está posicionado incorretamente na interface
    And a harmonia visual da página está comprometida

  Scenario: Checkout fora da posição esperada
    Given que o usuário "visual_user" está na aba do carrinho
    When ele procura o botão de checkout
    Then o botão está posicionado incorretamente na interface
    And a harmonia visual da página está comprometida
