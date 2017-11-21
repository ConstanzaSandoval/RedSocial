package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Data;
import model.Perfil;
import model.Usuario;

/**
 *
 * @author Conny
 */
@WebServlet(name = "CrearUsuario", urlPatterns = {"/crearUsuario.do"})
public class CrearUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Data d = new Data();
            
            String email = request.getParameter("txtCorreo");
            String contrasenia= request.getParameter("txtContrasenia");
            String nombre= request.getParameter("txtNombre");
            String fechaN = request.getParameter("txtFechaNacimineto");
            int sexo = Integer.parseInt(request.getParameter("selSexo"));
            System.out.println(email+contrasenia+nombre+fechaN);
            Usuario u = new Usuario();
            
            String[] vectFecha = fechaN.split(" de ");
                //d.getMes obtiene el número del mes
                String fechaNacimiento = vectFecha[2] + "-" + d.getMes(vectFecha[1].toLowerCase()) + "-" + vectFecha[0];

            
            
            u.setNombre(nombre);
            u.setEmail(email);
            u.setEdad(fechaNacimiento);
            u.setSexo(sexo);
            u.setContrasenia(contrasenia);
            
            d.crearUsuario(u);
            
            Perfil p = new Perfil();
            
            p.setDescripcion("Añadir una descripción");
            p.setUsuario(d.getIdUsuario());
            
            d.crearPerfil(p);
            
            response.sendRedirect("Index.jsp");
            
        } catch (SQLException ex) {
            Logger.getLogger(CrearUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CrearUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
