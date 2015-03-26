package br.com.pilates.base;

public class AvaliacaoRPG extends Avaliacao {

	private String solicitacaoMedica;
	private String doenca;
	private String historicoDoenca;
	private String regiaoDor;
	private String atividadeFisica;
	private String examesComplementares;
	private String observacoes;
	private String cervical;
	private String dorso;
	private String lombar;
	private String quadril;
	private String joelhos;
	private String pes;
	private boolean elevados;
	private boolean enroladosVerticalmente;
	private boolean enroladosTransversalmente;
	private boolean abduzidos;
	private boolean flexionados;
	private boolean pronados;
	private boolean normal;
	private boolean horizontal;
	private String isquiosTibiais;
	private String gastrocnemios;
	private String soleo;
	private String pelveTrocanterianosGluteos;
	private String adutores;
	private String abbfFotoGeral;
	private String abbaFotoGeral;
	private String fcbfFotoGeral;
	private String fcbaFotoGeral;
	private String abbfInterrogatorio;
	private String abbaInterrogatorio;
	private String fcbfInterrogatorio;
	private String fcbaInterrogatorio;
	private String abbfExameLocal;
	private String abbaExameLocal;
	private String fcbfExameLocal;
	private String fcbaExameLocal;
	private String abbfReequilibracao;
	private String abbaReequilibracao;
	private String fcbfReequilibracao;
	private String fcbaReequilibracao;
	private String abbfResultado;
	private String abbaResultado;
	private String fcbfResultado;
	private String fcbaResultado;
	private String qtSessoes;

	public AvaliacaoRPG() {
	}

	public String getSolicitacaoMedica() {
		return solicitacaoMedica;
	}

	public void setSolicitacaoMedica(String solicitacaoMedica) {
		this.solicitacaoMedica = solicitacaoMedica;
	}

	public String getDoenca() {
		return doenca;
	}

	public void setDoenca(String doenca) {
		this.doenca = doenca;
	}

	public String getRegiaoDor() {
		return regiaoDor;
	}

	public void setRegiaoDor(String regiaoDor) {
		this.regiaoDor = regiaoDor;
	}

	public String getHistoricoDoenca() {
		return historicoDoenca;
	}

	public void setHistoricoDoenca(String historicoDoenca) {
		this.historicoDoenca = historicoDoenca;
	}

	public String getAtividadeFisica() {
		return atividadeFisica;
	}

