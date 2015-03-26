package br.com.pilates.base;

public class AvaliacaoEstetica extends Avaliacao {

	// ESTADO GERAL
	private boolean celulite;
	private boolean gorduraLocalizada;
	private boolean flacidez;
	private boolean estresse;
	private boolean cravos;
	private String outrosMotivos;
	private String jaFezAlgumTratamento;
	private String quaisResultados;
	private boolean pesoModificou;
	private boolean prisaoVentre;
	private boolean retencaoLiquidos;
	private boolean dificuldadeUrinar;
	private String alergia;
	// HABITOS DE VIDA
	private String atividadeFisica;
	private String sono;
	private String estadoEmocional;
	private String cuidadoFacial;
	private String cuidadoCorporal;
	// NUTRICAO
	private String alimentacao;
	private String quantidade;
	private String qtRefeicoes;
	private String dieta;
	private String nutricionista;
	private boolean obesidade;
	// DOENCAS
	private boolean cancer;
	private boolean marcapasso;
	private boolean hernia;
	private boolean protese;
	private boolean queloide;
	private boolean hemofilia;
	private boolean varizes;
	private boolean reumatica;
	private boolean alergiaCalor;
	private boolean ovario;
	private boolean dermatite;
	private boolean gastrite;
	private boolean ulcera;
	private boolean fragilidade;
	private boolean alergiaFrio;
	private boolean infeccionsa;
	private boolean diabetes;
	// INTERVENCOES CIRURGICAS
	private boolean rinoplastia;
	private boolean lifting;
	private boolean rejuvenescimento;
	private boolean mastectomia;
	private boolean abdominoplastia;
	private boolean lipoescultura;
	private boolean botox;
	private boolean mamoplastiaReducao;
	private boolean mentoplastia;
	private boolean siliconeSeio;
	private boolean microcirurgia;
	private boolean blefaroplastia;
	private boolean mamoplastiaAumento;
	private boolean lipoaspiracao;
	private boolean siliconeBumbum;
	// PELE
	private String cor;
	private String qualidade;
	private String lesoes;
	private String acne;
	private String tratamento;

	public AvaliacaoEstetica() {
	}

	public boolean isCelulite() {
		return celulite;
	}

	public void setCelulite(boolean celulite) {
		this.celulite = celulite;
	}

	public boolean isGorduraLocalizada() {
		return gorduraLocalizada;
	}

	public void setGorduraLocalizada(boolean gorduraLocalizada) {
		this.gorduraLocalizada = gorduraLocalizada;
	}

	public boolean isFlacidez() {
		return flacidez;
	}

	public void setFlacidez(boolean flacidez) {
		this.flacidez = flacidez;
	}

	public boolean isEstresse() {
		return estresse;
	}

	public void setEstresse(boolean estresse) {
		this.estresse = estresse;
	}

	public boolean isCravos() {
		return cravos;
	}

	public void setCravos(boolean cravos) {
		this.cravos = cravos;
	}

	public String getOutrosMotivos() {
		return outrosMotivos;
	}

	public void setOutrosMotivos(String outrosMotivos) {
		this.outrosMotivos = outrosMotivos;
	}

	public String getJaFezAlgumTratamento() {
		return jaFezAlgumTratamento;
	}

	public void setJaFezAlgumTratamento(String jaFezAlgumTratamento) {
		this.jaFezAlgumTratamento = jaFezAlgumTratamento;
	}

	public String getQuaisResultados() {
		return quaisResultados;
	}

	public void setQuaisResultados(String quaisResultados) {
		this.quaisResultados = quaisResultados;
	}

	public boolean isPesoModificou() {
		return pesoModificou;
	}

	public void setPesoModificou(boolean pesoModificou) {
		this.pesoModificou = pesoModificou;
	}

	public boolean isPrisaoVentre() {
		return prisaoVentre;
	}

	public void setPrisaoVentre(boolean prisaoVentre) {
		this.prisaoVentre = prisaoVentre;
	}

	public boolean isRetencaoLiquidos() {
		return retencaoLiquidos;
	}

	public void setRetencaoLiquidos(boolean retencaoLiquidos) {
		this.retencaoLiquidos = retencaoLiquidos;
	}

