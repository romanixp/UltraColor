/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import dao.DAOFactory;
import dao.design.IPedidoCompraDAO;
import dao.to.PedidoCompraTO;
import java.util.ArrayList;

/**
 *
 * @author Sistemas
 */
public class PedidoCompraModel {

    //Lista de Pedido
    private ArrayList<PedidoCompraTO> lista = new ArrayList<PedidoCompraTO>();

    public void addProducto(PedidoCompraTO item) {
        lista.add(item);
    }

    public void delProducto(String codigo) throws Exception {

        ArrayList<PedidoCompraTO> nuevaLista = new ArrayList<PedidoCompraTO>();

        // recorre la lista de pedido y la copia en una nueva lista (ignarando cuando es igual a codigo a elimina)
        for (PedidoCompraTO listaPedido : lista) {
            if (listaPedido.getCodigo().equalsIgnoreCase(codigo)) {
                nuevaLista.add(listaPedido);
            }
        }
        lista = nuevaLista;
    }

    public ArrayList<PedidoCompraTO> getLista() {
        return lista;
    }

    public int size() {
        return lista.size();
    }
    
    
    
    /*******METODOS DE MANTENIMIENTO******/
    public ArrayList<PedidoCompraTO> consultarPedidoCompra(String campo, String valor) throws Exception {
        IPedidoCompraDAO pedidoCompraDAO = DAOFactory.getInstance().getPedidoCompraDAO();
        return pedidoCompraDAO.consultarPedidoCompra(campo, valor);
    } // consultarPedidoCompra       

    public void insertar(PedidoCompraTO pedidoCompra) throws Exception {
        IPedidoCompraDAO pedidoCompraDAO = DAOFactory.getInstance().getPedidoCompraDAO();
        pedidoCompraDAO.insertar(pedidoCompra);
    }

    public void eliminar(String codigo) throws Exception {
        IPedidoCompraDAO pedidoCompraDAO = DAOFactory.getInstance().getPedidoCompraDAO();
        pedidoCompraDAO.eliminar(codigo);
    }

    public void actualizar(PedidoCompraTO pedidoCompraTO) throws Exception {
        IPedidoCompraDAO pedidoCompraDAO = DAOFactory.getInstance().getPedidoCompraDAO();
        pedidoCompraDAO.actualizar(pedidoCompraTO);
    }
}
