CREATE DATABASE SPPD;

USE SPPD;

CREATE TABLE passageiro(
codPassageiro INT NOT NULL AUTO_INCREMENT,
nome varchar(50),
cpf varchar(20),
rg varchar(20),
logradouro varchar (60),
numero varchar (10),
complemento varchar (15),
cep varchar (10),
bairro varchar (30),
municipio varchar (20),
nascimento date,
deficiente bool,
PRIMARY KEY (codPassageiro));

CREATE TABLE categoria(
codCategoria int not null auto_increment,
nomeCategoria varchar (20),
PRIMARY KEY(codCategoria));


drop table cartao;
CREATE TABLE cartao(
codCartao int not null auto_increment,
categoria int,
ativo int not null default 0,
saldo double(10,2) default 0.0,
ultimoMovimento int default 0,
codPassageiro int not null,
FOREIGN KEY (categoria) references categoria(codCategoria),
FOREIGN KEY (codPassageiro) references passageiro(codPassageiro),
PRIMARY KEY(codCartao))
auto_increment = 100001;

CREATE TABLE linha(
codLinha int not null auto_increment,
nome varchar(15),
ativa bool,
PRIMARY KEY(codLinha));

CREATE TABLE estacao(
codEstacao int not null auto_increment,
linha int,
nome varchar (30),
FOREIGN KEY (linha) references linha(codLinha),
PRIMARY KEY (codEstacao));

CREATE TABLE grafoDasEstacoes(
codEstacao int not null,
codEstacaoProx int not null,
FOREIGN KEY (codEstacao) references estacao(codEstacao),
FOREIGN KEY (codEstacaoProx) references estacao(codEstacao));


CREATE TABLE catraca(
codCatraca int not null auto_increment,
estacao int not null,
FOREIGN KEY (estacao) references estacao(codEstacao),
PRIMARY KEY (codCatraca));

CREATE TABLE LOGIN(
username varchar(20) primary key,
password varchar(20));


drop table historicoSaldoCartao;
create table historicoSaldoCartao(
id int not null auto_increment,
codCartao int not null,
dataTransacao datetime default NOW(),
saldoAnterior double(10,2),
saldoAtual double(10,2),
descricao varchar(20),
foreign key (codCartao) references cartao(codCartao),
primary key (id));

drop table historicoViagem;
create table Viagem(
id int not null auto_increment,
codPassageiro int not null,
codCartao int not null,
dataEntrada datetime default NOW(),
dataSaida dateTime,
origem int not null,
destino int,
entrandoSaindo int default 1,
valor double(10,2),
foreign key (codCartao) references cartao(codCartao),
foreign key (codPassageiro) references passageiro(codPassageiro),
foreign key (origem) references estacao(codEstacao),
foreign key (destino) references estacao(codEstacao),
primary key (id));

