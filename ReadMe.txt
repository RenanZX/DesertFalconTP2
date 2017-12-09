Universidade de Brasilia 
Instituto de Ciencias Exatas
Departamento de Ciencia da Computacao
Técnicas de Programação 2 – 2/2017
Alunos: Felipe Silva de Sousa Franco
	Renan Godoi de Medeiros
	João Gabriel Lima Neves
	Matheus Rodrigues Guimarães

Matricula:
	15/0125071
	15/0146612
	15/0131992
	15/0141661

Turma: A
Versão Ruby: ruby 2.3.3p222 (2016-11-21 revision 56859) [i386-mingw32]

#### Instruções de Compilação e Execução do programa

1.Certifique-se que o ruby esteja instalado na sua máquina ultilizando o comando 'ruby -v' 
caso haja alguma mensagem de erro vá até esta pagina web https://www.ruby-lang.org/pt/documentation/installation/ 
e instale-o seguindo os procedimentos necessários para instalação

2.Certifique-se de que a gema do rake esteja instalada ultilizando o comando 'gem list -i "rake"',
caso contrário instale usando o comando 'gem install rake'

3.siga para a pasta onde está localizado os arquivos do jogo ultilizando o terminal

4.digite o comando rake e aguarde até que a instalação esteja completa, 
ao acabar o jogo será executado automaticamente

## Instruções de Execução dos testes
> Caso tenha seguido os passos de compilação e execução do game, não é necessario fazer o passo 1 

1. Certifique-se de que as gemas rspec e rake estejam instaladas utilizando o comando <b>'gem list -i "rspec"'</b> e <b>'gem list -i "rake"'</b>, caso contrário instale-os usando o comando <b>'gem install rspec'</b> e 'gem install rake'

2. Siga para a pasta onde está localizado os arquivos do jogo utilizando o terminal

3. Digite o comando 'rake spec <b>NOME_ARQUIVO</b>', substituindo o <b>NOME_ARQUIVO</b> pelo nome do arquivo
que se deseja rodar o rspec
Ex: 'rake spec Falcon_spec.rb'(Caso queira rodar todos os testes do rspec apenas ultilize o comando 'rake spec',e caso deseje consultar os arquivos de testes use o comando 'rake verifyspec')

4. Opcional: pode-se usar o comando '<b>rake spec_documentation</b>' para gerar um relatório mais detalhado
Ex: 'rake spec_documentation Falcon_spec.rb'

> O motivo pelo qual o SimpleCov não cobriu algumas partes do código,foi pelo fato de alguns módulos possuirem interfaces privadas e inacessíveis para teste, além de que alguns desses módulos precisam que o jogo esteja em execução para que seja possível testar, oque é inviável para alguns métodos do Gosu

OBS.:para o critério de teste de cobertura, foi ultilizado o critério por instrução

##Relatório de cotribuição de cada membro(Trabalho 3)
Renan Godoi de Medeiros: Atualizou a suite de testes, que ja havia sido criada nos trabalhos anteriores, e fez a cobetura de testes pela ferramenta simpleCov para ruby, atualizou também o rakefile facilitando a execução dos testes

Matheus Rodrigues Guimarães: Documentou o código e a suite de testes, e ultilizando a ferramenta Yard gerou os documentos html explicando a função de cada módulo e interface

João Gabriel Lima Neves: Gerou os grafos ultilizando a ferramenta Yard

#### Link do projeto github:https://github.com/RenanZX/DesertFalconTP2
