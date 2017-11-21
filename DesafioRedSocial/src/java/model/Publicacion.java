package model;

/**
 *
 * @author Conny
 */
public class Publicacion {
    private int id;
    private String fecha;
    private String contenido;
    private int perfi;

    public int getPerfi() {
        return perfi;
    }

    public void setPerfi(int perfi) {
        this.perfi = perfi;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
}
