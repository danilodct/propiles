package br.com.pilates.fachada;

import java.util.Collection;

import br.com.pilates.base.Cliente;
import br.com.pilates.control.ControlCliente;
import br.com.pilates.control.impl.ControlClienteImpl;

public class FachadaCliente {
	
	private static FachadaCliente instance;
	
	private ControlCliente controlCliente;
	
	private FachadaCliente() {
		this.controlCliente = new ControlClienteImpl();
	}
	
	public static FachadaCliente getInstance() {
		if (instance == null) {
			instance = new FachadaCliente();
		}
		return instance;
	}
	
	public Collection<Cliente> getPoucosClientes() {
		return this.controlCliente.getAllClientes();
	}
	
	public void inserirCliente(Cliente cliente) {
		this.controlCliente.inserirCliente(cliente);
	}
	
	public boolean isCPFDisponivel(String cpf) {
		return this.controlCliente.isCPFDisponivel(cpf);
	}
	
	public Cliente lerCliente(Cliente cliente) {
		return this.controlCliente.lerCliente(cliente);
	}
	
	public void editarCliente(Cliente cliente) {
		this.controlCliente.editarCliente(cliente);
	}
	
	public void removerCliente(Cliente cliente) {
		this.controlCliente.removerCliente(cliente);
	}
	
	public Collection<Cliente> pesquisarClientes(String pesquisa, String param) {
		return this.controlCliente.pesquisarClientes(pesquisa, param);
	}
	
	public Cliente getClienteByCPF(String cpf) {
		return this.controlCliente.getClienteByCPF(cpf);
	}
	
	public Collection<Cliente> getProximosAniversariantes() {
		return this.controlCliente.getProximosAniversariantes();
	}
	
}
