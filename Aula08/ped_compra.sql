/*Tabelas da ped_compra
1-empresa
2-fornecedor
3-ped_compra
4-produto
5-iteins_pedcompra*/

create database ped_compra
go

use ped_compra;
go

create table empresa
(cod_emp			int				not null	identity(10,10)	primary key,
raz_social			varchar(60)		not null,
nom_fantasia		varchar(60)		not null,
cnpj				numeric(14)		not null,
ie_emp				int				not null,
end_emp				varchar(60)		not null);
go

create table fornecedor
(cod_forne			int				not null	identity(1,1)	primary key,
raz_social			varchar(60)		not null,
nom_fantasia		varchar(30)		not null,
cnpj				numeric(15)		not null,
nom_contato			varchar(30)		not null);
go

create table ped_compra
(cod_ped			int				not null	identity(5,5)	primary key,
cod_emp				int				not null		constraint empresa_cod_emp		references empresa(cod_emp),
cod_forne			int				not null		constraint fonecedor_cod_forne	references fornecedor(cod_forne),
dat_ped				date			not null,
val_tot_ped			numeric(7,2)	not null,
dat_entr_ped		date			not null);
go

create table produto
(cod_prod			int				not null	identity(1,1)	primary key,
cod_forne			int				not null		constraint	fornec_cod_forne	references fornecedor(cod_forne),
dscp_prod			varchar(50)		not null,
uni_cpra_prod		varchar(5)		not null,
qtd_uni_cpra_prod	numeric(5,2)	not null,
uni_vda_prod		varchar(5)		not null,
qtd_uni_vda_prod	numeric(5,2)	not null);
go

create table itens_pedcompra
(ped_compra			int				not null		constraint ped_compra_cod_ped	references ped_compra(cod_ped),
produto				int				not null		constraint produto_cod_prod		references produto(cod_prod),
qtd_ped				numeric(5,2)	not null,
cst_uni_ped			numeric(7,2)	not null);
go

insert into empresa (raz_social,nom_fantasia,cnpj,ie_emp,end_emp)
values('Mercado 1 Ltda' , 'Hiper Bom Preco', 111111111000190, 1111111110, 'Rua do Sol, 20'),
('Roupas 1 Ltda' , 'Roupas Bom Preco' , 222222222000188 , 3333333339 , 'Rua da chuva, 15');
go

insert into	fornecedor(raz_social,nom_fantasia,cnpj,nom_contato)
values('Produtos Alimenticios' , 'Nestle_S' , 123456789000199 , 'Jose Camargo'),
('Confecção Bela' , 'Belissima' , 987654321000100 , 'Carlos Araujo');
go

insert into produto(cod_forne,dscp_prod,uni_cpra_prod,qtd_uni_cpra_prod,uni_vda_prod,qtd_uni_vda_prod)
values(1, 'Papinha bebe' , 'cx' , 10.00 , 'uni' , 1.00),
(1 , 'Suco de maçã infant' , 'cx' , 2.00, 'cx', 2.00),
(2 , 'Macação' , 'pc' , 1.00 , 'pc', 1.00),
(2 , 'Vestido' , 'pc' , 1.00 , 'pc' , 1.00),
(1 , 'Sopa' , 'uni' , 1.00 , 'uni' , 1.00);
go

insert into ped_compra(cod_emp,cod_forne,dat_ped,val_tot_ped,dat_entr_ped)
values(10 , 1 , '2018-08-20' , 455.00 , '2018-08-22'),
(20 , 2 , '2018-08-25' , 4020.00 , '2018-08-28'),
(10 , 1 , '2018-08-25' , 9900.00 , '2018-08-30');
go

insert into itens_pedcompra(ped_compra,produto,qtd_ped,cst_uni_ped)
values(5 , 1 , 20.00 , 15.12),
(5 , 2 , 15.00 , 10.20),
(10 , 3 , 20.00 , 88.50),
(10 , 4 , 30.00 , 75.00),
(15 , 1 , 1000.00 , 9.90);
go

sp_help empresa;
sp_help fornecedor;
sp_help ped_compra;
sp_help produto;
sp_help itens_pedcompra;

alter table fornecedor
add		tel_forne	varchar(10) null;

alter table fornecedor
drop column nom_contato;

update empresa set raz_social_emp = 'Roupas 1 Ltda' where raz_social_emp = 'Roupa Preço Justo ';

select*from empresa
