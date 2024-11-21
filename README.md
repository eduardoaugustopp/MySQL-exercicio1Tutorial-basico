<h1 align="center">Banco de Dados MySQL</h1>

<h3 align="center"> Canal do YouTube: <a href="https://www.youtube.com/watch?v=Ofktsne-utM&list=PLHz_AreHm4dkBs-795Dsgvau_ekxg8g1r&index=1">Gustavo Guanabara
</a> </h3>

> Não usei WAMP

**(...) continua ->Curso MySQL #07 - Manipulando Linhas (UPDATE, DELETE e TRUNCATE)**

> <img alt="" src="./img/configuracao.png" width="100%"></br> > <img alt="" src="./img/banco.png" width="100%"></br>

> <img alt="" src="./img/pessoa.png" width="100%"></br>

- Essas 3 pessoas tem características semelhantes;

> <img alt="" src="./img/pessoa1.png" width="50%"></br>

- Cada um tem seu própio peso, altura (valores são diferentes).. e isso os faz instâncias, os faz pessoas diferentes umas das outras;

- E esse é o **OBJETIVO** do banco de dados registrar instâncias separadas de coisas que tem características semelhantes;

> <img alt="" src="./img/base.png" width="100%"></br>

- Características diferentes, coloca em conteiners diferentes;
- Bancos de dados -> são coleções de dados, que são de caracteristicas separadas mas que estão organizadas em locais específicos;
- Os locais específicos são as tabelas;
- As tabelas guardam dados de coisas que tem características semelhantes;
- Os dados que estão dentro das tabelas também tem um nome específico, que são registros;

- **RESUMINDO** -> bancos de dados são conjuntos de tabelas e tabelas são conjuntos de registros e registros são compostos por campos, os campos no MySQL são chamados de colunas;

> <img alt="" src="./img/criando.png" width="100%"></br>

> <img alt="" src="./img/pessoas.png" width="100%"></br>

- Essas características são chamadas de **'campos'**;

> <img alt="" src="./img/tipos.png" width="100%"></br>

- MySQL - PRECISÃO -> como os dados vão ser armazenados em disco, precisa saber dimensionar muito bem a estrutura da sua tabela;
- A diferença desses tipos é q a quantidade de bytes que ele vai utilizar para armazenar este dado:</br>

- TinyInt -> usa muito menos dados do que o BigInt;
- BigInt -> usa muitos bytes em disco e o TinyInt vai usa pouquinho;
- Isso vai influenciar diretamente no tamanho do número que você vai guardar, Exemplo: idade não precisa utilizar o int, usa o TinyInt que utiliza apenas 3 bytes na memória;
- Char -> fixo - Exemplo: se um nome tem 30 letras, vai armazenar com 30 letras; nome 'Zé', só usou 2 letras, vai ter 2 letras gurdadas e o resto tudo preenchido com espaço, porque no disco disse que vai ter 30 espaços fixos;
- VarChar -> variante - o nome vai ter 30 letras, 'Zé', vai guardar só 2 e vai deixar os outros la disponíveis, não vai colocar espaço, não vai ocupar 30;
- Textos é para textos longos quer a descrição de uma pessoa, quer guardar um texto longo no seu banco de dados, usa o tipo 'Text', quer guardar um nome, um endereçe, um telefone, uma coisa caractere, guarda no tipo Char ou VarChar;
- Tipo 'Blob' - permite guardar qualquer coisa em binário por exemplo, uma imagem, apesar de não ser recomendado guardar uma imagem dentro de um banco de dados é possível utilizando esse tipo;
- Enum e Set são tipos que pode configurar quais são os valores permitidos e na hora do cadastro ele so vai aceitar esses valores;
- Tipo 'Espacial' - permite guardar informações sobre volumétricos;
- **1 Int ocupa 11 bytes e um tinyint ocupa 3 bytes;**

> <img alt="" src="./img/tabela.png" width="100%"></br>

- Para executar um comando precisa selecionar e clica no raio ou clica em cima do comando ctrl + enter;

> <img alt="" src="./img/informacoes.png" width="100%"></br>

> Vou criar um banco com 2 parâmetros, esses parâmetros em MySQL se chamam 'CONSTRAINTS', ele já irá ter uma codificação de caracteres pos padrão e um collation por padrão, todos eles voltados para o UTF8 (aceita caracteres acentuados no padrão);

```
CREATE DATABASE cadastro
    default character set utf8
    default collate utf8_general_ci;
```

> Otimizada - melhorada nos campos:

```
CREATE TABLE pessoas (
    nome varchar (30),
    idade tinyint(3),
    sexo char(1),
    peso float,
    altura float,
    nacionalidade varchar(20)
);
```

- Primeira coisa trabalhar com números reais; isso porque utilizei o tipo float, um tipo muito genérico, que já coloca lá o valor no formato que ele decidir no banco de dados;
- Vamos partir para o tipo decimal, que é um tipo mais personalizável;
- Vamos cadastrar o dia que a pessoa nasceu em vez de cadastrar a idade dela;
- Colocar a configuração de caracteres padrão na criação da tabela, para isso vamos colocar lá no final, no fechamento do parêntese;
- Adicionar mais algumas 'constraints', lembrando que 'constraints' são regras que a gente vai definir para a criação de coisas dentro do meu banco de dados;
  > CONSTRAINTS ->
