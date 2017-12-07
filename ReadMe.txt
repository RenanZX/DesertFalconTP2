Universidade de Brasilia 
Instituto de Ciencias Exatas
Departamento de Ciencia da Computacao
T�cnicas de Programa��o 2 � 2/2017
Alunos: Felipe Silva de Sousa Franco
	Renan Godoi de Medeiros
	Jo�o Gabriel Lima Neves
	Matheus Rodrigues Guimar�es

Matricula:
	15/0125071
	15/0146612
	15/0131992
	15/0141661

Turma: A
Vers�o Ruby: ruby 2.3.3p222 (2016-11-21 revision 56859) [i386-mingw32]

#### Instru��es de Compila��o e Execu��o do programa

1.Certifique-se que o ruby esteja instalado na sua m�quina ultilizando o comando 'ruby -v' 
caso haja alguma mensagem de erro v� at� esta pagina web https://www.ruby-lang.org/pt/documentation/installation/ 
e instale-o seguindo os procedimentos necess�rios para instala��o

2.Certifique-se de que a gema do rake esteja instalada ultilizando o comando 'gem list -i "rake"',
caso contr�rio instale usando o comando 'gem install rake'

3.siga para a pasta onde est� localizado os arquivos do jogo ultilizando o terminal

4.digite o comando rake e aguarde at� que a instala��o esteja completa, 
ao acabar o jogo ser� executado automaticamente

## Instru��es de Execu��o dos testes
> Caso tenha seguido os passos de compila��o e execu��o do game, n�o � necessario fazer o passo 1 

1. Certifique-se de que as gemas rspec e rake estejam instaladas utilizando o comando <b>'gem list -i "rspec"'</b> e <b>'gem list -i "rake"'</b>, caso contr�rio instale-os usando o comando <b>'gem install rspec'</b> e 'gem install rake'

2. Siga para a pasta onde est� localizado os arquivos do jogo utilizando o terminal

3. Digite o comando 'rake spec <b>NOME_ARQUIVO</b>', substituindo o <b>NOME_ARQUIVO</b> pelo nome do arquivo
que se deseja rodar o rspec
Ex: 'rake spec Falcon_spec.rb'(Caso queira rodar todos os testes do rspec apenas ultilize o comando 'rake spec',e caso deseje consultar os arquivos de testes use o comando 'rake verifyspec')

4. Opcional: pode-se usar o comando '<b>rake spec_documentation</b>' para gerar um relat�rio mais detalhado
Ex: 'rake spec_documentation Falcon_spec.rb'


> O motivo pelo qual o SimpleCov n�o cobriu todos os testes,foi pelo fato de algumas fun��es possuirem m�todos privados, al�m de que algumas classes precisam que o jogo estivesse em execu��o para testar, oque � invi�vel para alguns metodos do Gosu

#### Link do projeto github:https://github.com/RenanZX/DesertFalconTP2