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
import model.Usuario;

/**
 *
 * @author Conny
 */
@WebServlet(name = "BuscarServlet", urlPatterns = {"/buscar.do"})
public class BuscarServlet extends HttpServlet {

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
            String filtro = request.getParameter("filtro");
            Data d = new Data();

            Usuario u = (Usuario) request.getSession().getAttribute("usuario");
            if (u != null) {
                out.println("<form action='cerrarSesion.do'>" +
                            "<input type='submit' value='Cerrar sesión'/>" +
                            "</form>");
                out.println("<h1><a href='Perfil.jsp'>" + u.getNombre() + " </a></h1>");
                for (Usuario usu : d.buscarUsuario(filtro)) {
                    out.println("- <a href='PerfilBuscar.jsp?id=" + usu.getId() + "'>" + usu.getNombre() + "</a> ");
                    
                    out.print("<form action='seguidores.do' method='post'> "
                            + "<input type='hidden' name='txtIdSeguido' value='" + usu.getId() + "' /> "
                            + "<input type='hidden' name='txtIdSeguidor' value='" + u.getId() + "' /> "
                            + "<input type='submit' name='btnSeguir' value='Seguir' />"
                            + "</form>");
                }
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(BuscarServlet.class.getName()).log(Level.SEVERE, null, ex);
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
