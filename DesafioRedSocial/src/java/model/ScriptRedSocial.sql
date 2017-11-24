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
    /*fotoPerfil BLOB, */
    descripcion VARCHAR(300),
    usuario int,
    FOREIGN KEY (usuario) REFERENCES usuario(id),
    PRIMARY KEY(id)
); 

CREATE TABLE seguidores(
    id INT AUTO_INCREMENT,
    perfilSeguido int,
    perfilseguidor int,
    FOREIGN KEY (perfilSeguido) REFERENCES usuario(id),
    FOREIGN KEY (perfilseguidor) REFERENCES usuario(id),
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


SELECT publicaciones.fecha, publicaciones.contenido 
FROM publicaciones
WHERE usuario = 3

SELECT publicaciones.fecha, publicaciones.contenido, usuario.nombre 
FROM publicaciones, seguidores, usuario 
WHERE seguidores.perfilSeguido = publicaciones.usuario AND seguidores.perfilSeguidor = 2

SELECT * FROM publicaciones WHERE usuario = 1
select count(seguidores.id) from seguidores, perfil where perfil.id = perfilSeguido and perfil.id = 1
select * from usuario WHERE email = 'conny@gmail.com' AND contrasenia = 12
select * from perfil where usuario = 1
select * from seguidores

  

select usuario.nombre from seguidores, perfil,usuario where perfil.id = perfilSeguido and perfil.id = 1
select usuario.nombre from seguidores, perfil,usuario where perfil.id = perfilSeguidor and perfil.id = 3

SELECT * FROM seguidores 
WHERE perfilSeguido = 1 
AND perfilSeguidor = 3

SELECT usuario.nombre FROM seguidores, usuario WHERE seguidores.perfilSeguido = usuario.id AND seguidores.perfilSeguidor = 3 

SELECT * FROM  usuario WHERE nombre like '%i%'
SELECT * FROM usuario WHERE id = 1
SELECT * FROM perfil WHERE usuario = 1