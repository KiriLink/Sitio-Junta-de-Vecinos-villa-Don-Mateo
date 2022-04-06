CREATE DATABASE junta_vecinos;
USE junta_vecinos;

CREATE TABLE usuario (run_integrante VARCHAR(13) NOT NULL PRIMARY KEY,nombre VARCHAR(40) NOT NULL, apellido VARCHAR(40) NOT NULL, fecha_nacimiento DATE NOT NULL, estado_civil INT NOT NULL, numero_contacto VARCHAR(14) NOT NULL, 
correo_electronico VARCHAR(30) NOT NULL, sexo INT NOT NULL, etnia VARCHAR(20) NOT NULL, ocupacion VARCHAR(30) NOT NULL, discapacidad INT NOT NULL, socio BOOLEAN NOT NULL, estado_usuario INT NOT NULL);

CREATE TABLE comuna(id_comuna INT AUTO_INCREMENT PRIMARY KEY, nombre_comuna VARCHAR(20) NOT NULL,region_comuna VARCHAR(20) NOT NULL, estado_comuna INT NOT NULL);

CREATE TABLE sector(id_sector INT AUTO_INCREMENT PRIMARY KEY, nombre_comuna VARCHAR(20) NOT NULL, estado_sector int NOT NULL, id_comuna INT NOT NULL, FOREIGN KEY (id_comuna) REFERENCES comuna(id_comuna));

CREATE TABLE hogar(id_hogar INT AUTO_INCREMENT PRIMARY KEY, calle VARCHAR(20) NOT NULL, numeracion INT NOT NULL, fecha_creacion DATE NOT NULL, estado_hogar INT NOT NULL, id_sector INT NOT NULL, FOREIGN KEY (id_sector) REFERENCES sector(id_sector));

CREATE TABLE integrantes_Hogar(id_int_hogar INT AUTO_INCREMENT PRIMARY KEY, tipo_integrante INT NOT NULL, parentesco_integrante INT NOT NULL, fecha_registro DATE NOT NULL, estado_int_hogar INT NOT NULL, id_hogar INT NOT NULL, integrante VARCHAR(13) NOT NULL, FOREIGN KEY (id_hogar) REFERENCES hogar(id_hogar), FOREIGN KEY (integrante) REFERENCES usuario(run_integrante));

CREATE TABLE cargo_directivo(id_directiva INT AUTO_INCREMENT PRIMARY KEY, cargo INT NOT NULL, estado_cargo INT NOT NULL, fecha_inicio DATE NOT NULL, fecha_termino DATE NOT NULL, integrante VARCHAR(13) NOT NULL, FOREIGN KEY (integrante) REFERENCES usuario(run_integrante));

CREATE TABLE acta_reunion(id_acta INT AUTO_INCREMENT PRIMARY KEY, tipo_reunion INT NOT NULL, titulo_acta VARCHAR(20) NOT NULL, fecha_acta DATE NOT NULL, hora_acta TIME NOT NULL, id_directiva INT NOT NULL, FOREIGN KEY (id_directiva) REFERENCES cargo_directivo(id_directiva));

CREATE TABLE tipo_documento(id_tipo_documento INT AUTO_INCREMENT PRIMARY KEY, nombre_tipo_sol VARCHAR(20) NOT NULL, estado_tipo_sol INT NOT NULL);

CREATE TABLE documento_solicitado(
	id_doc_sol int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    run_integrante varchar(13) NOT NULL,
    tipo_documento int(11) NOT NULl,
    fecha_solicitud date NOT NULL,
    hora_solicitud time NOT NULL,
    fecha_entrega date NOT NULL,
    hora_entrega time NOT NULL,
    comentario_solicitud varchar(120),
    estado_solicitud int(11) NOT NULL,
    documento_folio varchar(20) NOT NULL,
    documento_nombre_retira varchar(20),
    
    FOREIGN KEY run_integrante REFERENCES usuario(run_integrante),
    FOREIGN KEY tipo_documento REFERENCES tipo_documento(id_tipo_documento)
);


CREATE TABLE noticia (
	id_noticia int(11) PRIMARY KEY AUTO_INCREMENT,
    integrante varchar(13) NOT NULL,
    titulo_noticia varchar(20) NOT NULL,
    tipo_noticia varchar(20) NOT NULL,
    fecha_noticia date NOT NULL,
    hora_noticia time NOT NULL,
    contenido_noticia varchar(120) NOT NULL,
    imagen blob,
    estado_noticia int(11),
    
    FOREIGN KEY (integrante) REFERENCES usuario(run_integrante)
);


CREATE TABLE observaciones(
	id_observacion int(11) PRIMARY KEY AUTO_INCREMENT,
    integrante varchar(13) NOT NULL,
    fecha_observacion date NOT NULL,
    hora_observacion time NOT NULL,
    comentario varchar(120),
    
    FOREIGN KEY (integrante) REFERENCES usuario(run_integrante)
);

CREATE TABLE ticket(
	id_ticket int(11) PRIMARY KEY AUTO_INCREMENT,
    integrante varchar(13) NOT NULL,
    observaciones int(11) NOT NULL,
    directiva int(11) NOT NULL,
    fecha_creacion date NOT NULL,
    hora_creacion time NOT NULL,
    motivo int(11) NOT NULL,
    estado_ticket int(11) NOT NULL,
    
    FOREIGN KEY (integrante) REFERENCES usuario(run_integrante),
    FOREIGN KEY (observaciones) REFERENCES observaciones(id_observacion)
);