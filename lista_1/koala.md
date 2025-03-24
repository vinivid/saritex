### Questão 1

#### Com suas próprias palavras, diferencie Organização de Arquitetura de Computadores.

R: A diferença entre organização e aquitetura de computadores é que a arquitetura específica as características do computador enquanto a organização é a forma na qual essas características são implementadas.

### Questão 2

#### Qual a importância de se estudar Organização e Arquitetura?

R: O estudo da organização e arquitetura de computadores é importante  para compreender a forma na qual os programas são executados através das instruções definidas pela arquitetura e as relações entre unidade de processamento e memória, assim como o funcionamento de registradoras e as unidades que compoem a CPU. Com isso é adquirido também o conhecimento da eficiência da execução de programas.

### Questão 3

#### Quais os principais componentes de um computador? Liste e detalhe a função deles.

R: A unidade de processamento e memória são os pricipais componentes de um computador. A unidade de processamento é responsavel por executar programas armazenados na memória. A memória tem como função guardar dados e o programa a ser executado pela unidade de processamento. Além desses existem os componentes de entrada e saída que são responsaveis pela interação com o computador.

### Questão 4

#### Quais os principais componentes da CPU? Liste e detalhe a função deles.

R: Os principais componentes da CPU são: Unidade de controle, Unidade de lógica e aritimética, registradoras, program counter, memory adress register, memory buffer register e a instruction register.

A unidade de controle é responsavel por abilitar e selecionar os componetes que são ligados e quais operações devem ser feitas. A ULA efetua operações bitwise e operações como adição e subtração. Os registradores armazenam valores intermediarios em computações. O program counter é responsavel por endereçar a memória. O mar guarda qual endereço da memória deve ser acessado. O Mbr guarda o conteudo que foi resgatado da memória. A instruction register guarda a instrução a ser decodificada para ser executada pela cpu.

### Questão 5

#### Defina com suas próprias palavras o conceito de Programa Armazenado proposto por von Neumann.

R: A idéia do programa armazenado é que para a execução de um algorítimo é necessário apenas que o computador seja capaz de executar as instruções especificadas na memória, de forma que para executar um programa diferente é necessário apenas trocar os dados na memória.

### Questão 6 

#### O que caracteriza uma arquitetura de propósito geral?

R: A capacidade de executar uma ampla quantidade de programas, ou seja, que não seja especializada para um unico problema.

### Questão 7

#### Defina com suas palavras qual a função dos sinais de controle

R: O sinais de controle servem para executar um instrução com determinados parametros. Eles selecionam a ULA para a operação que deve ser feita assim como controlam MUX'es para que as registradoras corretas sejam selecionadas, ou abilitar o barramento de dados ou selecionar se a memória é endereçãda pelo MAR e etc. Em suma, os sinais de controle abilitam e selecionam componentes na CPU para que uma instrução seja completa.


### Questão 8

#### Como a Unidade de Controle comanda todos os componentes do computador?

R: A partir da decodificação da instrução armazenada na instruction register a unidade de controle abilita e desabilta sinais no barramento de controle para que a operação com os argumentos dada pela instrução seja executada.

### Questão 9

#### Defina o ciclo de instrução e suas fases.

R: Um ciclo de instrução de 3 clocks é normalmente dado pelos estados de FETCH, DECODE, EXECUTE. No estado de fetch é adquirido uma instrução de memória e é avançada uma posição no program counter. No estado de decode a unidade de controle interpreta a instrução adquirida no estado de fetch para que todos os sinais de controles necessarios para executar a instrução estejam ativados. O estado execute envolve o armazenamento de algum valor em alguma registradora, seja por uma ação da ULA ou uma instrução de load/store.

### Questão 10

#### Dada a organização hipotética estudada na aula, explique a função dos registradores PC, MAR, MBR e IR.

R: Ja feito na questão quatro.

### Questão 11

0 ciclo: 300 -> load ac, 830 

2 ciclo: 302 -> shiftl ac

4 ciclo: 304 -> store ac 830

6 ciclo: 306 -> load ac 832

8 ciclo: 308 -> shiftr ac

10 ciclo: 30a -> store 832

joever

a) O que faz o programa?

R: O número na posição de memória 830 é multiplicado por 2 se tornado 40
e o número na posição de memória 832 é divido por 2 se tornando 400.

b) PC : 308

AC : 832

IR : 1832

RAM[830] = 40

RAM[832] = 800