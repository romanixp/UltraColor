/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.PersonalModel;
import dao.to.PersonalTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet(name = "EditarPersonal", urlPatterns = {"/EditarPersonal"})
public class EditarPersonal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        String confirm = request.getParameter("confirm");

        String destino = "";
        String codigo = request.getParameter("codigo");

//        PrintWriter out = response.getWriter();
//        out.print(codigo);
//        out.print(confirm);
//        out.print("joder");

        PersonalModel personalModel = new PersonalModel();


        try {
            if (confirm.equals("Aceptar")) {
                //Datos
                
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                String dni = request.getParameter("dni");
                String fechaNacimiento = request.getParameter("fechaNacimiento");
                String direccion = request.getParameter("direccion");
                String celular = request.getParameter("celular");
                String rp = request.getParameter("rp");
                String correo = request.getParameter("correo");
                String observaciones = request.getParameter("observaciones");

                              
                PersonalTO personalTO = new PersonalTO();

                // Proceso
                personalTO.setCodigo(codigo);
                personalTO.setNombre(nombre);
                personalTO.setApellidos(apellidos);
                personalTO.setDni(dni);
                personalTO.setFechaNacimiento(Date.valueOf(fechaNacimiento));
                personalTO.setDireccion(direccion);
                personalTO.setCelular(celular);
                personalTO.setRp(rp);
                personalTO.setCorreo(correo);
                personalTO.setObservaciones(observaciones);

                personalModel.actualizar(personalTO);


                request.setAttribute("mensaje", "Se ha Actualizado correctamente");
                destino = "/view/admin/gestion/gestionPersonal.jsp";

            } else if (confirm.equals("no")) {
                //busqueda                        
                ArrayList<PersonalTO> personalTO = null;
                personalTO = personalModel.consultarPersonal("CHR_PERSCODIGO", codigo);
                destino = "/view/admin/gestion/editarPersonal.jsp";
                request.setAttribute("personalTO", personalTO);

            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            destino = "/view/admin/gestion/editarPersonal.jsp";
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
