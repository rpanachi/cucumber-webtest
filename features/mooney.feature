#language: pt

Funcionalidade: Mooney

  Cenario: cadastrar usuario
    E vou para "http://localhost:3005/signup"
    E preencho o campo "user[email]" com "teste@server.com"
    E preencho o campo "user[password]" com "123456"
    E preencho o campo "user[password_confirmation]" com "123456"
    E aperto o botao "Signup"
    Entao deveria ver "User registered!"

  Contexto:
    Dado que estou em "http://localhost:3005/login"
    E preencho o campo "user_session[email]" com "teste@server.com"
    E preencho o campo "user_session[password]" com "123456"
    E aperto o botao "Login"

  Cenario: incluindo um lançamento
    E vou para "http://localhost:3005/"
    E clico no link "DINHEIRO"
    E clico no link "Novo lançamento" e aguardo
    E preencho o campo "entry[date]" com "01/01/2010"
    E preencho o campo "entry[value]" com "-49,95"
    E preencho o campo "entry[tag_list]" com "teste"
    E aperto o botao "ok" e aguardo
    Entao deveria ver "-49,95"

  Cenario: incluindo um lançamento
    E vou para "http://localhost:3005/"
    E clico no link "DINHEIRO"
    E aperto o botao "ok" e aguardo
    Entao deveria ver "-49,95" no "cell" com id
