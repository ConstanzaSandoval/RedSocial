/**
 * Author:  Conny
 * Created: 19-nov-2017
 */

DROP DATABASE redSocial;
CREATE DATABASE redSocial;
USE redSocial;

CREATE TABLE sexo (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(10),
    PRIMARY KEY(id)
);

INSERT INTO sexo VALUES(null, 'Mujer');
INSERT INTO sexo VALUES(null, 'Hombre');
INSERT INTO sexo VALUES(null, 'Otro');



CREATE TABLE usuario(
    id INT AUTO_INCREMENT,
    email VARCHAR(20),
    contrasenia VARCHAR(15),
    nombre VARCHAR(30),
    fechaNacimiento DATE,
    sexo INT,
    FOREIGN KEY (sexo) REFERENCES sexo(id),
    PRIMARY KEY(id)
);



CREATE TABLE perfil(
    id INT AUTO_INCREMENT,
    /*foto*/
    
    descripcion VARCHAR(300),
    usuario int,
    FOREIGN KEY (usuario) REFERENCES usuario(id),
    PRIMARY KEY(id)
); 

CREATE TABLE seguidores(
    id INT AUTO_INCREMENT,
    perfilSeguido int,
    perfilseguidor int,
    FOREIGN KEY (perfilSeguido) REFERENCES perfil(id),
    FOREIGN KEY (perfilseguidor) REFERENCES perfil(id),
    PRIMARY KEY(id)
);


CREATE TABLE publicaciones(
    id INT AUTO_INCREMENT,
    fecha DATETIME,
    contenido VARCHAR(1000),
    perfil int,
    FOREIGN KEY (perfil) REFERENCES perfil(id),
    PRIMARY KEY(id)
);
SELECT * FROM publicaciones WHERE perfil = 1
select count(seguidores.id) from seguidores, perfil where perfil.id = perfilSeguido and perfil.id =



show create table publicaciones;
show create table perfil