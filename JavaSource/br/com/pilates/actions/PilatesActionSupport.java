package br.com.pilates.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

import br.com.pilates.base.CentroCusto;
import br.com.pilates.base.Configuracao;
import br.com.pilates.base.Professor;
import br.com.pilates.base.Servico;
import br.com.pilates.base.TipoCadastro;
import br.com.pilates.base.TipoContaPagar;
import br.com.pilates.base.TipoContaReceber;
import br.com.pilates.base.enums.AspectoPele;
import br.com.pilates.base.enums.CategoriaRuga;
import br.com.pilates.base.enums.CorPele;
import br.com.pilates.base.enums.EstadoCivil;
import br.com.pilates.base.enums.EstriaAparecimento;
import br.com.pilates.base.enums.FormaPagamento;
import br.com.pilates.base.enums.GrauCelulite;
import br.com.pilates.base.enums.QtAlimentacao;
import br.com.pilates.base.enums.QualidadePele;
import br.com.pilates.base.enums.Retracao;
import br.com.pilates.base.enums.Sexo;
import br.com.pilates.base.enums.TipoCelulite;
import br.com.pilates.base.enums.TipoCusto;
import br.com.pilates.base.enums.TipoRuga;
import br.com.pilates.base.util.FormaConhecimento;
import br.com.pilates.base.util.Indicacao;
import br.com.pilates.base.util.ItemRadioButtom;
import br.com.pilates.fachada.Proxy;
import br.com.pilates.util.PilatesBundleUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class PilatesActionSupport extends ActionSupport {

	public static final String XML_HEAD = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>";
	public static final String ERROR_CPF = "error_cpf";
	public static final String REDIRECT = "redirect";
	public static final String LOGADO = "logado";
	public static final String SEPARADOR = "-";
	public static final String SEPARADOR_ESPACO = " ";
	public static final String OUTRA = "OUTRA";

	private Collection<CentroCusto> centrosCusto;
	private CentroCusto centroCusto;
	private Collection<Servico> servicos;
	private Servico servico;
	private Configuracao configuracoes;

	private String cpf;

	public String redirect() {
		return REDIRECT;
	}

	public String actionGerenciarCaixa() {
		try {
			configuracoes = Proxy.getInstance().getConfiguracoes();
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionEditarCaixa() {
		try {
			Proxy.getInstance().editarConfiguracoesCaixa(configuracoes);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionInserirCentroCusto() {
		try {
			Proxy.getInstance().inserirCentroCusto(centroCusto);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionCentroCusto() {
		try {
			centroCusto = Proxy.getInstance().readCentroCusto(centroCusto);
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionRemoverCentroCusto() {
		try {
			Proxy.getInstance().removerCentroCusto(centroCusto);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionEditarCentroCusto() {
		try {
			Proxy.getInstance().editarCentroCusto(centroCusto);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionGerenciarCentroCusto() {
		try {
			centrosCusto = Proxy.getInstance().getAllCentroCusto();
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionEditarServico() {
		try {
			Proxy.getInstance().editarServico(servico);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionServico() {
		try {
			servico = Proxy.getInstance().readServico(servico);
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionRemoverServico() {
		try {
			Proxy.getInstance().removerServico(servico);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.REMOCAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionInserirServico() {
		try {
			Proxy.getInstance().inserirServico(servico);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.CADASTRO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public String actionGerenciarServicos() {
		try {
			servicos = Proxy.getInstance().getAllServicos();
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
		}
		return REDIRECT;
	}

	public Collection<Professor> getAllColaboradores() {
		Collection<Professor> vendedores = null;
		try {
			vendedores = Proxy.getInstance().getColaboradores();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vendedores;
	}

	public Collection<ItemRadioButtom> getAcne() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		formas.add(new ItemRadioButtom("COMEDONICA", "Comedônica"));
		formas.add(new ItemRadioButtom("PAPULOSA", "Papulosa"));
		formas.add(new ItemRadioButtom("PUSTULOSA", "Pustulosa"));
		formas.add(new ItemRadioButtom("FLEMONOSA", "Flemonosa"));
		formas.add(new ItemRadioButtom("CICATRIZ", "Cicatriz pós-acne"));

		return formas;
	}

	public Collection<ItemRadioButtom> getLesoes() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		formas.add(new ItemRadioButtom("MACULA", "Mácula"));
		formas.add(new ItemRadioButtom("PAPULA", "Pápula"));
		formas.add(new ItemRadioButtom("COMEDAO", "Comedão"));
		formas.add(new ItemRadioButtom("PUSTULA", "Pústula"));
		formas.add(new ItemRadioButtom("CERATOSE", "Ceratose"));
		formas.add(new ItemRadioButtom("NODULO", "Nódulo"));
		formas.add(new ItemRadioButtom("BOLHA", "Bolha"));
		formas.add(new ItemRadioButtom("ABSESSO", "Absesso"));
		formas.add(new ItemRadioButtom("CICATRIZ", "Cicatriz"));
		return formas;
	}

	public Collection<ItemRadioButtom> getQualidadePele() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		formas.add(new ItemRadioButtom("FINA", "Fina"));
		formas.add(new ItemRadioButtom("GROSSA", "Grossa"));
		formas.add(new ItemRadioButtom("DESIDRATADA", "Desidratada"));
		formas.add(new ItemRadioButtom("HIDRATADA", "Hidratada"));
		formas.add(new ItemRadioButtom("SECA", "Seca"));
		formas.add(new ItemRadioButtom("OLEOSA", "Oleosa"));
		formas.add(new ItemRadioButtom("FLACIDA", "Flácida"));
		formas.add(new ItemRadioButtom("ASPERA", "Áspera"));
		formas.add(new ItemRadioButtom("TUGOR", "Turgor"));
		return formas;
	}

	public Collection<ItemRadioButtom> getCor() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		formas.add(new ItemRadioButtom("BRANCA", "Branca"));
		formas.add(new ItemRadioButtom("NEGRA", "Negra"));
		formas.add(new ItemRadioButtom("AMARELA", "Amarela"));
		return formas;
	}

	public Collection<ItemRadioButtom> getQuantidade() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		formas.add(new ItemRadioButtom("NORMAL", "Normal"));
		formas.add(new ItemRadioButtom("POUCA", "Pouca"));
		formas.add(new ItemRadioButtom("EXCESSIVA", "Excessiva"));
		return formas;
	}

	public Collection<ItemRadioButtom> getAlimentacao() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		formas.add(new ItemRadioButtom("EXCELENTE", "Excelente"));
		formas.add(new ItemRadioButtom("BOA", "Boa"));
		formas.add(new ItemRadioButtom("REGULAR", "Regular"));
		formas.add(new ItemRadioButtom("RUIM", "Ruim"));
		return formas;
	}

	public Collection<ItemRadioButtom> getSimNao() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		formas.add(new ItemRadioButtom("true", "Sim"));
		formas.add(new ItemRadioButtom("false", "Não"));
		return formas;
	}

	public Collection<ItemRadioButtom> getAspectosPele() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		AspectoPele[] values = AspectoPele.values();
		for (AspectoPele forca : values) {
			formas.add(new ItemRadioButtom(forca.getValue(), forca.getValor()));
		}
		return formas;
	}

	public Collection<ItemRadioButtom> getTiposCelulite() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		TipoCelulite[] values = TipoCelulite.values();
		for (TipoCelulite forca : values) {
			formas.add(new ItemRadioButtom(forca.getValue(), forca.getValor()));
		}
		return formas;
	}

	public Collection<ItemRadioButtom> getGrausCelulite() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		GrauCelulite[] values = GrauCelulite.values();
		for (GrauCelulite forca : values) {
			formas.add(new ItemRadioButtom(forca.getValue(), forca.getValor()));
		}
		return formas;
	}

	public Collection<ItemRadioButtom> getEstriasAparecimento() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		EstriaAparecimento[] values = EstriaAparecimento.values();
		for (EstriaAparecimento forca : values) {
			formas.add(new ItemRadioButtom(forca.getValue(), forca.getValor()));
		}
		return formas;
	}

	public Collection<ItemRadioButtom> getCategoriasRuga() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		CategoriaRuga[] values = CategoriaRuga.values();
		for (CategoriaRuga forca : values) {
			formas.add(new ItemRadioButtom(forca.getValue(), forca.getValor()));
		}
		return formas;
	}

	public Collection<ItemRadioButtom> getTiposRuga() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		TipoRuga[] values = TipoRuga.values();
		for (TipoRuga forca : values) {
			formas.add(new ItemRadioButtom(forca.getValue(), forca.getValor()));
		}
		return formas;
	}

	public Collection<ItemRadioButtom> getQualidadesPele() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		QualidadePele[] values = QualidadePele.values();
		for (QualidadePele forca : values) {
			formas.add(new ItemRadioButtom(forca.getValue(), forca.getValor()));
		}
		return formas;
	}

	public Collection<ItemRadioButtom> getCoresPele() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		CorPele[] values = CorPele.values();
		for (CorPele forca : values) {
			formas.add(new ItemRadioButtom(forca.getValue(), forca.getValor()));
		}
		return formas;
	}

	public Collection<ItemRadioButtom> getQtsAlimentacao() {
		Collection<ItemRadioButtom> formas = new ArrayList<ItemRadioButtom>();
		QtAlimentacao[] values = QtAlimentacao.values();
		for (QtAlimentacao forca : values) {
			formas.add(new ItemRadioButtom(forca.getValue(), forca.getValor()));
		}
		return formas;
	}

	public Collection<Indicacao> getIndicacoes() {
		Collection<Indicacao> formas = new ArrayList<Indicacao>();
		formas.add(new Indicacao("MEDICO", "Médico"));
		formas.add(new Indicacao("AMIGOS", "Amigos"));
		formas.add(new Indicacao("INTERESSE", "Interesse Próprio"));
		formas.add(new Indicacao("ALUNO", "Aluno Vita Corpore"));
		formas.add(new Indicacao("FAMILIARES", "Familiares"));
		return formas;
	}

	public Collection<FormaConhecimento> getFormasConhecimento() {
		Collection<FormaConhecimento> formas = Proxy.getInstance().getAllFormasConhecimento();
		if (formas != null) {
			formas.add(new FormaConhecimento("OUTRO", "Outro"));
		}
		return formas;
	}

	public Collection<TipoContaPagar> getTiposContaPagar() {
		Collection<TipoContaPagar> tipos = Proxy.getInstance().getAllTiposContaPagar();
		if (tipos == null) {
			tipos = new ArrayList<TipoContaPagar>();
		}
		tipos.add(new TipoContaPagar(-1, "Outro"));
		return tipos;
	}

	public Collection<TipoContaReceber> getTiposContaReceber() {
		Collection<TipoContaReceber> tipos = Proxy.getInstance().getAllTiposContaReceber();
		if (tipos == null) {
			tipos = new ArrayList<TipoContaReceber>();
		}
		tipos.add(new TipoContaReceber(-1, "Outro"));
		return tipos;
	}

	public Collection<TipoCadastro> getTiposCadastro() {
		Collection<TipoCadastro> tipos = Proxy.getInstance().getAllTiposCadastro();
		if (tipos == null) {
			tipos = new ArrayList<TipoCadastro>();
		}
		tipos.add(new TipoCadastro(-1, "Outro"));
		return tipos;
	}

	public Collection<CentroCusto> getAllCentrosCusto() {
		return Proxy.getInstance().getAllCentroCusto();
	}

	public Collection<Professor> getProfessores() {
		return Proxy.getInstance().getPoucosFuncionarios();
	}

	public Collection<Professor> getColaboradores() {
		return Proxy.getInstance().getColaboradores();
	}

	public FormaPagamento[] getFormasPagamento() {
		return FormaPagamento.values();
	}

	public TipoCusto[] getTiposCusto() {
		return TipoCusto.values();
	}

	public Collection<Servico> getModalidades() {
		return Proxy.getInstance().getAllServicos();
	}

	public Retracao[] getRetracoes() {
		return Retracao.values();
	}

	public Sexo[] getSexos() {
		return Sexo.values();
	}

	public EstadoCivil[] getEstadosCivil() {
		return EstadoCivil.values();
	}

	public String actionBuscarCPF() {
		String xml = XML_HEAD;
		try {
			boolean disponivel = Proxy.getInstance().isCPFDisponivel(cpf);
			if (disponivel) {
				xml += "<resposta status=\"true\" />";
			} else {
				xml += "<resposta status=\"false\" />";
			}
		} catch (Exception e) {
			e.printStackTrace();
			xml += "<resposta status=\"false\" />";
		}
		printResponse(xml);
		return null;
	}

	public void printResponse(String xml) {
		xml = StringEscapeUtils.escapeXml(xml);
		xml = xml.replaceAll("&lt;", "<");
		xml = xml.replaceAll("&gt;", ">");
		xml = xml.replaceAll("&apos;", "'");
		xml = xml.replaceAll("&quot;", "'");
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			if (response != null) {
				response.setContentType("text/xml");
				response.getWriter().print(xml);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String parseExceptionToXML(Exception e) {
		e.printStackTrace();
		return "<error msg=\"" + e.getMessage() + "\" />";
	}

	// MÉTODO copyFile
	public void copyFile(File in, File out) {
		try {
			FileChannel sourceChannel = new FileInputStream(in).getChannel();
			FileChannel destinationChannel = new FileOutputStream(out).getChannel();
			sourceChannel.transferTo(0L, sourceChannel.size(), destinationChannel);
			sourceChannel.close();
			destinationChannel.close();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	// MÉTODO getPath
	public static String getPath() {
		ServletContext sc = (ServletContext) ActionContext.getContext().get(StrutsStatics.SERVLET_CONTEXT);
		return sc.getRealPath("");
	}

	public static String retirarUltimoCaracter(String str) {
		if (str.length() > 0) {
			str = str.substring(0, str.length() - 1);
		}
		return str;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Collection<Servico> getServicos() {
		return servicos;
	}

	public void setServicos(Collection<Servico> servicos) {
		this.servicos = servicos;
	}

	public Servico getServico() {
		return servico;
	}

	public void setServico(Servico servico) {
		this.servico = servico;
	}

	public Collection<CentroCusto> getCentrosCusto() {
		return centrosCusto;
	}

	public void setCentrosCusto(Collection<CentroCusto> centrosCusto) {
		this.centrosCusto = centrosCusto;
	}

	public CentroCusto getCentroCusto() {
		return centroCusto;
	}

	public void setCentroCusto(CentroCusto centroCusto) {
		this.centroCusto = centroCusto;
	}

	public Configuracao getConfiguracoes() {
		return configuracoes;
	}

	public void setConfiguracoes(Configuracao configuracoes) {
		this.configuracoes = configuracoes;
	}

}
