package cl.model;

import java.util.ArrayList;

import javax.ejb.Local;

/**
 * 
 * @author patty
 *
 */
@Local
public interface ServicioLocal {
	void addCliente(Cliente cli);
	ArrayList<Cliente> getClientes();
	Cliente  buscarCliente(String rut);
	
	String elminar(String rut);
	void actualizar(Cliente cli);
	
}
