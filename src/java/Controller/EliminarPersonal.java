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
@WebServlet(name = "EliminarPersonal", urlPatterns = {"/EliminarPersonal"})
public class EliminarPersonal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String confirm = request.getParameter("confirm");

        String destino = "";
        String codigo = request.getParameter("codigo");

//        PrintWriter out = response.getWriter();
//        out.print(codigo);
//        out.print(confirm);
//        out.print("joder");

        PersonalModel personalModel = new PersonalModel();
        ArrayList<PersonalTO> personalTO = null;

        try {
            if (confirm.equals("si")) {
                //eliminar

                personalModel.eliminar(codigo);
                request.setAttribute("mensaje", "Se ha eliminado correctamente");
                destino = "/view/admin/gestion/gestionPersonal.jsp";


            } else if (confirm.equals("no")) {
                //busqueda                        
                personalTO = personalModel.consultarPersonal("CHR_PERSCODIGO", codigo);
                destino = "/view/admin/gestion/eliminarPersonal.jsp";
                request.setAttribute("personalTO", personalTO);

            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            destino = "/view/admin/gestion/eliminarPersonal.jsp";
        }

        // Salida

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
