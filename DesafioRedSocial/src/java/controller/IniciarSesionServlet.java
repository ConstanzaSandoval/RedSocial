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
import model.Seguidores;
import model.Usuario;

/**
 *
 * @author Conny
 */
@WebServlet(name = "IniciarSesionServlet", urlPatterns = {"/iniciarSesion.do"})
public class IniciarSesionServlet extends HttpServlet {

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
            Usuario u;

            String email = (request.getParameter("txtEmail"));
            String contrasenia = (request.getParameter("txtContrasenia"));

            u = d.getUsuario(email, contrasenia);
            out.write(u.getId());
            if (u == null) {
                System.out.println("no pasa");
                request.getSession().setAttribute("error", new Error("Usuario o Contraseña incorrectas"));
                response.sendRedirect("Index.jsp");
            } else {
                System.out.println("pasa");
                request.getSession().setAttribute("usuario", u);
                request.getSession().removeAttribute("error");
                
//                Seguidores s = new Seguidores();
//                s.setSeguido(u.getId());
//                s.setSeguidor(0);
//                
//                d.crearSeguidores(s);
                
                response.sendRedirect("Perfil.jsp");
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(IniciarSesionServlet.class.getName()).log(Level.SEVERE, null, ex);
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