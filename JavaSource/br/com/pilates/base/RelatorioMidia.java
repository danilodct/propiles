package br.com.pilates.base;

public class RelatorioMidia extends ObjetoBasico {
	
	private String midia;
	private int quantidade;
	private double porcentagem;
	
	public RelatorioMidia() {}
	
	public String getMidia() {
		return midia;
	}
	
	public void setMidia(String midia) {
		this.midia = midia;
	}
	
	public int getQuantidade() {
		return quantidade;
	}
	
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	
	public double getPorcentagem() {
		return porcentagem;
	}
	
	public void setPorcentagem(double porcentagem) {
		this.porcentagem = porcentagem;
	}
	
}
