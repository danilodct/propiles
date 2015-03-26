package br.com.pilates.base;

import br.com.pilates.base.enums.AspectoPele;
import br.com.pilates.base.enums.CategoriaRuga;
import br.com.pilates.base.enums.CorPele;
import br.com.pilates.base.enums.EstriaAparecimento;
import br.com.pilates.base.enums.GrauCelulite;
import br.com.pilates.base.enums.QtAlimentacao;
import br.com.pilates.base.enums.QualidadePele;
import br.com.pilates.base.enums.TipoCelulite;
import br.com.pilates.base.enums.TipoRuga;

public class _AvaliacaoEstetica extends Avaliacao {
	
	private String atividadeFisica;
	private String sono;
	private String estadoEmocional;
	private String cuidadosFaciais;
	private String cuidadosCorporais;
	private String exposicaoClima;
	//HISTORICO PATOLOGIA
	private boolean diabetes;
	private boolean queloide;
	private boolean hemofilia;
	private boolean proteseMetalica;
	private boolean marcapasso;
	private boolean alergias;
	//INTERVENCOES CIRURGICAS
	private boolean lifting;
	private boolean blefaropastia;
	private boolean rinoplastia;
	private boolean lipoaspiracao;
	private boolean rejuvenescimento;
	private boolean dermolipectomia;
	private boolean mamoplastiaReducao;
	private boolean mastectomia;
	private boolean mentoplastia;
	private boolean mamoplastiaAumento;
	private boolean lipoescultura;
	private boolean microcirurgia;
	private boolean otoplastia;
	private boolean silicone;
	private boolean botox;
	//FATORES ALIMENTICIOS
	private String alimentacao;
	private QtAlimentacao qtAlimentacao;
	private String qtAlimentacaoDiaria;
	private String dieta;
	private boolean obesidade;
	//Pele
	private CorPele corPele;
	private QualidadePele qualidadePele;
	//lesoes de pele
	private boolean maculas;
	private boolean papulas;
	private boolean comedao;
	private boolean pustula;
	private boolean ceratose;
	private boolean nodulo;
	private boolean queloideLesao;
	private boolean hematoma;
	private boolean vesicula;
	private boolean bolha;
	private boolean abscesso;
	private boolean crosta;
	private boolean ulceracao;
	private boolean fissura;
	private boolean cicatriz;
	//ACNE
	private boolean comedonica;
	private boolean papulosa;
	private boolean flemonosa;
	private boolean pustulosa;
	private boolean cicatrizposacne;
	//ALTERACAO DA PIGMENTACAO
	private boolean efelides;
	private boolean vitiligo;
	private boolean manchassenis;
	private boolean nevospigmentarios;
	private boolean fotosensibilidade;
	private boolean melasmas;
	//RUGAS
	private boolean nasogeniana;
	private boolean peribucais;
	private boolean glabelares;
	private boolean periorbiculares;
	private boolean palpebrais;
	private boolean transversais;
	private TipoRuga tipoRuga;
	private CategoriaRuga categoriaRuga;
	//ESTRIAS
	private EstriaAparecimento estriaAparecimento;
	private String coloracaoInicial;
	private String coloracaoFinal;
	private String estriaLocalizacao;
	//CELULITE
	private GrauCelulite grauCelulite;
	private TipoCelulite tipoCelulite;
	private AspectoPele aspectoPele;
	private String dor;
	private String localizacao;
	
	public _AvaliacaoEstetica() {}
	
	public String getAtividadeFisica() {
		return atividadeFisica;
	}
	
	public void setAtividadeFisica(String atividadeFisica) {
		this.atividadeFisica = atividadeFisica;
	}
	
	public String getEstadoEmocional() {
		return estadoEmocional;
	}
	
