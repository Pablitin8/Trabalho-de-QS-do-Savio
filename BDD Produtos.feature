
Feature: Comportamento padrão da aba de produtos - standard_user
  Como um usuário standard_user
  Quero que a aba de produtos funcione corretamente
  Para que eu possa interagir com os produtos e o carrinho como esperado

  Scenario: Não é possível alterar a quantidade de produtos no carrinho
    Given o usuário está na página do carrinho com um produto adicionado
    When ele tenta aumentar a quantidade do produto
    Then a quantidade deveria poder ser alterada
    But não há opção para modificar a quantidade

  Scenario: Acesso permitido ao checkout sem produtos no carrinho
    Given o carrinho está vazio
    When o usuário tenta acessar a página de checkout
    Then o acesso deveria ser bloqueado
    But o site permite continuar para o checkout

  Scenario: Preço final incorreto com mais de 3 produtos no carrinho
    Given o usuário adicionou mais de 3 produtos ao carrinho
    When ele acessa o checkout
    Then o valor total dos produtos deveria ser a soma correta dos preços
    But um valor muito alto e incorreto é exibido


Feature: Acesso bloqueado - locked_out_user
  Como um usuário locked_out_user
  Quero ser informado que minha conta está bloqueada
  Para entender por que não posso fazer login

  Scenario: Tentativa de login com conta bloqueada
    Given o usuário insere o login "locked_out_user" com a senha correta
    When ele tenta acessar a conta
    Then o acesso deveria ser concedido
    But o sistema bloqueia o login


Feature: Problemas visuais e de funcionalidade - problem_user
  Como um usuário problem_user
  Quero que as informações dos produtos sejam consistentes
  Para que eu possa confiar no que estou vendo

  Scenario: Imagens dos produtos não condizem com os itens
    Given o usuário está na página de produtos
    When ele visualiza as imagens dos produtos
    Then cada imagem deveria corresponder ao item correto
    But todas as imagens são iguais e não representam os produtos

  Scenario: Nome do produto difere entre listagem e página de detalhes
    Given o usuário clica em um produto na página inicial
    When ele acessa a página de detalhes
    Then o nome do produto deveria ser o mesmo
    But o nome está diferente da listagem original

  Scenario: Falha ao remover produto do carrinho pela página inicial
    Given um produto foi adicionado ao carrinho
    When o usuário clica em "Remove" na página inicial
    Then o produto deveria ser removido
    But ele permanece no carrinho

  Scenario: Descrição do produto difere entre páginas
    Given o usuário abre a página de detalhes de um produto
    Then a descrição deveria ser a mesma da página inicial
    But as descrições não coincidem

  Scenario: Filtragem de produtos não funciona
    Given o usuário seleciona uma opção de ordenação ou filtragem
    When ele aguarda o carregamento da nova ordem
    Then os produtos deveriam ser reorganizados corretamente
    But a ordem permanece a mesma


Feature: Problemas de desempenho e redirecionamento - performance_glitch_user
  Como um usuário performance_glitch_user
  Quero que o site funcione normalmente
  Para que eu possa navegar sem interrupções

  Scenario: Site trava e redireciona aleatoriamente
    Given o usuário acessa o site com o login "performance_glitch_user"
    When a página inicial carrega
    Then o site deveria funcionar normalmente
    But o site trava e redireciona para páginas aleatórias


Feature: Erro ao adicionar múltiplos produtos - error_user
  Como um usuário error_user
  Quero adicionar vários produtos ao carrinho
  Para finalizar a compra corretamente

  Scenario: Falha ao adicionar mais de um produto ao carrinho
    Given o usuário está na página de produtos
    When ele adiciona dois ou mais produtos ao carrinho
    Then todos os produtos deveriam ser adicionados com sucesso
    But o carrinho não atualiza com os novos itens


Feature: Inconsistências visuais - visual_user
  Como um usuário visual_user
  Quero que o site apresente as informações visuais corretas
  Para que eu possa confiar no que vejo

  Scenario: Produto aparece no carrinho sem ter sido adicionado
    Given o usuário acessa a conta "visual_user"
    When ele abre a página de produtos
    Then o carrinho deveria estar vazio
    But há um item no carrinho sem ter sido adicionado

  Scenario: Imagens e preços diferentes entre listagem e página do produto
    Given o usuário acessa a página de detalhes de um produto
    Then a imagem e o preço deveriam ser os mesmos da listagem
    But eles estão diferentes
