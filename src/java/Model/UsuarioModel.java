/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dao.DAOFactory;

import dao.design.IUsuarioDAO;

import dao.to.UsuarioTO;
import java.util.ArrayList;

/**
 *
 * @author Sistemas
 */
public class UsuarioModel {

    public boolean verificarUsuario(String correo, String clave) throws Exception {
        IUsuarioDAO usuarioDAO = DAOFactory.getInstance().getUsuarioDAO();
        UsuarioTO usuarioTO = usuarioDAO.consultarPorCorreo(correo);

        if (usuarioTO == null) { //SI EL USUARIO NO EXISTE - termina
            return false;
        }
        boolean rpta = false;
        if (usuarioTO.getClave().equals(clave)) {
            rpta = true;
        }
        return rpta;
    }

    public ArrayList<UsuarioTO> consultarUsuario(String campo, String valor) throws Exception {
        IUsuarioDAO usuarioDAO = DAOFactory.getInstance().getUsuarioDAO();
        return usuarioDAO.consultarUsuario(campo, valor);
    } // consultarUsuario     

    public UsuarioTO consultarPorCorreo(String correo) throws Exception {
        IUsuarioDAO usuarioDAO = DAOFactory.getInstance().getUsuarioDAO();
        UsuarioTO usuarioTO = usuarioDAO.consultarPorCorreo(correo);
        return usuarioTO;
    }
}
