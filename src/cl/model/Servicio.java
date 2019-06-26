package cl.model;

import java.util.ArrayList;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;

/**
 * Session Bean implementation class Servicio
 */
@Singleton
@LocalBean
public class Servicio implements ServicioLocal {
	
private ArrayList<Cliente> lista= new ArrayList();
    /**
     * Default constructor. 
     */
    public Servicio() {
    	lista.add(new Cliente( "juan","perez","111111-1"));
    	lista.add(new Cliente( "Diego","perez","2222222-2"));
    	
        // TODO Auto-generated constructor stub
    }

	@Override
	public void addCliente(Cliente cli) {
		lista.add(cli);
		
		// TODO Auto-generated method stub
		
	}

	@Override
	public Cliente  buscarCliente(String rut) {
		for (Cliente cliente:lista){
			if (cliente.getRut().equals(rut))
				return cliente;
			
				
		}
		return null;
	}
		// TODO Auto-generated method stub
		
	
	


	@Override
	public String elminar(String rut) {
		// TODO Auto-generated method stub
		Cliente cli = buscarCliente(rut);
		if (cli ==null) {
			return "cliente no encontrado";
		}
		else{
			lista.remove(cli);
			return "cliente eliminado";
		}

	}

	

	@Override
	public void actualizar(Cliente cli) {
		Cliente cliente = buscarCliente(cli.getRut());
		lista.remove(cliente);
		
		lista.add(cli);
		
	}

	@Override
	public ArrayList<Cliente> getClientes() {
		// TODO Auto-generated method stub
		return lista;
	}

	

}
