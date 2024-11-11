create database Proyecto_womenty
use Proyecto_womenty

create table facturas(
cod_facturas bigint primary key,
fecha date,
transporte money,
valor_fac money)

create table clientes(
cedula bigint primary key,
nombre_cliente varchar(80),
direccion varchar(100),
barrio varchar(40),
ciudad varchar(40),
telefono bigint,
correo varchar(50),
cod_facturas bigint,
constraint cod_facturas1 foreign key (cod_facturas) references facturas (cod_facturas))

create table productos(
cod_productos varchar (10) primary key,
camiseta varchar(20),
color varchar (20),
talla varchar (5),
estampado varchar(20),
valor_uni money,
cantidad int)

create table proveedores(
nit_proveedores bigint primary key,
nombre_proveedor varchar(100),
dir_proveedor varchar(100),
ciudad_proveedor varchar (40),
tel_proveedor bigint,
correo_proveedor varchar (50))

create table clientes_productos(
cedula bigint,
cod_productos varchar (10),
constraint cedula1 foreign key (cedula) references clientes (cedula),
constraint cod_productos1 foreign key (cod_productos) references productos (cod_productos)) 

create table productos_proveedores(
cod_productos varchar (10),
nit_proveedores bigint,
constraint cod_productos2 foreign key (cod_productos) references productos (cod_productos),
constraint nit_proveedores1 foreign key (nit_proveedores) references proveedores (nit_proveedores))

create table facturas_productos(
cod_facturas bigint,
cod_productos varchar (10),
constraint cod_facturas2 foreign key (cod_facturas) references facturas (cod_facturas),
constraint cod_productos3 foreign key (cod_productos) references productos (cod_productos))

use womenty

select * from facturas
insert into facturas values (001,'01-01-2023',10000,80000)
insert into facturas values (002,'01-01-2023',20000,150000)
insert into facturas values (003,'01-01-2023',10000,40000)
insert into facturas values (004,'01-01-2023',20000,30000)
insert into facturas values (005,'01-01-2023',20000,84000)	

select * from clientes
insert into clientes values (1038384814,'Yurany Andrea Cardona','Cll 59 85-25','Buenos aires','Medellin',3204298703,'brencon813@gmail.com',001)
insert into clientes values (1054789817,'Vivian Isabel Almario','Calle 103 # 12- 86','Giron','Bucaramanga Santander',3103323382,'vivianalmario@gmail.com',002)
insert into clientes values (1010455254,'Fernanda de la Cruz','Petruc calle 16b número 26-44','Calazans','Medellin',3022007833,'yurany2198@gmail.com',003)
insert into clientes values (1058745698,'Tulia Alvear Martinez','Calle 4#650','Altos de fontana','Bucaramanga',3053761393,'tuliaalvear@gmail.com',004)
insert into clientes values (1047575777,'Yeraldin Tobon Paniagua','Calle 45 54 22','Centro','Palmira valle ',3217972374,'fernanda312f10@gmail.com',005)

select * from productos 
insert into productos values ('CBLXL105','Corte','Blanca','XL','Cara amarilla Drew',40000,2)
insert into productos values ('EROL204','Estilo','Roja','L','Its okay to not be',30000,5)
insert into productos values ('CBEM103','Corte','Beige','M','Felling chill',40000,1)
insert into productos values ('ENEL204','Estilo','Negra','L','Strangerting',30000,1)
insert into productos values ('BAZM303','Buso','Azul','M','Mariposas',28000,3)

select * from proveedores
insert into proveedores values (9012651864,'MIGUETEX S.A.S','CARRERA 53 N 48 21 LOCAL 114','Medellin',3012938008,'info@miguetex.com')
insert into proveedores values (8050211707,'ARITEX S.A.S','CARRERA 29 N 11 81','Medellin',6043904242,'ventas@aritex.com')
insert into proveedores values (9015474678,'INVERSIONES REINO GRAFICO DIGITAL S.A.S','CARRERA 53 N 49 39 PISO 2','Medellin',6045874514,'informacion@reinodigital.com')
insert into proveedores values (9002597345,'INDUSTRIAS PLASTICAS DE MEDELLIN S.A.S','CARRERA 54 N 48 76','Medellin',6044448369,'comercio@indplasticas.com')
insert into proveedores values (9009909005,'CAJAS YA S.A.S','CARRERA 45 N 38  53','Medellin',3175024712,'ventas1@cajasya.com')

select * from clientes_productos
insert into clientes_productos values (1038384814,'CBLXL105')
insert into clientes_productos values (1054789817,'EROL204')
insert into clientes_productos values (1010455254,'CBEM103')
insert into clientes_productos values (1058745698,'ENEL204')
insert into clientes_productos values (1047575777,'BAZM303')

select * from productos_proveedores
insert into productos_proveedores values('CBLXL105',9012651864)
insert into productos_proveedores values('EROL204',8050211707)
insert into productos_proveedores values('CBEM103',9015474678)
insert into productos_proveedores values('ENEL204',9002597345)
insert into productos_proveedores values('BAZM303',9009909005)

select * from facturas_productos
insert into facturas_productos values (001,'CBLXL105')
insert into facturas_productos values (002,'EROL204')
insert into facturas_productos values (003,'CBEM103')
insert into facturas_productos values (004,'ENEL204')
insert into facturas_productos values (005,'BAZM303')

exec sp_rename  'proveedores.tel_proveedor', 'cel_proveedor'
exec sp_rename  'proveedores.cel_proveedor', 'tel_proveedor'

insert into proveedores values (9012651865,'MIGUETEX S.A.S','CARRERA 53 N 48 21 LOCAL 114','Medellin',3012938008,'info@miguetex.com')

select * from proveedores

update proveedores set nombre_proveedor='GBQ S.A.S' where nit_proveedores=9012651865

alter table proveedores add cel_proveedor bigint
alter table proveedores drop column cel_proveedor

delete from proveedores where nit_proveedores=9012651865