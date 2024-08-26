create database bercario01;
use bercario01;

-- ------------- ENDEREÇOS ------------- 

create table enderecos(
id_endereco int primary key,
cep varchar(10),
rua varchar(255),
numero varchar(10),
complemento varchar(50),
bairro varchar (100),
cidade varchar (100),
estado varchar (50)
);

-- ------------- GENITORES ------------- 

create table genitores (
id_genitores int primary key,
nome varchar(255),
rg varchar (20) unique,
sexo char(1),
data_nascimento date,
telefone varchar(15),
id_endereco int,
 foreign key (id_endereco) references enderecos (id_endereco)
);

-- ------------- BEBES ------------- 

create table bebes(
id_bebe int primary key,
nome varchar(255),
data_hora_nascimento datetime,
sexo char(1),
peso decimal (5,2),
altura decimal (5,2),
tipo_parto varchar(50),
id_pai int, foreign key (id_pai) references genitores (id_genitores),
id_mae int, foreign key (id_mae) references genitores (id_genitores)
);

-- ------------- CARGOS ------------- 

create table cargos(
id_cargo int primary key,
descricao_cargo varchar(100)
);

-- ------------- PROFISSIONAIS DE SAUDE ------------- 

create table profissionais_saude(
id_profissional int primary key,
nome varchar(255) not null,
rg varchar(20) unique not null,
cpf varchar(14) unique not null,
data_nascimento date,
registro_ordem varchar(50),
id_cargo int,
 foreign key(id_cargo) references cargos (id_cargo)
);

-- ------------- PROFISSIONAIS BEBE ------------- 
create table profissionais_bebe(
id_bebe int, 
id_profissional int, 
primary key (id_bebe, id_profissional),
foreign key (id_bebe) references bebes(id_bebe),
foreign key (id_profissional) references profissionais_saude(id_profissional)
);