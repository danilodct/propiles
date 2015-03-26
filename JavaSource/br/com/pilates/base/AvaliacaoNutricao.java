package br.com.pilates.base;

import br.com.pilates.util.SystemUtils;

public class AvaliacaoNutricao extends Avaliacao {

	private String pesoMax;
	private String pesoMin;
	private String pesoDesejado;
	private String imc;
	private String cintura;
	private String quadril;
	private String branco;
	private String biceps;
	private String triceps;
	private String subescapular;
	private String suprailiaca;
	private String antebraco;
	private String fletido;
	private String axilar;
	private String abdominal;
	private String coxa;
	private String peitoral;
	private String gordura;

	private String exercicio;
	private String frequenciaExercicio;
	private String horasSono;
	private String cansacoMomento;
	private String suplemento;
	private String alterouPeso;
	private String consumoCafe;
	private String consumoLanche1;
	private String consumoAlmoco;
	private String consumoLanche2;
	private String consumoJantar;
	private String consumoLanche3;
	private boolean fazTratamento;
	private boolean sonoTranquilo;
	private boolean achaCompulsivo;
	private boolean vontadeComerDoce;
	private boolean cansaco;
	private boolean intestinoPreso;

	public AvaliacaoNutricao() {
	}

	public String getPesoMax() {
		return pesoMax;
	}

	public void setPesoMax(String pesoMax) {
		this.pesoMax = pesoMax;
	}

	public String getPesoMin() {
		return pesoMin;
	}

	public void setPesoMin(String pesoMin) {
		this.pesoMin = pesoMin;
	}

	public String getPesoDesejado() {
		return pesoDesejado;
	}

	public void setPesoDesejado(String pesoDesejado) {
		this.pesoDesejado = pesoDesejado;
	}

	public String getImc() {
		return imc;
	}

	public void setImc(String imc) {
		this.imc = imc;
	}

	public String getCintura() {
		return cintura;
	}

	public void setCintura(String cintura) {
		this.cintura = cintura;
	}

	public String getQuadril() {
		return quadril;
	}

	public void setQuadril(String quadril) {
		this.quadril = quadril;
	}

	public String getBranco() {
		return branco;
	}

	public void setBranco(String branco) {
		this.branco = branco;
	}

	public String getBiceps() {
		return biceps;
	}

	public void setBiceps(String biceps) {
		this.biceps = biceps;
	}

	public String getTriceps() {
		return triceps;
	}

	public void setTriceps(String triceps) {
		this.triceps = triceps;
	}

	public String getSubescapular() {
		return subescapular;
	}

	public void setSubescapular(String subescapular) {
		this.subescapular = subescapular;
	}

	public String getSuprailiaca() {
		return suprailiaca;
	}

	public void setSuprailiaca(String suprailiaca) {
		this.suprailiaca = suprailiaca;
	}

	public String getAntebraco() {
		return antebraco;
	}

	public void setAntebraco(String antebraco) {
		this.antebraco = antebraco;
	}

	public String getFletido() {
		return fletido;
	}

	public void setFletido(String fletido) {
		this.fletido = fletido;
	}

	public String getAxilar() {
		return axilar;
	}

	public void setAxilar(String axilar) {
		this.axilar = axilar;
	}

	public String getAbdominal() {
		return abdominal;
	}

	public void setAbdominal(String abdominal) {
		this.abdominal = abdominal;
	}

	public String getCoxa() {
		return coxa;
	}

	public void setCoxa(String coxa) {
		this.coxa = coxa;
	}

	public String getPeitoral() {
		return peitoral;
	}

	public void setPeitoral(String peitoral) {
		this.peitoral = peitoral;
	}

	public String getGordura() {
		return gordura;
	}

	public void setGordura(String gordura) {
		this.gordura = gordura;
	}

	public String getExercicio() {
		return exercicio;
	}

	public void setExercicio(String exercicio) {
		this.exercicio = exercicio;
	}

	public String getFrequenciaExercicio() {
		return frequenciaExercicio;
	}

	public void setFrequenciaExercicio(String frequenciaExercicio) {
		this.frequenciaExercicio = frequenciaExercicio;
	}

	public String getHorasSono() {
		return horasSono;
	}

	public void setHorasSono(String horasSono) {
		this.horasSono = horasSono;
	}

