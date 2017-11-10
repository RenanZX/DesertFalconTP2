# DesertFalconTP2
O programa consiste em criar um jogo de tiro 8-bit inspirado no título de mesmo nome(Desert Falcon) do antigo console Atari 2600/7800

# Instruções de Compilação e Execução do programa
1. Certifique-se que o ruby esteja instalado na sua máquina ultilizando o comando <b>'ruby -v'</b> caso haja alguma mensagem de erro vá até esta pagina web https://www.ruby-lang.org/pt/documentation/installation/ e instale-o seguindo os procedimentos necessários para instalação

2. Certifique-se de que a gema do rake esteja instalada ultilizando o comando <b>'gem list -i "rake"'</b>,caso contrário instale usando o comando <b>'gem install rake'</b>

3. siga para a pasta onde está localizado os arquivos do jogo ultilizando o terminal

4. digite o comando <b>rake</b> e aguarde até que a instalação esteja completa, ao acabar o jogo será executado automaticamente

## Instruções de Execução dos testes
1.Siga para a pasta onde está localizado os arquivos do jogo utilizando o terminal

2.Digite o comando 'rspec spec/bibliotecas/NOME_ARQUIVO', substituindo o NOME_ARQUIVO pelo nome do arquivo
que se deseja rodar o rspec
Ex: 'rspec spec/bibliotecas/Falcon_spec.rb'

3.Opcional: pode ser adicionada a flag '--format documentation' para gerar um relatório mais detalhado
Ex: 'rspec spec/bibliotecas/Falcon_spec.rb  --format documentation'
