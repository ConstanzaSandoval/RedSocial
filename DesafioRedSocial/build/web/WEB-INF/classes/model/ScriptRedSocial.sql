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
    usuario int,
    FOREIGN KEY (usuario) REFERENCES usuario(id),
    PRIMARY KEY(id)
);

SELECT publicaciones.fecha, publicaciones.contenido FROM publicaciones, seguidores, usuario, perfil 
WHERE seguidores.perfilseguido = perfil.id AND perfil.usuario = usuario.id AND seguidores.perfilseguidor = 

SELECT * FROM publicaciones WHERE usuario = 2
select count(seguidores.id) from seguidores, perfil where perfil.id = perfilSeguido and perfil.id = 1
select * from usuario
select * from perfil

SELECT * FROM  usuario WHERE nombre like '%pa%'
SELECT * FROM usuario WHERE id = 1
SELECT * FROM perfil WHERE usuario = 1