package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Conny
 */
public class Data {

    private final Conexion con;
    private ResultSet rs;
    private String query;

    public Data() throws SQLException, ClassNotFoundException {

        con = new Conexion(
                "localhost",
                "redSocial",//nombre BD
                "root",
                "Nanika123"//Password
        );
    }

    public void crearUsuario(Usuario u) throws SQLException {

        query = "INSERT INTO usuario VALUES(null, "
                + "'" + u.getEmail() + "', "
                + "'" + u.getContrasenia() + "', "
                + "'" + u.getNombre() + "', "
                + "'" + u.getEdad() + "', "
                + "'" + u.getSexo() + "')";

        con.ejecutar(query);
    }

    public void crearPublicacion(Publicacion p) throws SQLException {

        query = "INSERT INTO publicaciones VALUES(null, NOW(), '" + p.getContenido() + "', '" + p.getUsuario() + "');";
        con.ejecutar(query);
    }

    public void crearPerfil(Perfil per) throws SQLException {

        query = "INSERT INTO perfil VALUES(null, "
                + "'" + per.getDescripcion() + "', "
                + "'" + per.getUsuario() + "')";
        con.ejecutar(query);
    }

    public void crearSeguidores(Seguidores s) throws SQLException {

        query = "INSERT INTO seguidores VALUES(null, "
                + "'" + s.getPerfilSeguido() + "', "
                + "'" + s.getPerfilSeguidor() + "')";
        con.ejecutar(query);
    }

    public Usuario getUsuario(String us, String contr) throws SQLException {

        query = "SELECT * FROM usuario WHERE email = '" + us + "' AND contrasenia = '" + contr + "'";
        rs = con.ejecutarSelect(query);

        Usuario u = null;

        if (rs.next()) {
            u = new Usuario();
            u.setId(rs.getInt(1));
            u.setEmail(rs.getString(2));
            u.setContrasenia(rs.getString(3));
            u.setNombre(rs.getString(4));
            u.setEdad(rs.getString(5));
            u.setSexo(rs.getInt(6));
        }
        con.close();
        return u;
    }

    public List<Publicacion> getPublicacionesSeguidos(int id) throws SQLException {
        query = "SELECT publicaciones.fecha, publicaciones.contenido FROM publicaciones, seguidores, usuario, perfil "
                + "WHERE seguidores.perfilseguido = perfil.id AND perfil.usuario = usuario.id AND seguidores.perfilseguidor = " + id;
        rs = con.ejecutarSelect(query);
        Publicacion p;
        List<Publicacion> lista = new ArrayList<>();

        while (rs.next()) {
            p = new Publicacion();
            p.setFecha(rs.getString(1));
            p.setContenido(rs.getString(2));

            lista.add(p);
        }
        return lista;
    }

    public List<Publicacion> getPublicaciones(int id) throws SQLException {

        query = "SELECT * FROM publicaciones WHERE usuario = " + id;
        rs = con.ejecutarSelect(query);

        Publicacion p;
        List<Publicacion> lista = new ArrayList<>();
        if (rs.next()) {
            p = new Publicacion();
            p.setId(rs.getInt(1));
            p.setFecha(rs.getString(2));
            p.setContenido(rs.getString(3));
            
            lista.add(p);
        }
        con.close();
        return lista;
    }

    public List<Usuario> buscarUsuario(String buscar) throws SQLException {

        query = "SELECT * FROM  usuario WHERE nombre like '%" + buscar + "%'";
        rs = con.ejecutarSelect(query);
        Usuario u;
        List<Usuario> lista = new ArrayList<>();
        while (rs.next()) {
            u = new Usuario();

            u.setId(rs.getInt(1));
            u.setEmail(rs.getString(2));
            u.setContrasenia(rs.getString(3));
            u.setNombre(rs.getString(4));
            u.setEdad(rs.getString(5));
            u.setSexo(rs.getInt(6));

            lista.add(u);
        }
        con.close();
        return lista;
    }

