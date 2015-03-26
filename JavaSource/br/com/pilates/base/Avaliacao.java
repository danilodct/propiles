package br.com.pilates.base;

import java.util.Date;

import br.com.pilates.util.SystemUtils;

public class Avaliacao extends ObjetoBasico {

	private boolean atividadeFisica;
	private boolean dormeBem;
	private boolean tabagismo;
	private boolean alcolico;
	private boolean hipertensao;
	private boolean marcapasso;
	private boolean diabetes;
	private boolean queloides;
	private boolean etilismo;
	private String conhecimentoStudio;
	private String objetivo;
	private String pa;
	private String medicacao;
	private String alergias;
	private String antecedentes;
	private String observacoes;
	private String cuidadosFaciais;
	private String cuidadosCorporais;
	private String alteracaoHormonal;
	private String proteseMetalica;
	private String intervencoesCirurgicas;
	private String tensaoPremenstrual;
	private String quantidadeGPA;
	private String anticonceptivo;
	private String tratamento;
	private String exameFisico;
	private Date data;
	private double peso;
	private double altura;

	// PERIMETRIA
	private String mamaAvaliacao, mamaAvaliacao2, mamaAvaliacao3, mamaAvaliacao4, mamaAvaliacao5, mamaPerda;
	private String esternoAvaliacao, esternoAvaliacao2, esternoAvaliacao3, esternoAvaliacao4, esternoAvaliacao5, esternoPerda;
	private String cinturaAvaliacao, cinturaAvaliacao2, cinturaAvaliacao3, cinturaAvaliacao4, cinturaAvaliacao5, cinturaPerda;
	private String cicatrizUmbilicalAvaliacao, cicatrizUmbilicalAvaliacao2, cicatrizUmbilicalAvaliacao3, cicatrizUmbilicalAvaliacao4, cicatrizUmbilicalAvaliacao5, cicatrizUmbilicalPerda;
	private String cristaIliacaAvaliacao, cristaIliacaAvaliacao2, cristaIliacaAvaliacao3, cristaIliacaAvaliacao4, cristaIliacaAvaliacao5, cristaIliacaPerda;
	private String quadrilAvaliacao, quadrilAvaliacao2, quadrilAvaliacao3, quadrilAvaliacao4, quadrilAvaliacao5, quadrilPerda;
	private String pregaGluteaAvaliacao, pregaGluteaAvaliacao2, pregaGluteaAvaliacao3, pregaGluteaAvaliacao4, pregaGluteaAvaliacao5, pregaGluteaPerda;

