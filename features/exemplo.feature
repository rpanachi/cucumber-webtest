#language: pt

Funcionalidade: Serviços do Google
  Para facilitar minha vida
  Eu quero utilizar os serviços do Google

  Contexto:
    Dado que estou em "http://google.com.br"     

  Cenario: pesquisando
    E preencho o campo "q" com "1up4developers"
    E aperto o botao "Pesquisa Google"
    Entao deveria ver "1up4developers"

  Cenario: traduzindo
    E clico no link "Ferramentas de idiomas"
    E preencho o campo "text" com "A melhor maneira de fazer as coisas é a maneira certa"
    E seleciono "português" de "tl"
    E seleciono "inglês" de "sl"
    E aperto o botao "Traduzir"
    Entao deveria ver "The best way of doing things is the right way"
