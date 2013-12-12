/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.pedido;

import Model.PedidoCompraModel;
import Model.ProductoModel;
import Model.ProveedorModel;
import dao.to.PedidoCompraTO;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sistemas
 */
@WebServlet(name = "Pedido", urlPatterns = {"/Pedido"})
public class Pedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Datos
        HttpSession session = request.getSession(true);
        String destino = "view/admin/pedidos/pedidos.jsp";


        String campo = request.getParameter("campo");
        String valor = request.getParameter("valor");



        ProveedorModel proveedorModel = new ProveedorModel();
        ProductoModel productoModel = new ProductoModel();


        ArrayList<ProveedorTO> proveedorTO = null;
        ArrayList<ProductoTO> productoTO = null;
        //Para agregar pedidos a la canasta
        String add = request.getParameter("add");
        PedidoCompraModel canasta = null;
        PedidoCompraTO item = new PedidoCompraTO();

        //Proceso
        try {
            //para realizar una busqueda de productos
            if (campo != null) {
                if (campo.equals("Nombre")) {
                    productoTO = productoModel.consultarProducto("VCH_PRODNOMBRE", valor);
                } else if (campo.equals("Marca")) {
                    productoTO = productoModel.consultarProducto("VCH_PRODMARCA", valor);
                } else if (campo.equals("Codigo")) {
                    productoTO = productoModel.consultarProducto("CHR_PRODCODIGO", valor);
                }
            }

            //para agregar o quitar producto a la canasta            
            if (add != null) {
                
                String codigoProd = request.getParameter("codigo");
                
               // request.setAttribute("mensaje", "add es != null, add vale="+ add );
                
                if (add.equals("Agregar")) {  //Agregar productos
                    //si la canasta esta vacia
                    if (session.getAttribute("canasta") == null) {
                        //creo una canasta
                        canasta = new PedidoCompraModel();
                    } else { //si tiene elementos
                        //recupero la canasta de la session 
                        canasta = (PedidoCompraModel) session.getAttribute("canasta");
                    }
                    //El codigo me sirve solo para la lista temporal
                    //Cuando inserto en la compra no va con este codigo

                    UsuarioTO usuarioTO = (UsuarioTO) session.getAttribute("usuarioTO");
                    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                    String unidad = request.getParameter("unidad");
                    
                    // Seteamos a los campos de la lista
                    item.setCodigo( String.valueOf(canasta.size() + 1));
                    item.setProdCodigo(codigoProd);
                    item.setUnidad(unidad);
                    item.setCantidad(cantidad);                    
                    canasta.addProducto(item);
                    
                    request.setAttribute("mensaje", "el codigo es"+ item.getCodigo());

                    //producto = productoModel.consultarProducto("CHR_PRODCODIGO", codigo);
//                    for (ProductoTO prod : producto) {
//                        canasta.addProducto(prod);
//                    }                    
                } else if (add.equals("no")) { //Quitar Productos                   
                    canasta = (PedidoCompraModel) session.getAttribute("canasta");
                    canasta.delProducto(codigoProd);
                }
                //request.setAttribute("mensaje", "termino de agregar");
                session.setAttribute("canasta", canasta);
            }
            

            proveedorTO = proveedorModel.consultarProveedor("CHR_PROVCODIGO", "");

            request.setAttribute("productoTO", productoTO);
            request.setAttribute("proveedorTO", proveedorTO);


            //request.setAttribute("mensaje", "Datos no son correctos.");
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
