/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.PersonalModel;
import dao.to.PersonalTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sistemas
 */
@WebServlet(name = "ConsultarPersonal", urlPatterns = {"/ConsultarPersonal"})
public class ConsultarPersonal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //variables
        ArrayList<PersonalTO> personalTO = null;
        //ArrayList<String> mensajes = new ArrayList<String>();
        PersonalModel personalBusiness = new PersonalModel();
        String campo = request.getParameter("campo");
        String valor = request.getParameter("valor");
//        PrintWriter out = response.getWriter();
//        out.print(campo);
//        out.print(valor);
                
        //proceso
        try {
            //Dato
            if (campo.equals("DNI")){
                personalTO = personalBusiness.consultarPersonal("CHR_PERSDNI",valor);
            } else if (campo.equals("Nombre")){
                personalTO = personalBusiness.consultarPersonal("VCH_PERSNOMBRE",valor);
            } else if (campo.equals("Apellido")){
                personalTO = personalBusiness.consultarPersonal("VCH_PERSAPELLIDOS",valor);
            }
            
            request.setAttribute("personalTO", personalTO);
            request.setAttribute("tam", personalTO.size());
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
        }

        //Salida        
        RequestDispatcher rd = request.getRequestDispatcher("/view/admin/gestion/gestionPersonal.jsp");
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