	public boolean isFazTratamento() {
		return fazTratamento;
	}

	public void setFazTratamento(boolean fazTratamento) {
		this.fazTratamento = fazTratamento;
	}

	public boolean isFazTratamentoStr() {
		return fazTratamento;
	}

	public void setFazTratamentoStr(String fazTratamento) {
		this.fazTratamento = SystemUtils.parseStringBoolean(fazTratamento);
	}

	public boolean isSonoTranquilo() {
		return sonoTranquilo;
	}

	public void setSonoTranquilo(boolean sonoTranquilo) {
		this.sonoTranquilo = sonoTranquilo;
	}

	public boolean isSonoTranquiloStr() {
		return sonoTranquilo;
	}

	public void setSonoTranquiloStr(String sonoTranquilo) {
		this.sonoTranquilo = SystemUtils.parseStringBoolean(sonoTranquilo);
	}

	public boolean isAchaCompulsivo() {
		return achaCompulsivo;
	}

	public void setAchaCompulsivo(boolean achaCompulsivo) {
		this.achaCompulsivo = achaCompulsivo;
	}

	public boolean isAchaCompulsivoStr() {
		return achaCompulsivo;
	}

	public void setAchaCompulsivoStr(String achaCompulsivo) {
		this.achaCompulsivo = SystemUtils.parseStringBoolean(achaCompulsivo);
	}

	public boolean isVontadeComerDoce() {
		return vontadeComerDoce;
	}

	public void setVontadeComerDoce(boolean vontadeComerDoce) {
		this.vontadeComerDoce = vontadeComerDoce;
	}

	public boolean isVontadeComerDoceStr() {
		return vontadeComerDoce;
	}

	public void setVontadeComerDoceStr(String vontadeComerDoce) {
		this.vontadeComerDoce = SystemUtils.parseStringBoolean(vontadeComerDoce);
	}

	public boolean isCansaco() {
		return cansaco;
	}

	public void setCansaco(boolean cansaco) {
		this.cansaco = cansaco;
	}

	public boolean isCansacoStr() {
		return cansaco;
	}

	public void setCansacoStr(String cansaco) {
		this.cansaco = SystemUtils.parseStringBoolean(cansaco);
	}

	public String getCansacoMomento() {
		return cansacoMomento;
	}

	public void setCansacoMomento(String cansacoMomento) {
		this.cansacoMomento = cansacoMomento;
	}

	public String getSuplemento() {
		return suplemento;
	}

	public void setSuplemento(String suplemento) {
		this.suplemento = suplemento;
	}

	public String getAlterouPeso() {
		return alterouPeso;
	}

	public void setAlterouPeso(String alterouPeso) {
		this.alterouPeso = alterouPeso;
	}

	public boolean isIntestinoPreso() {
		return intestinoPreso;
	}

	public void setIntestinoPreso(boolean intestinoPreso) {
		this.intestinoPreso = intestinoPreso;
	}

	public boolean isIntestinoPresoStr() {
		return intestinoPreso;
	}

	public void setIntestinoPresoStr(String intestinoPreso) {
		this.intestinoPreso = SystemUtils.parseStringBoolean(intestinoPreso);
	}

	public String getConsumoCafe() {
		return consumoCafe;
	}

	public void setConsumoCafe(String consumoCafe) {
		this.consumoCafe = consumoCafe;
	}

	public String getConsumoLanche1() {
		return consumoLanche1;
	}

	public void setConsumoLanche1(String consumoLanche1) {
		this.consumoLanche1 = consumoLanche1;
	}

	public String getConsumoAlmoco() {
		return consumoAlmoco;
	}

	public void setConsumoAlmoco(String consumoAlmoco) {
		this.consumoAlmoco = consumoAlmoco;
	}

	public String getConsumoLanche2() {
		return consumoLanche2;
	}

	public void setConsumoLanche2(String consumoLanche2) {
		this.consumoLanche2 = consumoLanche2;
	}

	public String getConsumoJantar() {
		return consumoJantar;
	}

	public void setConsumoJantar(String consumoJantar) {
		this.consumoJantar = consumoJantar;
	}

	public String getConsumoLanche3() {
		return consumoLanche3;
	}

	public void setConsumoLanche3(String consumoLanche3) {
		this.consumoLanche3 = consumoLanche3;
	}

}
