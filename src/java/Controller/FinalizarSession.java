/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.to.PersonalTO;
import dao.to.UsuarioTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sistemas
 */
@WebServlet(name = "FinalizarSession", urlPatterns = {"/FinalizarSession"})
public class FinalizarSession extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Datos
        String destino = "/view/main.jsp";
        HttpSession session = request.getSession(true);
        /*
        UsuarioTO usuarioTO = (UsuarioTO) session.getAttribute("usuarioTO");
        //Proceso
        //comprobamos quien se esta cerrando session
        if(usuarioTO.getPrivalegio().equals("cliente")){
            destino = "/view/main.jsp";
        } else if(usuarioTO.getPrivalegio().equals("personal")){
            destino = "/view/personal/main.jsp";
        } else if(usuarioTO.getPrivalegio().equals("admin")){
            destino = "/view/admin/main.jsp";
        }
        */
        session.invalidate();
        RequestDispatcher rd = request.getRequestDispatcher(destino);
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