- 'Not Null' -> significa que você vai ter que preencher os dados, por padrão se eu quiser cadastrar uma pessoa e não quiser informar por exemplo a data de nascimento dela, sem problema, por padrão; mas se você quiser obrigar, por exemplo que toda pessoa tenha nome, não tem como cadastrar uma pessoa, se ela não tiver nome, então nesses campos que são obrigatoriamente digitáveis, coloca a 'constraints' 'not null';
- O sexo em vez de 'char', vou utilizar um tipo de coleção que é o 'enum', quando usa o 'set' ou 'enum', colocando entre parenteses, entre aspas os valores, separados por vírgula, estou dizendo quais são os valores que serão aceitos, então para sexo, ele só vai aceitar 'M' ou 'F', isso vai permitir que você defina a estrutura de forma um pouco mais rígida, para que o cara não coloque a letra 'A' por exemplo;
- O peso que era float agora vou colocar com decima e vou colocar 5,2 entre parentese separados por vírgula; '5,2' -> imagina que sejam 5 casas ao todo; o segundo numero é a quantidade de numeros que vão ficar após a vírgula, então desses '5' '2' vão ficar após a vírgula, '3' antes da vírgula; com isso economiza espaço e configura qual a precisão exata que o número vai precisar ter;2 é a qauntidade de casa decimal;
  > <img alt="" src="./img/peso.png" width="100%"></br>
- Nacionalidade 'default 'Brasil'' -> se ninguém digitar nada, por padrão será Brasil;
- 'id' -> Numa tabela é importante que defina pelo menos um dos campos, como um campo que chamamos de chave primaria, um campo 'chave primária' ele não se repete, então por exemplo você tem uma academia, você tem sua matrícula na academia, seu cadastro de pessoa física (CPF); para definir o 'id' como chave primaria, vai na última linha e coloca 'PRIMARY KEY';
- 'auto_increment' -> a primeira pessoa que cadastrar vai ser código 1, a segunda 2...tudo isso automaticamente;

```
CREATE TABLE pessoas (
    id int not null auto_increment,
    nome varchar (30) not null,
    nascimento date,
    sexo enum ('M', 'F'),
    peso decimal (5,2),
    altura decimal (5,2),
    nacionalidade varchar(20) default 'Brasil',
    PRIMARY KEY (id)
) default charset  = utf8;
```

- **OBS.:** pode acontecer em algum tutorial, ou material, inclusive na exportação do seu banco de dados, que os nomes dos campos estejam colocados entre `crase`, isso permite que utilize por exemplo, campos com ascentos, campos com espaços, apesar disso não ser o recomendado, então você pode ver isso aqui em alguns tutoriais ou algum material específico;
- Todo caractere em SQL entre 'aspas' simples, e toda palavra de definição entre `crases`;

```
CREATE TABLE `pessoas` (
    `nome` varchar (30) not null,
    `nascimento` date,
    `sexo` enum ('M', 'F'),
    `peso` decimal (5,2),
    `altura` decimal (5,2),
    `nacionalidade` varchar(20) default 'Brasil'
) default charset  = utf8;
```

```
COMO FICO

CREATE DATABASE cadastro
    default character set utf8
    default collate utf8_general_ci;

use cadastro;

CREATE TABLE `pessoas` (
	`id` int not null auto_increment,
    `nome` varchar (30) not null,
    `nascimento` date,
	`sexo` enum ('M', 'F'),
    `peso` decimal (5,2),
    `altura` decimal (5,2),
	`nacionalidade` varchar(20) default 'Brasil',
    PRIMARY KEY (id)
) default charset  = utf8;
```

> INSERINDO DADOS NA TABELA

- Todo comando SQL que faz parte da estrutura, que faz parte da definição de estrutura de um banco de dados, segue um sigla 'DDL' - significa 'Data Definition Language' 'Liguagem de definição de dados'Ex.: 'CREATE DATABASE';
- Comando DDL - 'CREATE TABLE' -> ele é um comando para definição da minha tabela, isso é vou mexer nas definições da minha tabela;
- As datas nos bancos de dados MySQL, são dadas na seguinte maneira: ano-mês-dia;
- O que esta estre 'aspas' são dados, o que não esta entre aspas é considerado 'constrain';
- Insira na tabela pessoas com os campos (id,nome,...) os valores (1, Godofredo,...);

```
INSERT INTO pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
('1', 'Godofredo', '1994-01-02', 'M', '78.5', '1.83', 'Brasil');
```

- Não precisa especificar o 'id' porque esta com 'auto_increment';

```
INSERT INTO pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Godofredo', '1994-01-02', 'M', '78.5', '1.83', 'Brasil');
```

- Selecione tudo de pessoas, selecione todos dados de pessoas;
- Tem como fazer colocando o 'id'; onde iria colocar o valor do id coloca uma 'constraint', lembrando que constrain não tem aspas - 'default' - padrão;

