package br.com.pilates.base;

public class AvaliacaoPilates extends Avaliacao {
	
	private boolean posterior;
	private boolean anterior;
	private boolean lateral;
	private boolean mmii;
	private boolean mmss;
	private boolean abdome;
	private boolean colunaForcaMuscular;
	private String musculaturaEncurtadaObs;
	private String pes;
	private String joelhos;
	private String pelve;
	private String coluna;
	private String ombrosClavicula;
	private String escapulas;
	private String cabeca;
	private String regiaoDor;
	private String doenca;
	private String historicoDoenca;
	private String atividadeFisica;
	private String solicitacaoMedica;
	private String examesComplementares;
	private String observacoes;
	private String indicouPilates;
	
	public AvaliacaoPilates() {}
	
	public boolean isMmii() {
		return mmii;
	}
	
	public void setMmii(boolean mmii) {
		this.mmii = mmii;
	}
	
	public boolean isMmss() {
		return mmss;
	}
	
	public void setMmss(boolean mmss) {
		this.mmss = mmss;
	}
	
	public boolean isAbdome() {
		return abdome;
	}
	
	public void setAbdome(boolean abdome) {
		this.abdome = abdome;
	}
	
	public boolean isColunaForcaMuscular() {
		return colunaForcaMuscular;
	}
	
	public void setColunaForcaMuscular(boolean colunaForcaMuscular) {
		this.colunaForcaMuscular = colunaForcaMuscular;
	}
	
	public boolean isPosterior() {
		return posterior;
	}
	
	public void setPosterior(boolean posterior) {
		this.posterior = posterior;
	}
	
	public boolean isAnterior() {
		return anterior;
	}
	
	public void setAnterior(boolean anterior) {
		this.anterior = anterior;
	}
	
	public boolean isLateral() {
		return lateral;
	}
	
	public void setLateral(boolean lateral) {
		this.lateral = lateral;
	}
	
	public String getMusculaturaEncurtadaObs() {
		return musculaturaEncurtadaObs;
	}
	
	public void setMusculaturaEncurtadaObs(String musculaturaEncurtadaObs) {
		this.musculaturaEncurtadaObs = musculaturaEncurtadaObs;
	}
	
	public String getPes() {
		return pes;
	}
	
	public void setPes(String pes) {
		this.pes = pes;
	}
	
	public String getJoelhos() {
		return joelhos;
	}
	
	public void setJoelhos(String joelhos) {
		this.joelhos = joelhos;
	}
	
	public String getPelve() {
		return pelve;
	}
	
	public void setPelve(String pelve) {
		this.pelve = pelve;
	}
	
	public String getColuna() {
		return coluna;
	}
	
	public void setColuna(String coluna) {
		this.coluna = coluna;
	}
	
	public String getOmbrosClavicula() {
		return ombrosClavicula;
	}
	
	public void setOmbrosClavicula(String ombrosClavicula) {
		this.ombrosClavicula = ombrosClavicula;
	}
	
	public String getEscapulas() {
		return escapulas;
	}
	
	public void setEscapulas(String escapulas) {
		this.escapulas = escapulas;
	}
	
	public String getCabeca() {
		return cabeca;
	}
	
	public void setCabeca(String cabeca) {
		this.cabeca = cabeca;
	}
	
	public String getRegiaoDor() {
		return regiaoDor;
	}
	
	public void setRegiaoDor(String regiaoDor) {
		this.regiaoDor = regiaoDor;
	}
	
	public String getDoenca() {
		return doenca;
	}
	
	public void setDoenca(String doenca) {
		this.doenca = doenca;
	}
	
	public String getHistoricoDoenca() {
		return historicoDoenca;
	}
	
	public void setHistoricoDoenca(String historicoDoenca) {
		this.historicoDoenca = historicoDoenca;
	}
	
	public String getSolicitacaoMedica() {
		return solicitacaoMedica;
	}
	
	public void setSolicitacaoMedica(String solicitacaoMedica) {
		this.solicitacaoMedica = solicitacaoMedica;
	}
	
	public String getExamesComplementares() {
		return examesComplementares;
	}
	
	public void setExamesComplementares(String examesComplementares) {
		this.examesComplementares = examesComplementares;
	}
	
	public String getObservacoes() {
		return observacoes;
	}
	
	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}
	
	public String getIndicouPilates() {
		return indicouPilates;
	}
	
	public void setIndicouPilates(String indicouPilates) {
		this.indicouPilates = indicouPilates;
	}
	
	public String getAtividadeFisica() {
		return atividadeFisica;
	}
	
	public void setAtividadeFisica(String atividadeFisica) {
		this.atividadeFisica = atividadeFisica;
	}
	
}
