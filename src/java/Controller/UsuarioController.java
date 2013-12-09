/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.PersonalModel;
import Model.UsuarioModel;
import dao.to.PersonalTO;
import dao.to.UsuarioTO;

import java.io.IOException;
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

@WebServlet(name = "UsuarioController", urlPatterns = {"/UsuarioController"})
public class UsuarioController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String destino = null;
        HttpSession session = request.getSession(true);
        
        try {
            String correo = request.getParameter("correo");
            String clave = request.getParameter("clave");          
            
            
            
            UsuarioModel usuarioModel = new UsuarioModel();
            boolean existe = usuarioModel.verificarUsuario(correo, clave);
            
            if (existe) {
                //se le registra un correo de la empresa para que no se repitan los correo de los empleados
                UsuarioTO usuarioTO = usuarioModel.consultarPorCorreo(correo);                
                
                if(usuarioTO.getPrivalegio().equals("cliente")){ //si el usuario tiene un privilegio de cliente web
                    destino = "/view/main.jsp";
                } else if(usuarioTO.getPrivalegio().equals("personal")) { //si el usuario tiene un privilegio de personal
                    destino = "/view/personal/main.jsp";
                    
                    PersonalModel personalModel = new PersonalModel();
                    PersonalTO personalTO = personalModel.consultarPorUsuario(usuarioTO.getCodigo());
                    session.setAttribute("personalTO", personalTO);
                } else if(usuarioTO.getPrivalegio().equals("admin")){ //si el usuario tiene un privilegio de administrador
                    destino = "/view/admin/main.jsp";
                    
                    PersonalModel personalModel = new PersonalModel();
                    PersonalTO personalTO = personalModel.consultarPorUsuario(usuarioTO.getCodigo());
                    session.setAttribute("personalTO", personalTO);
                }
                
                session.setAttribute("usuarioTO", usuarioTO);                
                
            } else {
                request.setAttribute("mensaje", "Datos no son correctos.");
                destino = "/view/login.jsp";
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            destino = "/view/login.jsp";
        }
        RequestDispatcher rd = request.getRequestDispatcher(destino);
	rd.forward(request, response);
    } // fin processRequest

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