	public boolean isDificuldadeUrinar() {
		return dificuldadeUrinar;
	}

	public void setDificuldadeUrinar(boolean dificuldadeUrinar) {
		this.dificuldadeUrinar = dificuldadeUrinar;
	}

	public String getAlergia() {
		return alergia;
	}

	public void setAlergia(String alergia) {
		this.alergia = alergia;
	}

	public String getAtividadeFisica() {
		return atividadeFisica;
	}

	public void setAtividadeFisica(String atividadeFisica) {
		this.atividadeFisica = atividadeFisica;
	}

	public String getSono() {
		return sono;
	}

	public void setSono(String sono) {
		this.sono = sono;
	}

	public String getEstadoEmocional() {
		return estadoEmocional;
	}

	public void setEstadoEmocional(String estadoEmocional) {
		this.estadoEmocional = estadoEmocional;
	}

	public String getCuidadoFacial() {
		return cuidadoFacial;
	}

	public void setCuidadoFacial(String cuidadoFacial) {
		this.cuidadoFacial = cuidadoFacial;
	}

	public String getCuidadoCorporal() {
		return cuidadoCorporal;
	}

	public void setCuidadoCorporal(String cuidadoCorporal) {
		this.cuidadoCorporal = cuidadoCorporal;
	}

	public String getAlimentacao() {
		return alimentacao;
	}

	public void setAlimentacao(String alimentacao) {
		this.alimentacao = alimentacao;
	}

