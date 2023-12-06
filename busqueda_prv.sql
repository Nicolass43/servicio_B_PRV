/*drop database sistema_busqueda_prv;*/
create database if not exists sistema_busqueda_prv;
use sistema_busqueda_prv;
/*
1 = servicio
2 = insumo
*/
create table PROVEEDOR(
rut varchar(11) not null,
nombre_fantasia varchar(30),
razon_social varchar(30),
direccion varchar(30),
email varchar(30),
telefono varchar(15),
tipo_ser int,
constraint pk_prv primary key (rut)
);
alter table PROVEEDOR
modify column direccion varchar(100);	

create table CATEGORIA(
id_categoria int,
nombre varchar(30) not null,
id_servicio int,
id_insumo int,
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

insert into PROVEEDOR (rut, nombre_fantasia, razon_social, direccion, email, telefono, tipo_ser) values ('81821100-7', 'Turismo Cocha S.A.', null, 'avenida el bosque norte 0430, las condes', null, '
+56224641300', 1);

select rut, nombre_fantasia as 'nombre fantasia', razon_social as 'razon social', direccion, email, telefono, tipo_ser as 'tipo de servicio'  from PROVEEDOR;
