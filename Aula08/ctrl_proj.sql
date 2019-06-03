/* Tabelas do ctrl_projeto

1-cargo
2-cliente
3-funcionario
4-projeto
5-funcionario_projeto
*/

create database ctrl_projeto1
go

use ctrl_projeto1
go

create table cargo
(cod_cargo			int				not null	primary key,
dsc_cargo			varchar(40)		not null);
go

create table cliente
(cod_cli			int				not null	primary key,
nom_cli				varchar(50)		not null,
ger_proj_cli		varchar(50)		not null);
go

create table funcionario
(cod_func			int				not null	primary key,
cod_cargo			int				not null,
cod_func_ger		int				not null,
nom_func			varchar(60)		not null,
val_salario_func	numeric(7,2)	not null,

constraint funcionario_cod_func_fk  foreign key(cod_func_ger)	references funcionario(cod_func),
constraint cargo_cod_cargo_fk		foreign key(cod_cargo)	references cargo(cod_cargo));
go

create table projeto
(cod_proj			int				not null	primary key,
cod_cli				int				not null,
cod_func			int				not null,
dsc_proj			varchar(50)		not null,
dat_ini_proj		date			not null,
dat_fim_proj		date			not null,
cst_ini_proj		numeric(7,2)	not null,
cst_fim_proj		numeric(7,2)	not null,

constraint cliente_cod_cli foreign key(cod_cli)	references cliente(cod_cli),
constraint funcionario_cod_func foreign key(cod_func) references funcionario(cod_func));
go

create table funcionario_projeto
(cod_proj		int					not null,
cod_func		int					not null,
qtd_hs_func		numeric(2)			not null,

primary key(cod_proj, cod_func),
constraint projeto_doc_proj			foreign key (cod_proj) references projeto		(cod_proj),
constraint funcionario_doc_func		foreign key (cod_func) references funcionario	(cod_func));
go

sp_help cargo;
sp_help cliente;
sp_help funcionario;
sp_help projeto;
sp_help funcionario_projeto;

/* alter table */

alter table projeto
add qtd_hs_proj numeric(3)	not null;
go

alter table projeto
drop column cst_ini_proj,
cst_fim_proj;

drop table cargo;

/* Não mé possível deletar pois a tabela cargo esta referenciada com uma constraint de outra tabela*/





