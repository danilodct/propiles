package br.com.pilates.base;

public class AvaliacaoDermatologia extends Avaliacao {

	private String aspectosPele, fototipo, numeroNevos, numeroNevosAtipicos;
	private boolean historia, melanoma, cancerPeleMelanoma, lesaoBenigna, historiaFamiliar, melanoma2, cancerPeleMelanoma2, nevos, azul, verde, marrom, fotodanificada, lentigos, nenhuma, monitoramento, excisao;
	private boolean frontal, posterior, facePerfil, face, plantar, pes, maos, palmar;
	private String avaliacao;// url da imagem

	public AvaliacaoDermatologia() {
	}

	public String getAspectosPele() {
		return aspectosPele;
	}

	public void setAspectosPele(String aspectosPele) {
		this.aspectosPele = aspectosPele;
	}

	public boolean isHistoria() {
		return historia;
	}

	public void setHistoria(boolean historia) {
		this.historia = historia;
	}

	public void setHistoriaStr(String historia) {
		if (historia != null && historia.equals("on"))
			this.historia = true;
		else
			this.historia = false;
	}

	public boolean isMelanoma() {
		return melanoma;
	}

	public void setMelanoma(boolean melanoma) {
		this.melanoma = melanoma;
	}

	public void setMelanomaStr(String melanoma) {
		if (melanoma != null && melanoma.equals("on"))
			this.melanoma = true;
		else
			this.melanoma = false;
	}

	public boolean isCancerPeleMelanoma() {
		return cancerPeleMelanoma;
	}

	public void setCancerPeleMelanoma(boolean cancerPeleMelanoma) {
		this.cancerPeleMelanoma = cancerPeleMelanoma;
	}

	public void setCancerPeleMelanomaStr(String cancer) {
		if (cancer != null && cancer.equals("on"))
			this.cancerPeleMelanoma = true;
		else
			this.cancerPeleMelanoma = false;
	}

	public boolean isLesaoBenigna() {
		return lesaoBenigna;
	}

	public void setLesaoBenigna(boolean lesaoBenigna) {
		this.lesaoBenigna = lesaoBenigna;
	}