```
INSERT INTO pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(DEFAULT, 'Augusto', '1994-01-02', 'M', '62', '1.70', 'Brasil');
```

- Se for inserir dados e ordem dos campos for exatamente a ordem que foi definida no banco. então não precisa dizer quais são os campos;
  > <img alt="" src="./img/insert.png" width="100%"></br>

> INSERIR VÁRIOS DADOS AO MESMO TEMPO

```
INSERT INTO pessoas values
(DEFAULT, 'Teste', '1999-01-02', 'M', '78', '1.70', default),
(DEFAULT, 'Teste1', '1994-01-02', 'M', '62', '1.90', default),
(DEFAULT, 'Teste2', '1994-01-02', 'M', '62', '1.90', 'Espanha');
```

- INSERT INTO - serviu para inserir dados, manipular dados; é da classificação 'DML' - 'Data Manipulation Language';

> MODIFICAÇÃO DA ESTRUTURA DA TABELA

- ALTER TABLE - comando para alterar a estrutura da tabela;
- A primeira coisa é adicionar uma nova coluna;
- Quando adiciona uma coluna, ela sempre vai parar no final;

```
alter table pessoas
add column profissao varchar(50);
```

- 'Drop' - Remover uma coluna;

```
alter table pessoas
drop column profissao;
```

- 'AFTER' - Para colocar a coluna criada em outra posição;

```
alter table pessoas
add column profissao varchar(10) after nome;
```

- 'FIRST' - Para colocar a coluna criada em primeiro;

```
alter table pessoas
add column codigo int first;
```

> MODIFICANDO DEFINIÇÕES:

- 'MODIFY' - consegui alterar tipo primitivo do campo e todas as contrains, pode redefinir as contrains, não pode renomear o campo;

```
alter table pessoas
modify column profissao varchar(20) not null;
```

- Essa coluna profissao esta vazia então não pode ter 'not null'; precisa colocar o 'default '''; nunca pode fazer com que uma 'constraint' passe por cima da outra, se não vai receber um aviso;

```
alter table pessoas
modify column profissao varchar(20) not null default '';
```

> Modificar o nome de uma coluna e também suas constraints e seu tipo primitivo;

- 'CHANGE' - tem uma sintaxe um pouco diferente, 'change' tem que colocar o nome velho e o nome novo;

```
alter table pessoas
change column profissao prof varchar(20);
```

- No lugar de renomear uma coluna, renomear uma tabela inteira;

```
alter table pessoas
rename to gente;
```

> Mais uma tabela;

- 'IF NOT EXISTS' ou 'IF EXISTS' - é um parâmetro do 'CREATE' que é o seguinte só vai criar uma tabela ou um banco de dados se ele não existir, só vai apagar uma tabela ou um banco se existir;
- 'UNIQUE' - não confunda UNIQUE com PRIMARY KEY; primary key além de ser unique, ela tem outras características, unique é o seguinte, não to dizendo que o nome é uma chave primária, ele não vai identificar os registros mas ele não vai deixar colocar dois cursos com o mesmo nome;
- 'INT' - a `carga` ela é int, é carga horária, é quantas horas temo curso por exemplo um curso de 10h, é um número inteiro mas percebe que esse número nunca é negativo, coloca a 'constrain' específica que é 'UNSIGNED' - significa sem sinal, isso vai economizar um byte para cada registro que tenha `carga` registrada;

```
create table if not exists cursos (
    nome varchar (30) not null UNIQUE,
    descricao text,
    carga int UNSIGNED,
    totaulas int,
    ano year DEFAULT '2016'
) default charset = utf8;
```

- Adicionar a chave primária, coloca o código do curso como primeira coluna; para fazer isso utiliza o 'ALTER TABLE' `cursos`, que é o nome da nossa tabela; coloca o identificador do curso como primeira coluna na minha tabela de cursos;

```
alter table cursos
add column idcurso int first;
```

- Adicionar chave primaria não tem como adicionar a coluna e colocar ela como chave primaria em 1 comando, tem que utilizar 2;

```
alter table cursos
add primary key (idcurso);
```

> APAGANDO A TABELA;

- A palavra 'drop' pode ser um parâmetro de 'alter table' - 'ALTER TABLE DROP' é para apagar coluna;

```
drop table cursos;
```

> <img alt="" src="./img/data.png" width="50%"></br>

```
mysql -u root -p

SHOW DATABASES;

CREATE DATABASE cadastro;

drop database cadastro;

CREATE TABLE pessoas (
    nome varchar (30),
    idade tinyint(3),
    sexo char(1),
    peso float,
    altura float,
    nacionalidade varchar(20)
);

describe pessoas; ou des pessoas;

status; (ve qual banco esta aberto)

show tables;

select * from pessoas;
```

**(...) continua ->Curso MySQL #07 - Manipulando Linhas (UPDATE, DELETE e TRUNCATE)**

## �� Tecnologias

<div>

<img src="https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/mysql/mysql-original-wordmark.svg" width="40" height="40"/>
       
</div>
