#language: pt

Funcionalidade: Google Translate

  Cenario: translate a term
    Dado que estou em "http://translate.google.com.br/#en|pt"
    E preencho o campo "text" com "testing this feature"
    E aperto o botao "Traduzir"
    Entao eu deveria ver "testando esse recurso"
