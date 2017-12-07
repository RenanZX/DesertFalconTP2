# DesertFalconTP2
O programa consiste em criar um jogo de tiro 8-bit inspirado no título de mesmo nome(Desert Falcon) do antigo console Atari 2600/7800

# Instruções de Compilação e Execução do programa
1. Certifique-se que o ruby esteja instalado na sua máquina ultilizando o comando <b>'ruby -v'</b> caso haja alguma mensagem de erro vá até esta pagina web https://www.ruby-lang.org/pt/documentation/installation/ e instale-o seguindo os procedimentos necessários para instalação

2. Certifique-se de que a gema do rake esteja instalada ultilizando o comando <b>'gem list -i "rake"'</b>,caso contrário instale usando o comando <b>'gem install rake'</b>

3. Siga para a pasta onde está localizado os arquivos do jogo ultilizando o terminal

4. Digite o comando <b>rake</b> e aguarde até que a instalação esteja completa, ao acabar o jogo será executado automaticamente

## Instruções de Execução dos testes
> Caso tenha seguido os passos de compilação e execução do game, não é necessario fazer o passo 1 

1. Certifique-se de que as gemas rspec e rake estejam instaladas utilizando o comando <b>'gem list -i "rspec"'</b> e <b>'gem list -i "rake"'</b>, caso contrário instale-os usando o comando <b>'gem install rspec'</b> e '<b>gem install rake</b>'

2. Siga para a pasta onde está localizado os arquivos do jogo utilizando o terminal

3. Digite o comando 'rake spec <b>NOME_ARQUIVO</b>', substituindo o <b>NOME_ARQUIVO</b> pelo nome do arquivo
que se deseja rodar o rspec
Ex: 'rake spec Falcon_spec.rb'(Caso queira rodar todos os testes do rspec apenas ultilize o comando '<b>rake spec</b>',e caso deseje consultar os arquivos de testes use o comando '<b>rake verifyspec</b>')

4. Opcional: pode-se usar o comando '<b>rake spec_documentation</b>' para gerar um relatório mais detalhado
Ex: 'rake spec_documentation Falcon_spec.rb'

> O motivo pelo qual o SimpleCov não cobriu todos os testes,foi pelo fato de algumas funções possuirem métodos privados, além de que algumas classes precisam que o jogo estivesse em execução para testar, oque é inviável para alguns metodos do Gosu
