/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dao.DAOFactory;
import dao.design.IProveedorDAO;
import dao.to.ProveedorTO;
import java.util.ArrayList;

/**
 *
 * @author Sistemas
 */
public class ProveedorModel {
        public ArrayList<ProveedorTO> consultarProveedor(String campo,String valor) throws Exception{
        IProveedorDAO proveedorDAO = DAOFactory.getInstance().getProveedorDAO();
        return proveedorDAO.consultarProveedor(campo,valor);
    } // consultarProveedor   
    
    public void insertar(ProveedorTO proveedor) throws Exception{
        IProveedorDAO proveedorDAO = DAOFactory.getInstance().getProveedorDAO();
        proveedorDAO.insertar(proveedor);
    }
    public void eliminar(String codigo) throws Exception{
        IProveedorDAO proveedorDAO = DAOFactory.getInstance().getProveedorDAO();
        proveedorDAO.eliminar(codigo);
    }
    public  void actualizar(ProveedorTO proveedorTO) throws Exception{        
        IProveedorDAO proveedorDAO = DAOFactory.getInstance().getProveedorDAO();
        proveedorDAO.actualizar(proveedorTO);
    }
}