	public void setAtividadeFisica(String atividadeFisica) {
		this.atividadeFisica = atividadeFisica;
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

	public String getQtSessoes() {
		return qtSessoes;
	}

	public void setQtSessoes(String qtSessoes) {
		this.qtSessoes = qtSessoes;
	}

	public String getCervical() {
		return cervical;
	}

	public void setCervical(String cervical) {
		this.cervical = cervical;
	}

	public String getDorso() {
		return dorso;
	}

	public void setDorso(String dorso) {
		this.dorso = dorso;
	}

	public String getLombar() {
		return lombar;
	}

	public void setLombar(String lombar) {
		this.lombar = lombar;
	}

	public String getQuadril() {
		return quadril;
	}

	public void setQuadril(String quadril) {
		this.quadril = quadril;
	}

	public String getJoelhos() {
		return joelhos;
	}

	public void setJoelhos(String joelhos) {
		this.joelhos = joelhos;
	}

	public String getPes() {
		return pes;
	}

	public void setPes(String pes) {
		this.pes = pes;
	}

	public boolean isElevados() {
		return elevados;
	}

	public void setElevados(boolean elevados) {
		this.elevados = elevados;
	}

	public boolean isEnroladosVerticalmente() {
		return enroladosVerticalmente;
	}

	public void setEnroladosVerticalmente(boolean enroladosVerticalmente) {
		this.enroladosVerticalmente = enroladosVerticalmente;
	}

	public boolean isEnroladosTransversalmente() {
		return enroladosTransversalmente;
	}

	public void setEnroladosTransversalmente(boolean enroladosTransversalmente) {
		this.enroladosTransversalmente = enroladosTransversalmente;
	}

	public boolean isAbduzidos() {
		return abduzidos;
	}

	public void setAbduzidos(boolean abduzidos) {
		this.abduzidos = abduzidos;
	}

	public boolean isFlexionados() {
		return flexionados;
	}

	public void setFlexionados(boolean flexionados) {
		this.flexionados = flexionados;
	}

	public boolean isPronados() {
		return pronados;
	}

	public void setPronados(boolean pronados) {
		this.pronados = pronados;
	}

	public boolean isNormal() {
		return normal;
	}

	public void setNormal(boolean normal) {
		this.normal = normal;
	}

	public boolean isHorizontal() {
		return horizontal;
	}

	public void setHorizontal(boolean horizontal) {
		this.horizontal = horizontal;
	}

	public String getAbbfFotoGeral() {
		return abbfFotoGeral;
	}

	public void setAbbfFotoGeral(String abbfFotoGeral) {
		this.abbfFotoGeral = abbfFotoGeral;
	}

	public String getAbbaFotoGeral() {
		return abbaFotoGeral;
	}

	public void setAbbaFotoGeral(String abbaFotoGeral) {
		this.abbaFotoGeral = abbaFotoGeral;
	}

	public String getFcbfFotoGeral() {
		return fcbfFotoGeral;
	}

	public void setFcbfFotoGeral(String fcbfFotoGeral) {
		this.fcbfFotoGeral = fcbfFotoGeral;
	}

	public String getFcbaFotoGeral() {
		return fcbaFotoGeral;
	}

	public void setFcbaFotoGeral(String fcbaFotoGeral) {
		this.fcbaFotoGeral = fcbaFotoGeral;
	}

	public String getAbbfInterrogatorio() {
		return abbfInterrogatorio;
	}

	public void setAbbfInterrogatorio(String abbfInterrogatorio) {
		this.abbfInterrogatorio = abbfInterrogatorio;
	}

	public String getAbbaInterrogatorio() {
		return abbaInterrogatorio;
	}

	public void setAbbaInterrogatorio(String abbaInterrogatorio) {
		this.abbaInterrogatorio = abbaInterrogatorio;
	}

	public String getFcbfInterrogatorio() {
		return fcbfInterrogatorio;
	}

	public void setFcbfInterrogatorio(String fcbfInterrogatorio) {
		this.fcbfInterrogatorio = fcbfInterrogatorio;
	}

	public String getFcbaInterrogatorio() {
		return fcbaInterrogatorio;
	}

	public void setFcbaInterrogatorio(String fcbaInterrogatorio) {
		this.fcbaInterrogatorio = fcbaInterrogatorio;
	}

	public String getAbbfExameLocal() {
		return abbfExameLocal;
	}

	public void setAbbfExameLocal(String abbfExameLocal) {
		this.abbfExameLocal = abbfExameLocal;
	}

	public String getAbbaExameLocal() {
		return abbaExameLocal;
	}

	public void setAbbaExameLocal(String abbaExameLocal) {
		this.abbaExameLocal = abbaExameLocal;
	}

	public String getFcbfExameLocal() {
		return fcbfExameLocal;
	}

	public void setFcbfExameLocal(String fcbfExameLocal) {
		this.fcbfExameLocal = fcbfExameLocal;
	}

	public String getFcbaExameLocal() {
		return fcbaExameLocal;
	}

	public void setFcbaExameLocal(String fcbaExameLocal) {
		this.fcbaExameLocal = fcbaExameLocal;
	}

	public String getAbbfReequilibracao() {
		return abbfReequilibracao;
	}

	public void setAbbfReequilibracao(String abbfReequilibracao) {
		this.abbfReequilibracao = abbfReequilibracao;
	}

	public String getAbbaReequilibracao() {
		return abbaReequilibracao;
	}

	public void setAbbaReequilibracao(String abbaReequilibracao) {
		this.abbaReequilibracao = abbaReequilibracao;
	}

	public String getFcbfReequilibracao() {
		return fcbfReequilibracao;
	}

	public void setFcbfReequilibracao(String fcbfReequilibracao) {
		this.fcbfReequilibracao = fcbfReequilibracao;
	}

	public String getFcbaReequilibracao() {
		return fcbaReequilibracao;
	}

	public void setFcbaReequilibracao(String fcbaReequilibracao) {
		this.fcbaReequilibracao = fcbaReequilibracao;
	}

	public String getAbbfResultado() {
		return abbfResultado;
	}

	public void setAbbfResultado(String abbfResultado) {
		this.abbfResultado = abbfResultado;
	}

	public String getAbbaResultado() {
		return abbaResultado;
	}

	public void setAbbaResultado(String abbaResultado) {
		this.abbaResultado = abbaResultado;
	}

	public String getFcbfResultado() {
		return fcbfResultado;
	}

	public void setFcbfResultado(String fcbfResultado) {
		this.fcbfResultado = fcbfResultado;
	}

	public String getFcbaResultado() {
		return fcbaResultado;
	}

	public void setFcbaResultado(String fcbaResultado) {
		this.fcbaResultado = fcbaResultado;
	}

	public String getIsquiosTibiais() {
		return isquiosTibiais;
	}

	public void setIsquiosTibiais(String isquiosTibiais) {
		this.isquiosTibiais = isquiosTibiais;
	}

	public String getGastrocnemios() {
		return gastrocnemios;
	}

	public void setGastrocnemios(String gastrocnemios) {
		this.gastrocnemios = gastrocnemios;
	}

	public String getSoleo() {
		return soleo;
	}

	public void setSoleo(String soleo) {
		this.soleo = soleo;
	}

	public String getPelveTrocanterianosGluteos() {
		return pelveTrocanterianosGluteos;
	}

	public void setPelveTrocanterianosGluteos(String pelveTrocanterianosGluteos) {
		this.pelveTrocanterianosGluteos = pelveTrocanterianosGluteos;
	}

	public String getAdutores() {
		return adutores;
	}

	public void setAdutores(String adutores) {
		this.adutores = adutores;
	}

}