	public void setLesaoBenignaStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.lesaoBenigna = true;
		else
			this.lesaoBenigna = false;
	}

	public String getFototipo() {
		return fototipo;
	}

	public void setFototipo(String fototipo) {
		this.fototipo = fototipo;
	}

	public String getNumeroNevos() {
		return numeroNevos;
	}

	public void setNumeroNevos(String numeroNevos) {
		this.numeroNevos = numeroNevos;
	}

	public String getNumeroNevosAtipicos() {
		return numeroNevosAtipicos;
	}

	public void setNumeroNevosAtipicos(String numeroNevosAtipicos) {
		this.numeroNevosAtipicos = numeroNevosAtipicos;
	}

	public boolean isHistoriaFamiliar() {
		return historiaFamiliar;
	}

	public void setHistoriaFamiliar(boolean historiaFamiliar) {
		this.historiaFamiliar = historiaFamiliar;
	}

	public void setHistoriaFamiliarStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.historiaFamiliar = true;
		else
			this.historiaFamiliar = false;
	}

	public boolean isMelanoma2() {
		return melanoma2;
	}

	public void setMelanoma2(boolean melanoma2) {
		this.melanoma2 = melanoma2;
	}

	public void setMelanoma2Str(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.melanoma2 = true;
		else
			this.melanoma2 = false;
	}

	public boolean isCancerPeleMelanoma2() {
		return cancerPeleMelanoma2;
	}

	public void setCancerPeleMelanoma2(boolean cancerPeleMelanoma2) {
		this.cancerPeleMelanoma2 = cancerPeleMelanoma2;
	}

	public void setCancerPeleMelanoma2Str(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.cancerPeleMelanoma2 = true;
		else
			this.cancerPeleMelanoma2 = false;
	}

	public boolean isNevos() {
		return nevos;
	}

	public void setNevos(boolean nevos) {
		this.nevos = nevos;
	}

	public void setNevosStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.nevos = true;
		else
			this.nevos = false;
	}

	public boolean isAzul() {
		return azul;
	}

	public void setAzul(boolean azul) {
		this.azul = azul;
	}

	public void setAzulStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.azul = true;
		else
			this.azul = false;
	}

	public boolean isVerde() {
		return verde;
	}

	public void setVerde(boolean verde) {
		this.verde = verde;
	}

	public void setVerdeStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.verde = true;
		else
			this.verde = false;
	}

	public boolean isMarrom() {
		return marrom;
	}

	public void setMarrom(boolean marrom) {
		this.marrom = marrom;
	}

	public void setMarromStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.marrom = true;
		else
			this.marrom = false;
	}

	public boolean isFotodanificada() {
		return fotodanificada;
	}

	public void setFotodanificada(boolean fotodanificada) {
		this.fotodanificada = fotodanificada;
	}

	public void setFotodanificadaStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.fotodanificada = true;
		else
			this.fotodanificada = false;
	}

	public boolean isLentigos() {
		return lentigos;
	}

	public void setLentigos(boolean lentigos) {
		this.lentigos = lentigos;
	}

	public void setLentigosStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.lentigos = true;
		else
			this.lentigos = false;
	}

	public boolean isNenhuma() {
		return nenhuma;
	}

	public void setNenhuma(boolean nenhuma) {
		this.nenhuma = nenhuma;
	}

	public void setNenhumaStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.nenhuma = true;
		else
			this.nenhuma = false;
	}

	public boolean isMonitoramento() {
		return monitoramento;
	}

	public void setMonitoramento(boolean monitoramento) {
		this.monitoramento = monitoramento;
	}

	public void setMonitoramentoStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.monitoramento = true;
		else
			this.monitoramento = false;
	}

	public boolean isExcisao() {
		return excisao;
	}

	public void setExcisao(boolean excisao) {
		this.excisao = excisao;
	}

	public void setExcisaoStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.excisao = true;
		else
			this.excisao = false;
	}

	public boolean isFrontal() {
		return frontal;
	}

	public void setFrontal(boolean frontal) {
		this.frontal = frontal;
	}

	public void setFrontalStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.frontal = true;
		else
			this.frontal = false;
	}

	public boolean isPosterior() {
		return posterior;
	}

	public void setPosterior(boolean posterior) {
		this.posterior = posterior;
	}

	public void setPosteriorStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.posterior = true;
		else
			this.posterior = false;
	}

	public boolean isFacePerfil() {
		return facePerfil;
	}

	public void setFacePerfil(boolean facePerfil) {
		this.facePerfil = facePerfil;
	}

	public void setFacePerfilStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.facePerfil = true;
		else
			this.facePerfil = false;
	}

	public boolean isFace() {
		return face;
	}

	public void setFace(boolean face) {
		this.face = face;
	}

	public void setFaceStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.face = true;
		else
			this.face = false;
	}

	public boolean isPlantar() {
		return plantar;
	}

	public void setPlantar(boolean plantar) {
		this.plantar = plantar;
	}

	public void setPlantarStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.plantar = true;
		else
			this.plantar = false;
	}

	public boolean isPes() {
		return pes;
	}

	public void setPes(boolean pes) {
		this.pes = pes;
	}

	public void setPesStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.pes = true;
		else
			this.pes = false;
	}

	public boolean isMaos() {
		return maos;
	}

	public void setMaos(boolean maos) {
		this.maos = maos;
	}

	public void setMaosStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.maos = true;
		else
			this.maos = false;
	}

	public boolean isPalmar() {
		return palmar;
	}

	public void setPalmar(boolean palmar) {
		this.palmar = palmar;
	}

	public void setPalmarStr(String lesao) {
		if (lesao != null && lesao.equals("on"))
			this.palmar = true;
		else
			this.palmar = false;
	}

	public String getAvaliacao() {
		return avaliacao;
	}

	public void setAvaliacao(String avaliacao) {
		this.avaliacao = avaliacao;
	}

}