    public Usuario getUsuario(int id) throws SQLException {
        query = "SELECT * FROM usuario WHERE id = " + id;
        rs = con.ejecutarSelect(query);
        Usuario u = null;
        while (rs.next()) {
            u = new Usuario();

            u.setId(rs.getInt(1));
            u.setEmail(rs.getString(2));
            u.setContrasenia(rs.getString(3));
            u.setNombre(rs.getString(4));
            u.setEdad(rs.getString(5));
            u.setSexo(rs.getInt(6));
        }

        return u;
    }

    public int getCantSeguidores(int id) throws SQLException {

        query = "select count(seguidores.id) from seguidores, perfil where perfil.id = perfilSeguido"
                + " AND perfil.id = " + id;
        rs = con.ejecutarSelect(query);
        int s = 0;

        if (rs.next()) {
            s = rs.getInt(1);
        }
        con.close();
        return s;
    }

    public int getCantSeguidos(int id) throws SQLException {

        query = "select count(seguidores.id) from seguidores, perfil where perfil.id = perfilSeguidor"
                + " AND perfil.id = " + id;
        rs = con.ejecutarSelect(query);
        int s = 0;

        if (rs.next()) {
            s = rs.getInt(1);
        }
        con.close();
        return s;
    }

    
    public List<Sexo> getSexos() throws SQLException {

        query = "SELECT * FROM sexo ";
        rs = con.ejecutarSelect(query);

        Sexo s;
        List<Sexo> lista = new ArrayList<>();
        while (rs.next()) {
            s = new Sexo();

            s.setId(rs.getInt(1));
            s.setNombre(rs.getString(2));
            lista.add(s);
        }
        con.close();
        return lista;
    }

    public int getIdUsuario() throws SQLException {
        query = "SELECT MAX(id) FROM usuario";
        int ultId = 0;
        rs = con.ejecutarSelect(query);
        Usuario u;
        if (rs.next()) {
            u = new Usuario();
            u.setId(rs.getInt(1));
            ultId = u.getId();
        }
        con.close();
        return ultId;
    }

    public Perfil getPerfil(int idUs) throws SQLException {

        query = "SELECT * FROM perfil WHERE usuario = " + idUs;
        rs = con.ejecutarSelect(query);
        Perfil p = null;
        if (rs.next()) {
            p = new Perfil();
            p.setId(rs.getInt(1));
            p.setDescripcion(rs.getString(2));
            p.setUsuario(rs.getInt(3));
        }
        con.close();
        return p;
    }

    public void updateDescripcion(Perfil p) throws SQLException {

        query = "UPDATE perfil SET descripcion = '" + p.getDescripcion() + "' WHERE usuario = " + p.getUsuario();
        System.out.println("update data");
        con.ejecutar(query);
    }

    public String getMes(String mes) {
        //Obtiene el nº de mes según el nombre del mes :x
        switch (mes) {
            case "enero":
                mes = "1";
                break;
            case "febrero":
                mes = "2";
                break;
            case "marzo":
                mes = "3";
                break;
            case "abril":
                mes = "4";
                break;
            case "mayo":
                mes = "5";
                break;
            case "junio":
                mes = "6";
                break;
            case "julio":
                mes = "7";
                break;
            case "agosto":
                mes = "8";
                break;
            case "septiembre":
                mes = "9";
                break;
            case "octubre":
                mes = "10";
                break;
            case "noviembre":
                mes = "11";
                break;
            case "diciembre":
                mes = "12";
                break;
        }

        return mes;
    }

//    public boolean guardarImagen(String ruta, String nombre) {
//        String insert = "insert into Imagenes(imagen,nombre) values(?,?)";
//        FileInputStream fis = null;
//        PreparedStatement ps = null;
//        try {
//            
//            FileInputStream file = new FileInputStream(ruta);
//            fis = new FileInputStream(file);
//            ps = con.prepareStatement(insert);
//            ps.setBinaryStream(1, fis, (int) file.length());
//            ps.setString(2, nombre);
//            ps.executeUpdate();
//            conexion.commit();
//            return true;
//        } catch (Exception ex) {
//            Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            try {
//                ps.close();
//                fis.close();
//            } catch (Exception ex) {
//                Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        return false;
//    }
}
