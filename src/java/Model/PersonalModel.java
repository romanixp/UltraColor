/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dao.DAOFactory;
import dao.design.IPersonalDAO;
import dao.to.PersonalTO;
import java.util.ArrayList;


/**
 *
 * @author Sistemas
 */

public class PersonalModel {
    public ArrayList<PersonalTO> consultarPersonal(String campo,String valor) throws Exception{
        IPersonalDAO personalDAO = DAOFactory.getInstance().getPersonalDAO();
        return personalDAO.consultarPersonal(campo,valor);
    } // consultarPersonal   
    
    public PersonalTO consultarPorUsuario(String usuario) throws Exception{
        IPersonalDAO personalDAO = DAOFactory.getInstance().getPersonalDAO();
        return personalDAO.consultaPorUsuario(usuario);
    } // consultarPersonal 
    public void insertar(PersonalTO personal) throws Exception{
        IPersonalDAO personalDAO = DAOFactory.getInstance().getPersonalDAO();
        personalDAO.insertar(personal);
    }
    public void eliminar(String codigo) throws Exception{
        IPersonalDAO personalDAO = DAOFactory.getInstance().getPersonalDAO();
        personalDAO.eliminar(codigo);
    }
    public  void actualizar(PersonalTO personalTO) throws Exception{        
        IPersonalDAO personalDAO = DAOFactory.getInstance().getPersonalDAO();
        personalDAO.actualizar(personalTO);
    }
}