	public void setEstadoEmocional(String estadoEmocional) {
		this.estadoEmocional = estadoEmocional;
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
	
	public String getExposicaoClima() {
		return exposicaoClima;
	}
	
	public void setExposicaoClima(String exposicaoClima) {
		this.exposicaoClima = exposicaoClima;
	}
	
	public boolean isDiabetes() {
		return diabetes;
	}
	
	public void setDiabetes(boolean diabetes) {
		this.diabetes = diabetes;
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
	
	public boolean isProteseMetalica() {
		return proteseMetalica;
	}
	
	public void setProteseMetalica(boolean proteseMetalica) {
		this.proteseMetalica = proteseMetalica;
	}
	
	public boolean isMarcapasso() {
		return marcapasso;
	}
	
	public void setMarcapasso(boolean macapasso) {
		this.marcapasso = macapasso;
	}
	
	public boolean isAlergias() {
		return alergias;
	}
	
	public void setAlergias(boolean alergias) {
		this.alergias = alergias;
	}
	
	public boolean isLifting() {
		return lifting;
	}
	
	public void setLifting(boolean lifting) {
		this.lifting = lifting;
	}
	
	public boolean isBlefaropastia() {
		return blefaropastia;
	}
	
	public void setBlefaropastia(boolean blefaropastia) {
		this.blefaropastia = blefaropastia;
	}
	
	public boolean isRinoplastia() {
		return rinoplastia;
	}
	
	public void setRinoplastia(boolean rinoplastia) {
		this.rinoplastia = rinoplastia;
	}
	
	public boolean isLipoaspiracao() {
		return lipoaspiracao;
	}
	
	public void setLipoaspiracao(boolean lipoaspiracao) {
		this.lipoaspiracao = lipoaspiracao;
	}
	
	public boolean isRejuvenescimento() {
		return rejuvenescimento;
	}
	
	public void setRejuvenescimento(boolean rejuvenescimento) {
		this.rejuvenescimento = rejuvenescimento;
	}
	
	public boolean isDermolipectomia() {
		return dermolipectomia;
	}
	
	public void setDermolipectomia(boolean dermolipectomia) {
		this.dermolipectomia = dermolipectomia;
	}
	
	public boolean isMamoplastiaReducao() {
		return mamoplastiaReducao;
	}
	
	public void setMamoplastiaReducao(boolean mamoplastiaReducao) {
		this.mamoplastiaReducao = mamoplastiaReducao;
	}
	
	public boolean isMastectomia() {
		return mastectomia;
	}
	
	public void setMastectomia(boolean mastectomia) {
		this.mastectomia = mastectomia;
	}
	
	public boolean isMentoplastia() {
		return mentoplastia;
	}
	
	public void setMentoplastia(boolean mentoplastia) {
		this.mentoplastia = mentoplastia;
	}
	
	public boolean isMamoplastiaAumento() {
		return mamoplastiaAumento;
	}
	
	public void setMamoplastiaAumento(boolean mamoplastiaAumento) {
		this.mamoplastiaAumento = mamoplastiaAumento;
	}
	
	public boolean isLipoescultura() {
		return lipoescultura;
	}
	
	public void setLipoescultura(boolean lipoescultura) {
		this.lipoescultura = lipoescultura;
	}
	
	public boolean isMicrocirurgia() {
		return microcirurgia;
	}
	
	public void setMicrocirurgia(boolean microcirurgia) {
		this.microcirurgia = microcirurgia;
	}
	
	public boolean isOtoplastia() {
		return otoplastia;
	}
	
	public void setOtoplastia(boolean otoplastia) {
		this.otoplastia = otoplastia;
	}
	
	public boolean isSilicone() {
		return silicone;
	}
	
	public void setSilicone(boolean silicone) {
		this.silicone = silicone;
	}
	
	public boolean isBotox() {
		return botox;
	}
	
	public void setBotox(boolean botox) {
		this.botox = botox;
	}
	
	public String getAlimentacao() {
		return alimentacao;
	}
	
	public void setAlimentacao(String alimentacao) {
		this.alimentacao = alimentacao;
	}
	
	public QtAlimentacao getQtAlimentacao() {
		return qtAlimentacao;
	}
	
	public String getQtAlimentacaoStr() {
		return qtAlimentacao.getValue();
	}
	
	public void setQtAlimentacaoStr(String qtAlimentacao) {
		this.qtAlimentacao = QtAlimentacao.createEnum(qtAlimentacao);
	}
	
	public void setQtAlimentacao(QtAlimentacao qtAlimentacao) {
		this.qtAlimentacao = qtAlimentacao;
	}
	
	public String getSono() {
		return sono;
	}
	
	public void setSono(String sono) {
		this.sono = sono;
	}
	
	public String getQtAlimentacaoDiaria() {
		return qtAlimentacaoDiaria;
	}
	
	public void setQtAlimentacaoDiaria(String qtAlimentacaoDiaria) {
		this.qtAlimentacaoDiaria = qtAlimentacaoDiaria;
	}
	
	public String getDieta() {
		return dieta;
	}
	
	public void setDieta(String dieta) {
		this.dieta = dieta;
	}
	
	public boolean isObesidade() {
		return obesidade;
	}
	
	public void setObesidade(boolean obesidade) {
		this.obesidade = obesidade;
	}
	
	public String getCorPeleStr() {
		return corPele.getValue();
	}
	
	public CorPele getCorPele() {
		return corPele;
	}
	
	public void setCorPele(CorPele corPele) {
		this.corPele = corPele;
	}
	
	public void setCorPeleStr(String corPele) {
		this.corPele = CorPele.createEnum(corPele);
	}
	
	public String getQualidadePeleStr() {
		return qualidadePele.getValue();
	}
	
	public QualidadePele getQualidadePele() {
		return qualidadePele;
	}
	
	public void setQualidadePeleStr(String qualidadePele) {
		this.qualidadePele = QualidadePele.createEnum(qualidadePele);
	}
	
	public void setQualidadePele(QualidadePele qualidadePele) {
		this.qualidadePele = qualidadePele;
	}
	
	public boolean isMaculas() {
		return maculas;
	}
	
	public void setMaculas(boolean maculas) {
		this.maculas = maculas;
	}
	
	public boolean isPapulas() {
		return papulas;
	}
	
	public void setPapulas(boolean papulas) {
		this.papulas = papulas;
	}
	
	public boolean isComedao() {
		return comedao;
	}
	
	public void setComedao(boolean comedao) {
		this.comedao = comedao;
	}
	
	public boolean isPustula() {
		return pustula;
	}
	
	public void setPustula(boolean pustula) {
		this.pustula = pustula;
	}
	
	public boolean isCeratose() {
		return ceratose;
	}
	
	public void setCeratose(boolean ceratose) {
		this.ceratose = ceratose;
	}
	
	public boolean isNodulo() {
		return nodulo;
	}
	
	public void setNodulo(boolean nodulo) {
		this.nodulo = nodulo;
	}
	
	public boolean isQueloideLesao() {
		return queloideLesao;
	}
	
	public void setQueloideLesao(boolean queloideLesao) {
		this.queloideLesao = queloideLesao;
	}
	
	public boolean isHematoma() {
		return hematoma;
	}
	
	public void setHematoma(boolean hematoma) {
		this.hematoma = hematoma;
	}
	
	public boolean isVesicula() {
		return vesicula;
	}
	
	public void setVesicula(boolean vesicula) {
		this.vesicula = vesicula;
	}
	
	public boolean isBolha() {
		return bolha;
	}
	
	public void setBolha(boolean bolha) {
		this.bolha = bolha;
	}
	
	public boolean isAbscesso() {
		return abscesso;
	}
	
	public void setAbscesso(boolean abscesso) {
		this.abscesso = abscesso;
	}
	
	public boolean isCrosta() {
		return crosta;
	}
	
	public void setCrosta(boolean crosta) {
		this.crosta = crosta;
	}
	
	public boolean isUlceracao() {
		return ulceracao;
	}
	
	public void setUlceracao(boolean ulceracao) {
		this.ulceracao = ulceracao;
	}
	
	public boolean isFissura() {
		return fissura;
	}
	
	public void setFissura(boolean fissura) {
		this.fissura = fissura;
	}
	
	public boolean isCicatriz() {
		return cicatriz;
	}
	
	public void setCicatriz(boolean cicatriz) {
		this.cicatriz = cicatriz;
	}
	
	public boolean isComedonica() {
		return comedonica;
	}
	
	public void setComedonica(boolean comedonica) {
		this.comedonica = comedonica;
	}
	
	public boolean isPapulosa() {
		return papulosa;
	}
	
	public void setPapulosa(boolean papulosa) {
		this.papulosa = papulosa;
	}
	
	public boolean isFlemonosa() {
		return flemonosa;
	}
	
	public void setFlemonosa(boolean flemonosa) {
		this.flemonosa = flemonosa;
	}
	
	public boolean isPustulosa() {
		return pustulosa;
	}
	
	public void setPustulosa(boolean pustulosa) {
		this.pustulosa = pustulosa;
	}
	
	public boolean isCicatrizposacne() {
		return cicatrizposacne;
	}
	
	public void setCicatrizposacne(boolean cicatrizposacne) {
		this.cicatrizposacne = cicatrizposacne;
	}
	
	public boolean isEfelides() {
		return efelides;
	}
	
	public void setEfelides(boolean efelides) {
		this.efelides = efelides;
	}
	
	public boolean isVitiligo() {
		return vitiligo;
	}
	
	public void setVitiligo(boolean vitiligo) {
		this.vitiligo = vitiligo;
	}
	
	public boolean isManchassenis() {
		return manchassenis;
	}
	
	public void setManchassenis(boolean manchassenis) {
		this.manchassenis = manchassenis;
	}
	
	public boolean isNevospigmentarios() {
		return nevospigmentarios;
	}
	
	public void setNevospigmentarios(boolean nevospigmentarios) {
		this.nevospigmentarios = nevospigmentarios;
	}
	
	public boolean isFotosensibilidade() {
		return fotosensibilidade;
	}
	
	public void setFotosensibilidade(boolean fotosensibilidade) {
		this.fotosensibilidade = fotosensibilidade;
	}
	
	public boolean isMelasmas() {
		return melasmas;
	}
	
	public void setMelasmas(boolean melasmas) {
		this.melasmas = melasmas;
	}
	
	public boolean isNasogeniana() {
		return nasogeniana;
	}
	
	public void setNasogeniana(boolean nasogeniana) {
		this.nasogeniana = nasogeniana;
	}
	
	public boolean isPeribucais() {
		return peribucais;
	}
	
	public void setPeribucais(boolean peribucais) {
		this.peribucais = peribucais;
	}
	
	public boolean isGlabelares() {
		return glabelares;
	}
	
	public void setGlabelares(boolean glabelares) {
		this.glabelares = glabelares;
	}
	
	public boolean isPeriorbiculares() {
		return periorbiculares;
	}
	
	public void setPeriorbiculares(boolean periorbiculares) {
		this.periorbiculares = periorbiculares;
	}
	
	public boolean isPalpebrais() {
		return palpebrais;
	}
	
	public void setPalpebrais(boolean palpebrais) {
		this.palpebrais = palpebrais;
	}
	
	public boolean isTransversais() {
		return transversais;
	}
	
	public void setTransversais(boolean transversais) {
		this.transversais = transversais;
	}
	
	public TipoRuga getTipoRuga() {
		return tipoRuga;
	}
	
	public void setTipoRuga(TipoRuga tipoRuga) {
		this.tipoRuga = tipoRuga;
	}
	
	public String getTipoRugaStr() {
		return tipoRuga.getValue();
	}
	
	public void setTipoRugaStr(String tipoRuga) {
		this.tipoRuga = TipoRuga.createEnum(tipoRuga);
	}
	
	public CategoriaRuga getCategoriaRuga() {
		return categoriaRuga;
	}
	
	public void setCategoriaRuga(CategoriaRuga categoriaRuga) {
		this.categoriaRuga = categoriaRuga;
	}
	
	public String getCategoriaRugaStr() {
		return categoriaRuga.getValue();
	}
	
	public void setCategoriaRugaStr(String categoriaRuga) {
		this.categoriaRuga = CategoriaRuga.createEnum(categoriaRuga);
	}
	
	public EstriaAparecimento getEstriaAparecimento() {
		return estriaAparecimento;
	}
	
	public void setEstriaAparecimento(EstriaAparecimento estriaAparecimento) {
		this.estriaAparecimento = estriaAparecimento;
	}
	
	public String getEstriaAparecimentoStr() {
		return estriaAparecimento.getValue();
	}
	
	public void setEstriaAparecimentoStr(String estriaAparecimento) {
		this.estriaAparecimento = EstriaAparecimento.createEnum(estriaAparecimento);
	}
	
	public String getColoracaoInicial() {
		return coloracaoInicial;
	}
	
	public void setColoracaoInicial(String coloracaoInicial) {
		this.coloracaoInicial = coloracaoInicial;
	}
	
	public String getColoracaoFinal() {
		return coloracaoFinal;
	}
	
	public void setColoracaoFinal(String coloracaoFinal) {
		this.coloracaoFinal = coloracaoFinal;
	}
	
	public String getEstriaLocalizacao() {
		return estriaLocalizacao;
	}
	
	public void setEstriaLocalizacao(String estriaLocalizacao) {
		this.estriaLocalizacao = estriaLocalizacao;
	}
	
	public GrauCelulite getGrauCelulite() {
		return grauCelulite;
	}
	
	public void setGrauCelulite(GrauCelulite grauCelulite) {
		this.grauCelulite = grauCelulite;
	}
	
	public String getGrauCeluliteStr() {
		return grauCelulite.getValue();
	}
	
	public void setGrauCeluliteStr(String grauCelulite) {
		this.grauCelulite = GrauCelulite.createEnum(grauCelulite);
	}
	
	public TipoCelulite getTipoCelulite() {
		return tipoCelulite;
	}
	
	public void setTipoCelulite(TipoCelulite tipoCelulite) {
		this.tipoCelulite = tipoCelulite;
	}
	
	public String getTipoCeluliteStr() {
		return tipoCelulite.getValue();
	}
	
	public void setTipoCeluliteStr(String tipoCelulite) {
		this.tipoCelulite = TipoCelulite.createEnum(tipoCelulite);
	}
	
	public AspectoPele getAspectoPele() {
		return aspectoPele;
	}
	
	public void setAspectoPele(AspectoPele aspectoPele) {
		this.aspectoPele = aspectoPele;
	}
	
	public String getAspectoPeleStr() {
		return aspectoPele.getValue();
	}
	
	public void setAspectoPeleStr(String aspectoPele) {
		this.aspectoPele = AspectoPele.createEnum(aspectoPele);
	}
	
	public String getDor() {
		return dor;
	}
	
	public void setDor(String dor) {
		this.dor = dor;
	}
	
	public String getLocalizacao() {
		return localizacao;
	}
	
	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}
	
}
