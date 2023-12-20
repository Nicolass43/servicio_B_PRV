		/* HEADER */

SET SQL_SAFE_UPDATES = 0;
create database if not exists sistema_busqueda_prv;
use sistema_busqueda_prv;
		
        /* HEADER */
        
		/* MAIN */
    
	CREATE TABLE proveedor (
    id INT NOT NULL AUTO_INCREMENT,
    rut VARCHAR(20) NOT NULL,
    nombre_fantasia VARCHAR(30),
    razon_social VARCHAR(100),
    direccion VARCHAR(100),
    email VARCHAR(50),
    telefono VARCHAR(15),
    condicion_pago VARCHAR(10),
    CONSTRAINT pk_prv PRIMARY KEY (id)
);

	CREATE TABLE categoria (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
);

	CREATE TABLE servicio (
    id_servicio INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    CONSTRAINT pk_ser PRIMARY KEY (id_servicio)
);

	CREATE TABLE insumo (
    id_insumo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    CONSTRAINT pk_insumo PRIMARY KEY (id_insumo)
);
		/* MAIN */
		/* LOGIN */

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS registros_login (
 id INT AUTO_INCREMENT PRIMARY KEY,
 id_usuario INT NOT NULL,
 fecha_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

			/* LOGIN */
	
		/* CONEXIONES */

CREATE TABLE IF NOT EXISTS proveedor_categoria(
	id int not null auto_increment,
	id_proveedor int not null  ,
	id_categoria int not null  ,
	constraint pk_proveedor_categoria primary key(id),
	constraint fk_proveedor_proveedor_categoria foreign key (id_proveedor) references proveedor(id),
	constraint fk_categoria_proveedor_categoria foreign key (id_categoria) references categoria(id_categoria)
);

CREATE TABLE IF NOT EXISTS servicio_categoria(
	id int not null auto_increment,
	id_categoria int not null,
	id_servicio int not null,
	constraint pk_servicio_categoria primary key (id),
	constraint fk_servicio_servicio_categoria foreign key (id_servicio) references servicio (id_servicio),
	constraint fk_categoria_servicio_categoria foreign key (id_categoria) references categoria (id_categoria)
);

CREATE TABLE IF NOT EXISTS insumo_categoria(
    id int not null auto_increment,
    id_categoria int not null,
    id_insumo int not null,
    constraint pk_insumo_categoria primary key (id),
    constraint fk_insumo_insumo_categoria foreign key (id_insumo) references insumo (id_insumo),
    constraint fk_categoria_insumo_categoria foreign key (id_categoria) references categoria (id_categoria)
);

		/* CONEXIONES */

	   /* INSERCION DATOS */

INSERT INTO proveedor_categoria (id_proveedor, id_categoria) VALUES

(/* proveedor */ 1, /* categoria */ 11),
(/* proveedor */ 2, /* categoria */ 11), 
(/* proveedor */ 3, /* categoria */ 5), 
(/* proveedor */ 4, /* categoria */ 2),
(/* proveedor */ 5, /* categoria */ 4),
(/* proveedor */ 6, /* categoria */ 8),
(/* proveedor */ 7, /* categoria */ 3),
(/* proveedor */ 8, /* categoria */ 5),
(/* proveedor */ 9, /* categoria */ 1),
(/* proveedor */ 10,/* categoria */ 6),

(/* proveedor */ 11, /* categoria */ 8),
(/* proveedor */ 12, /* categoria */ 1), 
(/* proveedor */ 13, /* categoria */ 6), 
(/* proveedor */ 14, /* categoria */ 1),
(/* proveedor */ 15, /* categoria */ 4),
(/* proveedor */ 16, /* categoria */ 5),
(/* proveedor */ 17, /* categoria */ 7),
(/* proveedor */ 18, /* categoria */ 3),
(/* proveedor */ 19, /* categoria */ 2),
(/* proveedor */ 20, /* categoria */ 1),

(/* proveedor */ 21, /* categoria */ 3),
(/* proveedor */ 22, /* categoria */ 8),
(/* proveedor */ 23, /* categoria */ 6),
(/* proveedor */ 24, /* categoria */ 1),
(/* proveedor */ 25, /* categoria */ 1),
(/* proveedor */ 26, /* categoria */ 10),
(/* proveedor */ 27, /* categoria */ 8),
(/* proveedor */ 28, /* categoria */ 4),
(/* proveedor */ 29, /* categoria */ 7),
(/* proveedor */ 30, /* categoria */ 1),

(/* proveedor */ 31, /* categoria */ 6),
(/* proveedor */ 32, /* categoria */ 1),
(/* proveedor */ 33, /* categoria */ 9),
(/* proveedor */ 34, /* categoria */ 10),
(/* proveedor */ 35, /* categoria */ 11),
(/* proveedor */ 36, /* categoria */ 9),
(/* proveedor */ 37, /* categoria */ 9),
(/* proveedor */ 38, /* categoria */ 9),
(/* proveedor */ 39, /* categoria */ 1),
(/* proveedor */ 40, /* categoria */ 9),

(/* proveedor */ 41, /* categoria */ 9),
(/* proveedor */ 42, /* categoria */ 9),
(/* proveedor */ 43, /* categoria */ 9),
(/* proveedor */ 44, /* categoria */ 6),
(/* proveedor */ 45, /* categoria */ 3),
(/* proveedor */ 46, /* categoria */ 1),
(/* proveedor */ 47, /* categoria */ 9),
(/* proveedor */ 48, /* categoria */ 9),
(/* proveedor */ 49, /* categoria */ 9),
(/* proveedor */ 50, /* categoria */ 9),

(/* proveedor */ 51, /* categoria */ 1),
(/* proveedor */ 52, /* categoria */ 9),
(/* proveedor */ 53, /* categoria */ 9),
(/* proveedor */ 54, /* categoria */ 1),
(/* proveedor */ 55, /* categoria */ 1),
(/* proveedor */ 56, /* categoria */ 1),
(/* proveedor */ 57, /* categoria */ 8),
(/* proveedor */ 58, /* categoria */ 1),
(/* proveedor */ 59, /* categoria */ 9),
(/* proveedor */ 60, /* categoria */ 1),

(/* proveedor */ 61, /* categoria */ 1),
(/* proveedor */ 62, /* categoria */ 9),
(/* proveedor */ 63, /* categoria */ 9),
(/* proveedor */ 64, /* categoria */ 9),
(/* proveedor */ 65, /* categoria */ 8);

INSERT INTO servicio_categoria (id_categoria, id_servicio)VALUES
(/*categoria*/ 2, /*servicio*/ 1), -- Servicio1 pertenece a CategoriaServicio
(/*categoria*/ 4, /*servicio*/ 2); -- Servicio2 pertenece a CategoriaServicio

INSERT INTO insumo_categoria (id_categoria, id_insumo)VALUES
(/*categoria*/ 5, /*insumo */ 1), 
(/*categoria*/ 1, /*insumo */ 2),
(/*categoria*/ 1, /*insumo */ 3),
(/*categoria*/ 3, /*insumo */ 4),
(/*categoria*/ 5, /*insumo */ 5),
(/*categoria*/ 9, /*insumo */ 6),
(/*categoria*/ 1, /*insumo */ 7),
(/*categoria*/ 3, /*insumo */ 8),
(/*categoria*/ 1, /*insumo */ 9),
(/*categoria*/ 9, /*insumo */ 10);

INSERT INTO categoria (id_categoria, nombre, tipo) VALUES (/*id*/ 1, /*nombre*/ 'Ferreteria');
INSERT INTO categoria (id_categoria, nombre, tipo) VALUES (/*id*/ 2, /*nombre*/ 'GPS', 1.1);
INSERT INTO categoria (id_categoria, nombre, tipo) VALUES (/*id*/ 3, /*nombre*/ 'Insumos Computacionales');
INSERT INTO categoria (id_categoria, nombre, tipo) VALUES (/*id*/ 4, /*nombre*/ 'Arriendo');
INSERT INTO categoria (id_categoria, nombre, tipo) VALUES (/*id*/ 5, /*nombre*/ 'Alimentos');
INSERT INTO categoria (id_categoria, nombre, tipo) VALUES (/*id*/ 6, /*nombre*/ 'Aduana');
INSERT INTO categoria (id_categoria, nombre, tipo) VALUES (/*id*/ 7, /*nombre*/ 'EPP');
INSERT INTO categoria (id_categoria, nombre, tipo) VALUES (/*id*/ 8,  /*nombre*/ 'MISC');
INSERT INTO categoria (id_categoria, nombre, tipo) VALUES (/*id*/ 9, /*nombre*/ 'Insumo Electrico');
INSERT INTO categoria (id_categoria, nombre, tipo) VALUES (/*id*/ 10, /*nombre*/ 'Laser');
INSERT INTO categoria (id_categoria, nombre, tipo) VALUES (/*id*/ 11, /*nombre*/ 'Movilizacion');

INSERT INTO servicio(id_servicio, nombre) VALUES (/*id*/ null, /*nombre*/ 'Servicio de GPS');
INSERT INTO servicio(id_servicio, nombre) VALUES (/*id*/ null, /*nombre*/ 'Arriendo de maquinas');

INSERT INTO insumo (id_insumo, nombre) VALUES
	(/*id*/ null, /*nombre*/ 'Tornillos de Cruz'),
	(/*id*/ null, /*nombre*/ 'Bidon Agua'),
    (/*id*/ null, /*nombre*/ 'Clavos'),
    (/*id*/ null, /*nombre*/ 'Mouse'),
    (/*id*/ null, /*nombre*/ 'Comida'),
    (/*id*/ null, /*nombre*/ 'Cables'),
    (/*id*/ null, /*nombre*/ 'Martillos'),
    (/*id*/ null, /*nombre*/ 'Teclados'),
    (/*id*/ null, /*nombre*/ 'Alambres'),
    (/*id*/ null, /*nombre*/ 'Bombillas');
    
INSERT INTO proveedor VALUES (/*id*/ 66 , /*rut*/ '77980500-K', /*nombre fantasia*/	null, /*razon social */ 'CENTRO DE ERGONOMIA Y SALUD OCUPACI', 
/*direccion*/ 'Av. Prat 199 torre A, Oficina 1209, Concepción',/*email*/ 'ceso@ceso.cl', /*telefono*/ '56 412983715',/*condicion pago*/ 'Contado');	



    
			/* INSERCION DATOS */
            
SELECT * FROM proveedor;
SELECT * FROM categoria;
SELECT * FROM insumo;
SELECT * FROM servicio;


