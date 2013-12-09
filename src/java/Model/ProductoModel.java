/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dao.DAOFactory;
import dao.design.IProductoDAO;
import dao.to.ProductoTO;
import java.util.ArrayList;

/**
 *
 * @author Sistemas
 */
public class ProductoModel {
    
        public ArrayList<ProductoTO> consultarProducto(String campo,String valor) throws Exception{
        IProductoDAO productoDAO = DAOFactory.getInstance().getProductoDAO();
        return productoDAO.consultarProducto(campo,valor);
    } // consultarProducto   
    
    public void insertar(ProductoTO producto) throws Exception{
        IProductoDAO productoDAO = DAOFactory.getInstance().getProductoDAO();
        productoDAO.insertar(producto);
    }
    public void eliminar(String codigo) throws Exception{
        IProductoDAO productoDAO = DAOFactory.getInstance().getProductoDAO();
        productoDAO.eliminar(codigo);
    }
    public  void actualizar(ProductoTO productoTO) throws Exception{        
        IProductoDAO productoDAO = DAOFactory.getInstance().getProductoDAO();
        productoDAO.actualizar(productoTO);
    }
    
}
