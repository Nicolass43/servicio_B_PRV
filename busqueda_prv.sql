drop database sistema_busqueda_prv;

create database if not exists sistema_busqueda_prv;
use sistema_busqueda_prv;

create table PROVEEDOR(
id int not null auto_increment,
rut varchar(11) not null,
nombre_fantasia varchar(30),
razon_social varchar(100),
direccion varchar(100),
email varchar(30),
telefono varchar(15),
tipo_ser int,
constraint pk_prv primary key (id)
);

create table CATEGORIA(
id_categoria int not null auto_increment,
nombre varchar(30) not null,
constraint pk_categoria primary key (id_categoria)
); 

create table SERVICIO(
id_servicio int not null,
nombre varchar(30) not null, 	
precio int,
rut_prv int not null,
constraint pk_ser primary key (id_servicio)
);

create table INSUMO(
id_insumo int,
nombre varchar(30) not null,  
precio int ,
cantidad int not null,
constraint pk_insumo primary key (id_insumo)
);

create table servicio_categoria(
id int not null auto_increment,
id_categoria int not null,
id_servicio int not null,
constraint pk_servicio_categoria primary key (id),
constraint fk_servicio_servicio_categoria foreign key (id_servicio) references SERVICIO (id_servicio)
);

create table insumo_categoria(
id int not null auto_increment,
id_insumo int not null,
id_categoria int not null,
constraint pk_insumo_categoria primary key (id),
constraint fk_insumo_insumo_categoria foreign key (id_insumo) references INSUMO (id_insumo),
constraint fk_categoria_insumo_categoria foreign key (id_categoria) references CATEGORIA (id_categoria) 
);

create table proveedor_categoria(
id int not null auto_increment,
id_proveedor int not null,
id_categoria int not null,
constraint pk_proveedor_categoria primary key(id),
constraint fk_proveedor_proveedor_categoria foreign key (id_proveedor) references PROVEEDOR(id),
constraint fk_categoria_proveedor_categoria foreign key (id_categoria) references CATEGORIA(id_categoria)
);
/*insertamos datos de los proveedores*/
/*
1 = servicio
2 = insumo
*/

insert into PROVEEDOR (rut, nombre_fantasia, razon_social, direccion, email, telefono, tipo_ser) 
values ('81821100-7', null, 'Turismo Cocha S.A.' , 'El Bosque Nte 0430, Las Condes,', null, '
+56224641300', 1);

insert into PROVEEDOR (rut, nombre_fantasia, razon_social, direccion, email, telefono, tipo_ser) 
values ('99520000-7',  null, 'COPEC S.A', 'Camino El Alba 9610, Las Condes', null,
'800-200-354', 1);

insert into PROVEEDOR (rut, nombre_fantasia, razon_social, direccion, email, telefono, tipo_ser) 
values ('96670840-9', null, 'Dimerc S.A', 'Alberto Pepper 1784, Renca', 'cobranza@dimerc.cl',
'+56223858000', 2);

insert into PROVEEDOR (rut, nombre_fantasia, razon_social, direccion, email, telefono, tipo_ser) 
values ('76962510-0', null, 'SAMTECH S.A', 'Calle Flandes 1023 Las Condes', null,
'+56228988900', 1);

insert into PROVEEDOR (rut, nombre_fantasia, razon_social, direccion, email, telefono, tipo_ser) 
values ('76507788-9', null, 'COM. ARRIENDO Y SERV ELECT Y COMUN', 'Madame Curie 2362 Of. 31, Calama', null,
'+56977662676', 1);

insert into PROVEEDOR (rut, nombre_fantasia, razon_social, direccion, email, telefono, tipo_ser) 
values ('76814828-7', 'Tripodes.cl', 'PHOTOFACTORY CHILE SPA', 'La Pastora 170, Las Condes', 'contacto@tripodes.cl',
'+56227040176', 1);	

insert into PROVEEDOR (rut, nombre_fantasia, razon_social, direccion, email, telefono, tipo_ser) 
values ('76253534-3', null , 'Corporate Coffee SpA', 'Isidora Goyenechea 3162, Las Condes', 'ventas@corporatecoffee.cl ',
'+56223153546', 2);	

insert into PROVEEDOR (rut, nombre_fantasia, razon_social, direccion, email, telefono, tipo_ser) 
values ('96792430-K', null, 'Sodimac S.A.', 'Avenida Eduardo Frei Montalva 3092, Renca', null ,
'600-329-2002', 2);	



insert into CATEGORIA(nombre) values ('Movilizacion');

/*update CATEGORIA set nombre = 'Movilizacion' where id_categoria = 1;*/

insert into CATEGORIA(nombre) values ('Ferreteria');

/*selects*/

select pr.rut, pr.nombre_fantasia as 'nombre fantasia', pr.razon_social as 'razon social', pr.direccion, pr.email, pr.telefono, pr.tipo_ser as 'tipo de servicio',
cat.id_categoria as 'ID', cat.nombre as 'servicio'
from PROVEEDOR pr inner join CATEGORIA cat;

select pr.rut, pr.nombre_fantasia as 'nombre fantasia', pr.razon_social as 'razon social', pr.direccion, pr.email, pr.telefono, pr.tipo_ser as 'tipo de servicio' from PROVEEDOR pr; 

select * from CATEGORIA;

select * from PROVEEDOR order by id asc;
