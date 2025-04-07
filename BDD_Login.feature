Feature: Login de usuários
  Como um usuário do sistema
  Quero fazer login com diferentes tipos de contas
  Para acessar o sistema de acordo com meu perfil

  Background:
    Given que estou na página de login

  # Usuário standard_user
  Scenario: Login bem-sucedido com standard_user
    When eu insiro o usuário "standard_user" e a senha "secret_sauce"
    Then devo ser redirecionado para a página inicial do sistema

  Scenario: Falha no login com standard_user e senha incorreta
    When eu insiro o usuário "standard_user" e a senha "senha_errada"
    Then devo ver uma mensagem de erro informando "Credenciais inválidas"

  # Usuário locked_out_user
  Scenario: Falha no login com locked_out_user
    When eu insiro o usuário "locked_out_user" e a senha "secret_sauce"
    Then devo ver uma mensagem de erro informando "Usuário bloqueado"

  Scenario: Falha no login com locked_out_user e senha incorreta
    When eu insiro o usuário "locked_out_user" e a senha "senha_errada"
    Then devo ver uma mensagem de erro informando "Credenciais inválidas"

  # Usuário problem_user
  Scenario: Login bem-sucedido com problem_user
    When eu insiro o usuário "problem_user" e a senha "secret_sauce"
    Then devo ser redirecionado para a página inicial do sistema

  Scenario: Falha no login com problem_user e senha incorreta
    When eu insiro o usuário "problem_user" e a senha "senha_errada"
    Then devo ver uma mensagem de erro informando "Credenciais inválidas"

  # Usuário performance_glitch_user
  Scenario: Login bem-sucedido com performance_glitch_user
    When eu insiro o usuário "performance_glitch_user" e a senha "secret_sauce"
    Then devo ser redirecionado para a página inicial do sistema após uma leve demora

  Scenario: Falha no login com performance_glitch_user e senha incorreta
    When eu insiro o usuário "performance_glitch_user" e a senha "senha_errada"
    Then devo ver uma mensagem de erro informando "Credenciais inválidas"

  # Usuário error_user
  Scenario: Login bem-sucedido com error_user
    When eu insiro o usuário "error_user" e a senha "secret_sauce"
    Then devo ser redirecionado para a página inicial do sistema, mesmo que alguns erros visuais possam ocorrer

  Scenario: Falha no login com error_user e senha incorreta
    When eu insiro o usuário "error_user" e a senha "senha_errada"
    Then devo ver uma mensagem de erro informando "Credenciais inválidas"

  # Usuário visual_user
  Scenario: Login bem-sucedido com visual_user
    When eu insiro o usuário "visual_user" e a senha "secret_sauce"
    Then devo ser redirecionado para a página inicial do sistema, com elementos visuais carregando normalmente

  Scenario: Falha no login com visual_user e senha incorreta
    When eu insiro o usuário "visual_user" e a senha "senha_errada"
    Then devo ver uma mensagem de erro informando "Credenciais inválidas"

  # Casos adicionais
  Scenario: Tentativa de login com usuário e senha em branco
    When eu não preencho o usuário e a senha
    And clico em "Login"
    Then devo ver uma mensagem de erro informando "É necessário fornecer um nome de usuário e senha"

  Scenario: Tentativa de login com usuário preenchido e senha em branco
    When eu insiro o usuário "standard_user" e deixo a senha em branco
    Then devo ver uma mensagem de erro informando "É necessário fornecer uma senha"

  Scenario: Tentativa de login com senha preenchida e usuário em branco
    When eu deixo o usuário em branco e insiro a senha "secret_sauce"
    Then devo ver uma mensagem de erro informando "É necessário fornecer um nome de usuário"

  Scenario: Tentativa de login com nome de usuário inexistente
    When eu insiro o usuário "usuario_inexistente" e a senha "secret_sauce"
    Then devo ver uma mensagem de erro informando "Credenciais inválidas"
