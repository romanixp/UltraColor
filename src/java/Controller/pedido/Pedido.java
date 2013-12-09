/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.pedido;

import Model.PersonalModel;
import Model.ProductoModel;
import Model.ProveedorModel;
import Model.UsuarioModel;
import dao.to.PersonalTO;
import dao.to.ProductoTO;
import dao.to.ProveedorTO;
import dao.to.UsuarioTO;



import java.io.IOException;
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
@WebServlet(name = "Pedido", urlPatterns = {"/Pedido"})
public class Pedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Datos
        String destino = "view/admin/pedidos/pedidos.jsp";        

        ProveedorModel proveedorModel = new ProveedorModel();
        ProductoModel productoModel = new ProductoModel();
        
        //Proceso
        try {            
            ArrayList<ProveedorTO> proveedorTO = proveedorModel.consultarProveedor("CHR_PROVCODIGO", "");
            ArrayList<ProductoTO> productoTO = productoModel.consultarProducto("CHR_PRODCODIGO", "");            
            
            request.setAttribute("proveedorTO", proveedorTO);
            request.setAttribute("productoTO", productoTO);          
            
            request.setAttribute("mensaje", "Datos no son correctos.");
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
        }
        //enviar
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