	public Avaliacao() {
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public void setDataStr(String data) {
		this.data = SystemUtils.parseStringToDate(data);
	}

	public double getPeso() {
		return peso;
	}

	public void setPeso(double peso) {
		this.peso = peso;
	}

	public void setPesoStr(String peso) {
		if (peso != null && peso.indexOf(',') != -1) {
			peso = peso.replaceAll("\\.", "");
			peso = peso.replaceAll(",", ".");
		}
		this.peso = Double.parseDouble(peso);
	}

	public double getAltura() {
		return altura;
	}

	public void setAltura(double altura) {
		this.altura = altura;
	}

	public void setAlturaStr(String altura) {
		if (altura != null && altura.indexOf(',') != -1) {
			altura = altura.replaceAll("\\.", "");
			altura = altura.replaceAll(",", ".");
		}
		this.altura = Double.parseDouble(altura);
	}

	public String getObjetivo() {
		return objetivo;
	}

	public void setObjetivo(String objetivo) {
		this.objetivo = objetivo;
	}

	public String getMedicacao() {
		return medicacao;
	}

	public void setMedicacao(String medicacao) {
		this.medicacao = medicacao;
	}

	public boolean isTabagismo() {
		return tabagismo;
	}

	public void setTabagismo(boolean tabagismo) {
		this.tabagismo = tabagismo;
	}

	public boolean isEtilismo() {
		return etilismo;
	}

	public void setEtilismo(boolean etilismo) {
		this.etilismo = etilismo;
	}

	public boolean isHipertensao() {
		return hipertensao;
	}

	public void setHipertensao(boolean hipertensao) {
		this.hipertensao = hipertensao;
	}

	public String getConhecimentoStudio() {
		return conhecimentoStudio;
	}

	public void setConhecimentoStudio(String conhecimentoStudio) {
		this.conhecimentoStudio = conhecimentoStudio;
	}

	public void parseDadosBasicos(Avaliacao avaliacao) {
		this.setEtilismo(avaliacao.isEtilismo());
		this.setHipertensao(avaliacao.isHipertensao());
		this.setTabagismo(avaliacao.isTabagismo());
		this.setAltura(avaliacao.getAltura());
		this.setData(avaliacao.getData());
		this.setMedicacao(avaliacao.getMedicacao());
		this.setObjetivo(avaliacao.getObjetivo());
		this.setPeso(avaliacao.getPeso());
		this.setConhecimentoStudio(avaliacao.getConhecimentoStudio());
		this.setPa(avaliacao.getPa());
		this.setAtividadeFisica(avaliacao.isAtividadeFisica());
		this.setDormeBem(avaliacao.isDormeBem());
		this.setAlcolico(avaliacao.isAlcolico());
		this.setMarcapasso(avaliacao.isMarcapasso());
		this.setAlergias(avaliacao.getAlergias());
		this.setDiabetes(avaliacao.isDiabetes());
		this.setQueloides(avaliacao.isQueloides());
		this.setAntecedentes(avaliacao.getAntecedentes());
		this.setObservacoes(avaliacao.getObservacoes());
		this.setCuidadosFaciais(avaliacao.getCuidadosFaciais());
		this.setCuidadosCorporais(avaliacao.getCuidadosCorporais());
		this.setAlteracaoHormonal(avaliacao.getAlteracaoHormonal());
		this.setProteseMetalica(avaliacao.getProteseMetalica());
		this.setIntervencoesCirurgicas(avaliacao.getIntervencoesCirurgicas());
		this.setTensaoPremenstrual(avaliacao.getTensaoPremenstrual());
		this.setQuantidadeGPA(avaliacao.getQuantidadeGPA());
		this.setAnticonceptivo(avaliacao.getAnticonceptivo());
		this.setTratamento(avaliacao.getTratamento());
		this.setExameFisico(avaliacao.getExameFisico());
	}

	public String getPa() {
		return pa;
	}

	public void setPa(String pa) {
		this.pa = pa;
	}

	public boolean isAtividadeFisica() {
		return atividadeFisica;
	}

	public void setAtividadeFisica(boolean atividadeFisica) {
		this.atividadeFisica = atividadeFisica;
	}

	public void setAtividadeFisicaStr(String atividadeFisica) {
		this.atividadeFisica = SystemUtils.parseStringBoolean(atividadeFisica);
	}

	public void setTabagismoStr(String tabagismo) {
		if (tabagismo != null && tabagismo.equals("on"))
			this.tabagismo = true;
		else
			this.tabagismo = false;
	}

	public void setDormeBemStr(String dormeBem) {
		if (dormeBem != null && dormeBem.equals("on"))
			this.dormeBem = true;
		else
			this.dormeBem = false;
	}

	public void setAlcolicoStr(String alcolico) {
		if (alcolico != null && alcolico.equals("on"))
			this.alcolico = true;
		else
			this.alcolico = false;
	}

	public void setDiabetesStr(String diabetes) {
		if (diabetes != null && diabetes.equals("on"))
			this.diabetes = true;
		else
			this.diabetes = false;
	}

	public void setHipertensaoStr(String hipertensao) {
		if (hipertensao != null && hipertensao.equals("on"))
			this.hipertensao = true;
		else
			this.hipertensao = false;
	}

	public void setQueloidesStr(String queloides) {
		if (queloides != null && queloides.equals("on"))
			this.queloides = true;
		else
			this.queloides = false;
	}

	public boolean isDormeBem() {
		return dormeBem;
	}

	public void setDormeBem(boolean dormeBem) {
		this.dormeBem = dormeBem;
	}

	public boolean isAlcolico() {
		return alcolico;
	}

	public void setAlcolico(boolean alcolico) {
		this.alcolico = alcolico;
	}

	public boolean isMarcapasso() {
		return marcapasso;
	}

	public void setMarcapasso(boolean marcapasso) {
		this.marcapasso = marcapasso;
	}

	public String getAlergias() {
		return alergias;
	}

	public void setAlergias(String alergias) {
		this.alergias = alergias;
	}

	public boolean isDiabetes() {
		return diabetes;
	}

	public void setDiabetes(boolean diabetes) {
		this.diabetes = diabetes;
	}

	public boolean isQueloides() {
		return queloides;
	}

	public void setQueloides(boolean queloides) {
		this.queloides = queloides;
	}

	public String getAntecedentes() {
		return antecedentes;
	}

	public void setAntecedentes(String antecedentes) {
		this.antecedentes = antecedentes;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	public String getCuidadosFaciais() {
		return cuidadosFaciais;
	}

	public void setCuidadosFaciais(String cuidadosFaciais) {
		this.cuidadosFaciais = cuidadosFaciais;
	}

	public String getCuidadosCorporais() {
		return cuidadosCorporais;
	}

	public void setCuidadosCorporais(String cuidadosCorporais) {
		this.cuidadosCorporais = cuidadosCorporais;
	}

	public String getAlteracaoHormonal() {
		return alteracaoHormonal;
	}

	public void setAlteracaoHormonal(String alteracaoHormonal) {
		this.alteracaoHormonal = alteracaoHormonal;
	}

	public String getProteseMetalica() {
		return proteseMetalica;
	}

	public void setProteseMetalica(String proteseMetalica) {
		this.proteseMetalica = proteseMetalica;
	}

	public String getIntervencoesCirurgicas() {
		return intervencoesCirurgicas;
	}

	public void setIntervencoesCirurgicas(String intervencoesCirurgicas) {
		this.intervencoesCirurgicas = intervencoesCirurgicas;
	}

	public String getTensaoPremenstrual() {
		return tensaoPremenstrual;
	}

	public void setTensaoPremenstrual(String tensaoPremenstrual) {
		this.tensaoPremenstrual = tensaoPremenstrual;
	}

	public String getQuantidadeGPA() {
		return quantidadeGPA;
	}

	public void setQuantidadeGPA(String quantidadeGPA) {
		this.quantidadeGPA = quantidadeGPA;
	}

	public String getAnticonceptivo() {
		return anticonceptivo;
	}

	public void setAnticonceptivo(String anticonceptivo) {
		this.anticonceptivo = anticonceptivo;
	}

	public String getTratamento() {
		return tratamento;
	}

	public void setTratamento(String tratamento) {
		this.tratamento = tratamento;
	}

	public String getExameFisico() {
		return exameFisico;
	}

	public void setExameFisico(String exameFisico) {
		this.exameFisico = exameFisico;
	}

	public String getMamaAvaliacao() {
		return mamaAvaliacao;
	}

	public void setMamaAvaliacao(String mamaAvaliacao) {
		this.mamaAvaliacao = mamaAvaliacao;
	}

	public String getMamaPerda() {
		return mamaPerda;
	}

	public void setMamaPerda(String mamaPerda) {
		this.mamaPerda = mamaPerda;
	}

	public String getEsternoAvaliacao() {
		return esternoAvaliacao;
	}

	public void setEsternoAvaliacao(String esternoAvaliacao) {
		this.esternoAvaliacao = esternoAvaliacao;
	}

	public String getEsternoPerda() {
		return esternoPerda;
	}

	public void setEsternoPerda(String esternoPerda) {
		this.esternoPerda = esternoPerda;
	}

	public String getCinturaAvaliacao() {
		return cinturaAvaliacao;
	}

	public void setCinturaAvaliacao(String cinturaAvaliacao) {
		this.cinturaAvaliacao = cinturaAvaliacao;
	}

	public String getCinturaPerda() {
		return cinturaPerda;
	}

	public void setCinturaPerda(String cinturaPerda) {
		this.cinturaPerda = cinturaPerda;
	}

	public String getCicatrizUmbilicalAvaliacao() {
		return cicatrizUmbilicalAvaliacao;
	}

	public void setCicatrizUmbilicalAvaliacao(String cicatrizUmbilicalAvaliacao) {
		this.cicatrizUmbilicalAvaliacao = cicatrizUmbilicalAvaliacao;
	}

	public String getCicatrizUmbilicalPerda() {
		return cicatrizUmbilicalPerda;
	}

	public void setCicatrizUmbilicalPerda(String cicatrizUmbilicalPerda) {
		this.cicatrizUmbilicalPerda = cicatrizUmbilicalPerda;
	}

	public String getCristaIliacaAvaliacao() {
		return cristaIliacaAvaliacao;
	}

	public void setCristaIliacaAvaliacao(String cristaIliacaAvaliacao) {
		this.cristaIliacaAvaliacao = cristaIliacaAvaliacao;
	}

	public String getCristaIliacaPerda() {
		return cristaIliacaPerda;
	}

	public void setCristaIliacaPerda(String cristaIliacaPerda) {
		this.cristaIliacaPerda = cristaIliacaPerda;
	}

	public String getQuadrilAvaliacao() {
		return quadrilAvaliacao;
	}

	public void setQuadrilAvaliacao(String quadrilAvaliacao) {
		this.quadrilAvaliacao = quadrilAvaliacao;
	}

	public String getQuadrilPerda() {
		return quadrilPerda;
	}

	public void setQuadrilPerda(String quadrilPerda) {
		this.quadrilPerda = quadrilPerda;
	}

	public String getPregaGluteaAvaliacao() {
		return pregaGluteaAvaliacao;
	}

	public void setPregaGluteaAvaliacao(String pregaGluteaAvaliacao) {
		this.pregaGluteaAvaliacao = pregaGluteaAvaliacao;
	}

	public String getPregaGluteaPerda() {
		return pregaGluteaPerda;
	}

	public void setPregaGluteaPerda(String pregaGluteaPerda) {
		this.pregaGluteaPerda = pregaGluteaPerda;
	}

	public String getMamaAvaliacao2() {
		return mamaAvaliacao2;
	}

	public void setMamaAvaliacao2(String mamaAvaliacao2) {
		this.mamaAvaliacao2 = mamaAvaliacao2;
	}

	public String getMamaAvaliacao3() {
		return mamaAvaliacao3;
	}

	public void setMamaAvaliacao3(String mamaAvaliacao3) {
		this.mamaAvaliacao3 = mamaAvaliacao3;
	}

	public String getMamaAvaliacao4() {
		return mamaAvaliacao4;
	}

	public void setMamaAvaliacao4(String mamaAvaliacao4) {
		this.mamaAvaliacao4 = mamaAvaliacao4;
	}

	public String getMamaAvaliacao5() {
		return mamaAvaliacao5;
	}

	public void setMamaAvaliacao5(String mamaAvaliacao5) {
		this.mamaAvaliacao5 = mamaAvaliacao5;
	}

	public String getEsternoAvaliacao2() {
		return esternoAvaliacao2;
	}

	public void setEsternoAvaliacao2(String esternoAvaliacao2) {
		this.esternoAvaliacao2 = esternoAvaliacao2;
	}

	public String getEsternoAvaliacao3() {
		return esternoAvaliacao3;
	}

	public void setEsternoAvaliacao3(String esternoAvaliacao3) {
		this.esternoAvaliacao3 = esternoAvaliacao3;
	}

	public String getEsternoAvaliacao4() {
		return esternoAvaliacao4;
	}

	public void setEsternoAvaliacao4(String esternoAvaliacao4) {
		this.esternoAvaliacao4 = esternoAvaliacao4;
	}

	public String getEsternoAvaliacao5() {
		return esternoAvaliacao5;
	}

	public void setEsternoAvaliacao5(String esternoAvaliacao5) {
		this.esternoAvaliacao5 = esternoAvaliacao5;
	}

	public String getCinturaAvaliacao2() {
		return cinturaAvaliacao2;
	}

	public void setCinturaAvaliacao2(String cinturaAvaliacao2) {
		this.cinturaAvaliacao2 = cinturaAvaliacao2;
	}

	public String getCinturaAvaliacao3() {
		return cinturaAvaliacao3;
	}

	public void setCinturaAvaliacao3(String cinturaAvaliacao3) {
		this.cinturaAvaliacao3 = cinturaAvaliacao3;
	}

	public String getCinturaAvaliacao4() {
		return cinturaAvaliacao4;
	}

	public void setCinturaAvaliacao4(String cinturaAvaliacao4) {
		this.cinturaAvaliacao4 = cinturaAvaliacao4;
	}

	public String getCinturaAvaliacao5() {
		return cinturaAvaliacao5;
	}

	public void setCinturaAvaliacao5(String cinturaAvaliacao5) {
		this.cinturaAvaliacao5 = cinturaAvaliacao5;
	}

	public String getCicatrizUmbilicalAvaliacao2() {
		return cicatrizUmbilicalAvaliacao2;
	}

	public void setCicatrizUmbilicalAvaliacao2(String cicatrizUmbilicalAvaliacao2) {
		this.cicatrizUmbilicalAvaliacao2 = cicatrizUmbilicalAvaliacao2;
	}

	public String getCicatrizUmbilicalAvaliacao3() {
		return cicatrizUmbilicalAvaliacao3;
	}

	public void setCicatrizUmbilicalAvaliacao3(String cicatrizUmbilicalAvaliacao3) {
		this.cicatrizUmbilicalAvaliacao3 = cicatrizUmbilicalAvaliacao3;
	}

	public String getCicatrizUmbilicalAvaliacao4() {
		return cicatrizUmbilicalAvaliacao4;
	}

	public void setCicatrizUmbilicalAvaliacao4(String cicatrizUmbilicalAvaliacao4) {
		this.cicatrizUmbilicalAvaliacao4 = cicatrizUmbilicalAvaliacao4;
	}

	public String getCicatrizUmbilicalAvaliacao5() {
		return cicatrizUmbilicalAvaliacao5;
	}

	public void setCicatrizUmbilicalAvaliacao5(String cicatrizUmbilicalAvaliacao5) {
		this.cicatrizUmbilicalAvaliacao5 = cicatrizUmbilicalAvaliacao5;
	}

	public String getCristaIliacaAvaliacao2() {
		return cristaIliacaAvaliacao2;
	}

	public void setCristaIliacaAvaliacao2(String cristaIliacaAvaliacao2) {
		this.cristaIliacaAvaliacao2 = cristaIliacaAvaliacao2;
	}

	public String getCristaIliacaAvaliacao3() {
		return cristaIliacaAvaliacao3;
	}

	public void setCristaIliacaAvaliacao3(String cristaIliacaAvaliacao3) {
		this.cristaIliacaAvaliacao3 = cristaIliacaAvaliacao3;
	}

	public String getCristaIliacaAvaliacao4() {
		return cristaIliacaAvaliacao4;
	}

	public void setCristaIliacaAvaliacao4(String cristaIliacaAvaliacao4) {
		this.cristaIliacaAvaliacao4 = cristaIliacaAvaliacao4;
	}

	public String getCristaIliacaAvaliacao5() {
		return cristaIliacaAvaliacao5;
	}

	public void setCristaIliacaAvaliacao5(String cristaIliacaAvaliacao5) {
		this.cristaIliacaAvaliacao5 = cristaIliacaAvaliacao5;
	}

	public String getQuadrilAvaliacao2() {
		return quadrilAvaliacao2;
	}

	public void setQuadrilAvaliacao2(String quadrilAvaliacao2) {
		this.quadrilAvaliacao2 = quadrilAvaliacao2;
	}

	public String getQuadrilAvaliacao3() {
		return quadrilAvaliacao3;
	}

	public void setQuadrilAvaliacao3(String quadrilAvaliacao3) {
		this.quadrilAvaliacao3 = quadrilAvaliacao3;
	}

	public String getQuadrilAvaliacao4() {
		return quadrilAvaliacao4;
	}

	public void setQuadrilAvaliacao4(String quadrilAvaliacao4) {
		this.quadrilAvaliacao4 = quadrilAvaliacao4;
	}

	public String getQuadrilAvaliacao5() {
		return quadrilAvaliacao5;
	}

	public void setQuadrilAvaliacao5(String quadrilAvaliacao5) {
		this.quadrilAvaliacao5 = quadrilAvaliacao5;
	}

	public String getPregaGluteaAvaliacao2() {
		return pregaGluteaAvaliacao2;
	}

	public void setPregaGluteaAvaliacao2(String pregaGluteaAvaliacao2) {
		this.pregaGluteaAvaliacao2 = pregaGluteaAvaliacao2;
	}

	public String getPregaGluteaAvaliacao3() {
		return pregaGluteaAvaliacao3;
	}

	public void setPregaGluteaAvaliacao3(String pregaGluteaAvaliacao3) {
		this.pregaGluteaAvaliacao3 = pregaGluteaAvaliacao3;
	}

	public String getPregaGluteaAvaliacao4() {
		return pregaGluteaAvaliacao4;
	}

	public void setPregaGluteaAvaliacao4(String pregaGluteaAvaliacao4) {
		this.pregaGluteaAvaliacao4 = pregaGluteaAvaliacao4;
	}

	public String getPregaGluteaAvaliacao5() {
		return pregaGluteaAvaliacao5;
	}

	public void setPregaGluteaAvaliacao5(String pregaGluteaAvaliacao5) {
		this.pregaGluteaAvaliacao5 = pregaGluteaAvaliacao5;
	}
}