	public String getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
	}

	public String getQtRefeicoes() {
		return qtRefeicoes;
	}

	public void setQtRefeicoes(String qtRefeicoes) {
		this.qtRefeicoes = qtRefeicoes;
	}

	public String getDieta() {
		return dieta;
	}

	public void setDieta(String dieta) {
		this.dieta = dieta;
	}

	public String isNutricionista() {
		return nutricionista;
	}

	public void setNutricionista(String nutricionista) {
		this.nutricionista = nutricionista;
	}

	public boolean isObesidade() {
		return obesidade;
	}

	public void setObesidade(boolean obesidade) {
		this.obesidade = obesidade;
	}

	public boolean isCancer() {
		return cancer;
	}

	public void setCancer(boolean cancer) {
		this.cancer = cancer;
	}

	public boolean isMarcapasso() {
		return marcapasso;
	}

	public void setMarcapasso(boolean marcapasso) {
		this.marcapasso = marcapasso;
	}

	public boolean isHernia() {
		return hernia;
	}

	public void setHernia(boolean hernia) {
		this.hernia = hernia;
	}

	public boolean isProtese() {
		return protese;
	}

	public void setProtese(boolean protese) {
		this.protese = protese;
	}

	public boolean isQueloide() {
		return queloide;
	}

	public void setQueloide(boolean queloide) {
		this.queloide = queloide;
	}

	public boolean isHemofilia() {
		return hemofilia;
	}

	public void setHemofilia(boolean hemofilia) {
		this.hemofilia = hemofilia;
	}

	public boolean isVarizes() {
		return varizes;
	}

	public void setVarizes(boolean varizes) {
		this.varizes = varizes;
	}

	public boolean isReumatica() {
		return reumatica;
	}

	public void setReumatica(boolean reumatica) {
		this.reumatica = reumatica;
	}

	public boolean isAlergiaCalor() {
		return alergiaCalor;
	}

	public void setAlergiaCalor(boolean alergiaCalor) {
		this.alergiaCalor = alergiaCalor;
	}

	public boolean isOvario() {
		return ovario;
	}

	public void setOvario(boolean ovario) {
		this.ovario = ovario;
	}

	public boolean isDermatite() {
		return dermatite;
	}

	public void setDermatite(boolean dermatite) {
		this.dermatite = dermatite;
	}

	public boolean isGastrite() {
		return gastrite;
	}

	public void setGastrite(boolean gastrite) {
		this.gastrite = gastrite;
	}

	public boolean isUlcera() {
		return ulcera;
	}

	public void setUlcera(boolean ulcera) {
		this.ulcera = ulcera;
	}

	public boolean isFragilidade() {
		return fragilidade;
	}

	public void setFragilidade(boolean fragilidade) {
		this.fragilidade = fragilidade;
	}

	public boolean isAlergiaFrio() {
		return alergiaFrio;
	}

	public void setAlergiaFrio(boolean alergiaFrio) {
		this.alergiaFrio = alergiaFrio;
	}

	public boolean isInfeccionsa() {
		return infeccionsa;
	}

	public void setInfeccionsa(boolean infeccionsa) {
		this.infeccionsa = infeccionsa;
	}

	public boolean isDiabetes() {
		return diabetes;
	}

	public void setDiabetes(boolean diabetes) {
		this.diabetes = diabetes;
	}

	public boolean isRinoplastia() {
		return rinoplastia;
	}

	public void setRinoplastia(boolean rinoplastia) {
		this.rinoplastia = rinoplastia;
	}

	public boolean isLifting() {
		return lifting;
	}

	public void setLifting(boolean lifting) {
		this.lifting = lifting;
	}

	public boolean isRejuvenescimento() {
		return rejuvenescimento;
	}

	public void setRejuvenescimento(boolean rejuvenescimento) {
		this.rejuvenescimento = rejuvenescimento;
	}

	public boolean isMastectomia() {
		return mastectomia;
	}

	public void setMastectomia(boolean mastectomia) {
		this.mastectomia = mastectomia;
	}

	public boolean isAbdominoplastia() {
		return abdominoplastia;
	}

	public void setAbdominoplastia(boolean abdominoplastia) {
		this.abdominoplastia = abdominoplastia;
	}

	public boolean isLipoescultura() {
		return lipoescultura;
	}

	public void setLipoescultura(boolean lipoescultura) {
		this.lipoescultura = lipoescultura;
	}

	public boolean isBotox() {
		return botox;
	}

	public void setBotox(boolean botox) {
		this.botox = botox;
	}

	public boolean isMamoplastiaReducao() {
		return mamoplastiaReducao;
	}

	public void setMamoplastiaReducao(boolean mamoplastiaReducao) {
		this.mamoplastiaReducao = mamoplastiaReducao;
	}

	public boolean isMentoplastia() {
		return mentoplastia;
	}

	public void setMentoplastia(boolean mentoplastia) {
		this.mentoplastia = mentoplastia;
	}

	public boolean isSiliconeSeio() {
		return siliconeSeio;
	}

	public void setSiliconeSeio(boolean siliconeSeio) {
		this.siliconeSeio = siliconeSeio;
	}

	public boolean isMicrocirurgia() {
		return microcirurgia;
	}

	public void setMicrocirurgia(boolean microcirurgia) {
		this.microcirurgia = microcirurgia;
	}

	public boolean isBlefaroplastia() {
		return blefaroplastia;
	}

	public void setBlefaroplastia(boolean blefaroplastia) {
		this.blefaroplastia = blefaroplastia;
	}

	public boolean isMamoplastiaAumento() {
		return mamoplastiaAumento;
	}

	public void setMamoplastiaAumento(boolean mamoplastiaAumento) {
		this.mamoplastiaAumento = mamoplastiaAumento;
	}

	public boolean isLipoaspiracao() {
		return lipoaspiracao;
	}

	public void setLipoaspiracao(boolean lipoaspiracao) {
		this.lipoaspiracao = lipoaspiracao;
	}

	public boolean isSiliconeBumbum() {
		return siliconeBumbum;
	}

	public void setSiliconeBumbum(boolean siliconeBumbum) {
		this.siliconeBumbum = siliconeBumbum;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public String getQualidade() {
		return qualidade;
	}

	public void setQualidade(String qualidade) {
		this.qualidade = qualidade;
	}

	public String getLesoes() {
		return lesoes;
	}

	public void setLesoes(String lesoes) {
		this.lesoes = lesoes;
	}

	public String getAcne() {
		return acne;
	}

	public void setAcne(String acne) {
		this.acne = acne;
	}

	public String getTratamento() {
		return tratamento;
	}

	public void setTratamento(String tratamento) {
		this.tratamento = tratamento;
	}

}
