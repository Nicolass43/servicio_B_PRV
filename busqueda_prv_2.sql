drop database sistema_busqueda_prv;
create database if not exists sistema_busqueda_prv;
use sistema_busqueda_prv;

create table PROVEEDOR(
id int not null auto_increment,
rut varchar(11) not null,
nombre_fantasia varchar(30),
razon_social varchar(100),
direccion varchar(100),
email varchar(50),
telefono varchar(15),
tipo_ser float,
condicion_pago varchar(10),
constraint pk_prv primary key (id)
);

create table CATEGORIA(
id_categoria int not null auto_increment,
nombre varchar(30) not null,
tipo float not null,
constraint pk_categoria primary key (id_categoria)
); 


create table SERVICIO(
id_servicio int not null auto_increment,
nombre varchar(30) not null, 	
precio int,
constraint pk_ser primary key (id_servicio)
);

create table INSUMO(
id_insumo int not null auto_increment,
nombre varchar(30) not null,  
constraint pk_insumo primary key (id_insumo)
);

create table proveedor_categoria(
id int not null auto_increment,
id_proveedor int not null  ,
id_categoria int not null  ,
constraint pk_proveedor_categoria primary key(id),
constraint fk_proveedor_proveedor_categoria foreign key (id_proveedor) references PROVEEDOR(id),
constraint fk_categoria_proveedor_categoria foreign key (id_categoria) references CATEGORIA(id_categoria)
);

create table servicio_categoria(
  id int not null auto_increment,
  id_categoria int not null,
  id_servicio int not null,
  constraint pk_servicio_categoria primary key (id),
  constraint fk_servicio_servicio_categoria foreign key (id_servicio) references SERVICIO (id_servicio),
  constraint fk_categoria_servicio_categoria foreign key (id_categoria) references CATEGORIA (id_categoria)
);
create table insumo_categoria(
  id int not null auto_increment,
  id_categoria int not null,
  id_insumo int not null,
  constraint pk_insumo_categoria primary key (id),
  constraint fk_insumo_insumo_categoria foreign key (id_insumo) references INSUMO (id_insumo),
  constraint fk_categoria_insumo_categoria foreign key (id_categoria) references CATEGORIA (id_categoria)
);

/*
1 = servicio
2 = insumo
*/

insert into SERVICIO(id_servicio, nombre, precio) values 
(1, 'Servicio de GPS', 8990);
insert into SERVICIO(id_servicio, nombre, precio) values 
(2, 'Arriendo de maquinas', 10990);


insert into INSUMO (id_insumo, nombre) values 
(1, 'Bidon Agua 5 lt');
insert into INSUMO (id_insumo, nombre) values 
(2, 'Tornillos de Cruz 5 cm');

insert into proveedor_categoria (id_proveedor, id_categoria)values
(1, 1), -- Proveedor1 pertenece a CategoriaServicio
(2, 2), -- Proveedor2 pertenece a CategoriaInsumo
(3, 1); -- Proveedor3 pertenece a CategoriaServicio

insert into servicio_categoria (id_categoria, id_servicio)
values
(/*categoria*/ 2, /*servicio*/ 1), -- Servicio1 pertenece a CategoriaServicio
(/*categoria*/ 4, /*servicio*/ 2); -- Servicio2 pertenece a CategoriaServicio

insert into insumo_categoria (id_categoria, id_insumo)
values
(/*categoria*/ 5, /*insumo */ 1), 
(/*categoria*/ 1, /*insumo */ 2); 

insert into CATEGORIA (id_categoria, nombre, tipo)values (1, 'Ferreteria', 2.5);
insert into CATEGORIA (id_categoria, nombre, tipo)values (2, 'GPS', 1.1);
insert into CATEGORIA (id_categoria, nombre, tipo)values (3, 'Insumos Computacionales', 2.1);
insert into CATEGORIA (id_categoria, nombre, tipo)values (4, 'Arriendo', 1.2);
insert into CATEGORIA (id_categoria, nombre, tipo)values (5, 'Alimentos', 2.2);
insert into CATEGORIA (id_categoria, nombre, tipo)values (6, 'Aduana', 1.3);
insert into CATEGORIA (id_categoria, nombre, tipo)values (7, 'EPP', 2.3);
insert into CATEGORIA (id_categoria, nombre, tipo)values (8, 'MISC', 1.4);
insert into CATEGORIA (id_categoria, nombre, tipo)values (9, 'Insumo Electrico', 2.4);
insert into CATEGORIA (id_categoria, nombre, tipo)values (10, 'Laser', 1.5);
insert into CATEGORIA (id_categoria, nombre, tipo)values (11, 'Movilizacion', 1.6);

select * from CATEGORIA;
select * from PROVEEDOR;
select * from SERVICIO;
select * from INSUMO;

SELECT pr.rut, pr.nombre_fantasia as 'nombre fantasia', pr.razon_social as 'razon social', pr.direccion, pr.email, pr.telefono, pr.condicion_pago as 'condicion pago', 
cat.nombre as 'categoria'
FROM PROVEEDOR pr
inner join CATEGORIA cat 
where pr.tipo_ser = cat.tipo;


select ins.id_insumo, ins.nombre AS 'nombre insumo', cat.id_categoria, cat.nombre AS 'categoria' FROM INSUMO ins
inner join insumo_categoria ic ON ins.id_insumo = ic.id_insumo
inner join CATEGORIA cat ON ic.id_categoria = cat.id_categoria;

select ser.nombre, cat.nombre as 'categoria' from SERVICIO ser 
inner join servicio_categoria sc on sc.id_servicio = ser.id_servicio
inner join CATEGORIA cat on sc.id_categoria = cat.id_categoria; 

