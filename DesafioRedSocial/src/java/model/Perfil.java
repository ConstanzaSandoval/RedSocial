package model;

/**
 *
 * @author Conny
 */
public class Perfil {
    private int id;
    private String descripcion;
    private String foto;

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
    private int usuario;

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    

    public int getId() {
        return id;
    }

}
