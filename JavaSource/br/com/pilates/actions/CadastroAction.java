package br.com.pilates.actions;

import java.io.File;
import java.util.Collection;

import br.com.pilates.base.Avaliacao;
import br.com.pilates.base.AvaliacaoAlteracoesCirculatorias;
import br.com.pilates.base.AvaliacaoCirurgiaPlastica;
import br.com.pilates.base.AvaliacaoCripolise;
import br.com.pilates.base.AvaliacaoDaySpa;
import br.com.pilates.base.AvaliacaoDepilacao;
import br.com.pilates.base.AvaliacaoDermatologia;
import br.com.pilates.base.AvaliacaoEstria;
import br.com.pilates.base.AvaliacaoGestante;
import br.com.pilates.base.AvaliacaoGorduraLocalizada;
import br.com.pilates.base.AvaliacaoLimpezaPele;
import br.com.pilates.base.AvaliacaoNatacaoInfantil;
import br.com.pilates.base.AvaliacaoNutricao;
import br.com.pilates.base.AvaliacaoPeeling;
import br.com.pilates.base.AvaliacaoPowerShape;
import br.com.pilates.base.AvaliacaoProjeto100Dias;
import br.com.pilates.base.AvaliacaoTratamentoFacial;
import br.com.pilates.base.Cadastro;
import br.com.pilates.base.Cliente;
import br.com.pilates.base.ContaReceber;
import br.com.pilates.base.Servico;
import br.com.pilates.base.TipoContaReceber;
import br.com.pilates.fachada.IProxy;
import br.com.pilates.fachada.Proxy;
import br.com.pilates.util.PilatesBundleUtil;

@SuppressWarnings("serial")
public class CadastroAction extends PilatesActionSupport {

	private final IProxy proxy;

	private String novoTipoContaReceber;
	private Cadastro cadastro;
	private Cliente cliente;
	private Servico servico;
	private ContaReceber contaReceber;
	private Collection<ContaReceber> contasReceber;

	private Integer avaliacaoID;

	private AvaliacaoAlteracoesCirculatorias avaliacaoAlteracoesCirculatorias;
	private AvaliacaoCirurgiaPlastica avaliacaoCirurgiaPlastica;
	private AvaliacaoDaySpa avaliacaoDaySpa;
	private AvaliacaoDepilacao avaliacaoDepilacao;
	private AvaliacaoEstria avaliacaoEstria;
	private AvaliacaoGestante avaliacaoGestante;
	private AvaliacaoGorduraLocalizada avaliacaoGorduraLocalizada;
	private AvaliacaoTratamentoFacial avaliacaoTratamentoFacial;
	private AvaliacaoDermatologia avaliacaoDermatologia;
	private AvaliacaoNutricao avaliacaoNutricao;
	private AvaliacaoPowerShape avaliacaoPowerShape;
	private AvaliacaoNatacaoInfantil avaliacaoNatacaoInfantil;
	private AvaliacaoLimpezaPele avaliacaoLimpezaPele;
	private AvaliacaoPeeling avaliacaoPeeling;
	private AvaliacaoCripolise avaliacaoCripolise;
	private AvaliacaoProjeto100Dias avaliacaoProjeto100Dias;

	private File avaliacao;
	private String avaliacaoFileName;
	private String avaliacaoContentType;

	public CadastroAction() {
		proxy = Proxy.getInstance();
	}

	public String actionMudarProfessor() {
		String resposta = "";
		try {
			proxy.mudarProfessor(cadastro);
			resposta = SUCCESS;
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.ALTERACAO_SUCESSO));
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionLerCadastro() {
		String resposta = "";
		try {
			this.cadastro = this.proxy.lerCadastro(cadastro);
			this.contasReceber = this.proxy.getContasReceberByCadastro(this.cadastro);
			/*
			 * if (this.cadastro != null &&
			 * this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.DAY_SPA) { } else if (this.cadastro != null &&
			 * this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.DEPILACAO_LASER) { this.avaliacaoDepilacao =
			 * (AvaliacaoDepilacao) this.proxy.read(AvaliacaoDepilacao.class,
			 * this.cadastro.getAvaliacao().getId()); } else if (this.cadastro
			 * != null && this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.TRATAMENTO_ESTRIAS) { this.avaliacaoEstria =
			 * (AvaliacaoEstria) this.proxy.read(AvaliacaoEstria.class,
			 * this.cadastro.getAvaliacao().getId()); } else if (this.cadastro
			 * != null && this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.TRATAMENTO_GESTANTE) { this.avaliacaoGestante =
			 * (AvaliacaoGestante) this.proxy.read(AvaliacaoGestante.class,
			 * this.cadastro.getAvaliacao().getId()); } else if (this.cadastro
			 * != null && this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.TRATAMENTO_FACIAL) { this.avaliacaoTratamentoFacial =
			 * (AvaliacaoTratamentoFacial)
			 * this.proxy.read(AvaliacaoTratamentoFacial.class,
			 * this.cadastro.getAvaliacao().getId()); } else if (this.cadastro
			 * != null && this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.DERMATOLOGIA) { this.avaliacaoDermatologia =
			 * (AvaliacaoDermatologia)
			 * this.proxy.read(AvaliacaoDermatologia.class,
			 * this.cadastro.getAvaliacao().getId()); } else if (this.cadastro
			 * != null && this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.OPERATORIO_CIRURGIA) { this.avaliacaoCirurgiaPlastica
			 * = (AvaliacaoCirurgiaPlastica)
			 * this.proxy.read(AvaliacaoCirurgiaPlastica.class,
			 * this.cadastro.getAvaliacao().getId()); } else if (this.cadastro
			 * != null && this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.GL_FEG) { this.avaliacaoGorduraLocalizada =
			 * (AvaliacaoGorduraLocalizada)
			 * this.proxy.read(AvaliacaoGorduraLocalizada.class,
			 * this.cadastro.getAvaliacao().getId()); } else if (this.cadastro
			 * != null && this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.NUTRICAO) { this.avaliacaoNutricao =
			 * (AvaliacaoNutricao) this.proxy.read(AvaliacaoNutricao.class,
			 * this.cadastro.getAvaliacao().getId()); } else if (this.cadastro
			 * != null && this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.POWER_SHAPE) { this.avaliacaoPowerShape =
			 * (AvaliacaoPowerShape) this.proxy.read(AvaliacaoPowerShape.class,
			 * this.cadastro.getAvaliacao().getId()); } else if (this.cadastro
			 * != null && this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.NATACAO_INFANTIL) { this.avaliacaoNatacaoInfantil =
			 * (AvaliacaoNatacaoInfantil)
			 * this.proxy.read(AvaliacaoNatacaoInfantil.class,
			 * this.cadastro.getAvaliacao().getId()); }
			 */
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionGetLastAvaliacaoByModalidadeCliente() {
		String xml = XML_HEAD;
		try {
			Avaliacao avaliacao = this.proxy.getLastAvaliacaoByModalidadeCliente(servico, cliente);
			if (avaliacao != null) {
				xml += "<avaliacao status=\"true\" id=\"" + avaliacao.getId() + "\" />";
			} else {
				xml += "<avaliacao status=\"false\" />";
			}
		} catch (Exception e) {
			e.printStackTrace();
			xml += parseExceptionToXML(e);
		}
		printResponse(xml);
		return null;
	}

	public String actionRemoverContaReceberCadastro() {
		String resposta = "";
		try {
			proxy.removerContaReceberCadastro(this.contaReceber);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.REMOCAO_SUCESSO));
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionRemoverCadastro() {
		String resposta = "";
		try {
			proxy.removerCadastro(cadastro);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.REMOCAO_SUCESSO));
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionInserirContaReceberCadastro() {
		String resposta = "";
		try {
			if (this.novoTipoContaReceber != null && !this.novoTipoContaReceber.trim().equals("")) {
				contaReceber.setTipo(new TipoContaReceber(this.novoTipoContaReceber));
				this.proxy.insert(this.contaReceber.getTipo());
			}
			this.proxy.inserirContaReceberCadastro(this.contaReceber, this.cadastro);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.CADASTRO_SUCESSO));
			this.contaReceber = null;
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionInserirCadastro() {
		String resposta = "";
		try {
			/*
			 * if (this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.DAY_SPA) { if (this.avaliacaoID == null) {
			 * this.avaliacaoDaySpa
			 * .parseDadosBasicos(this.cadastro.getAvaliacao()); } else {
			 * this.avaliacaoDaySpa = (AvaliacaoDaySpa)
			 * this.proxy.read(AvaliacaoDaySpa.class, this.avaliacaoID); }
			 * this.cadastro.setAvaliacao(avaliacaoDaySpa); } else if
			 * (this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.DEPILACAO_LASER) { if (this.avaliacaoID == null) {
			 * this
			 * .avaliacaoDepilacao.parseDadosBasicos(this.cadastro.getAvaliacao
			 * ()); } else { this.avaliacaoDepilacao = (AvaliacaoDepilacao)
			 * this.proxy.read(AvaliacaoDepilacao.class, this.avaliacaoID); }
			 * this.cadastro.setAvaliacao(avaliacaoDepilacao); } else if
			 * (this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.TRATAMENTO_ESTRIAS) { if (this.avaliacaoID == null) {
			 * this
			 * .avaliacaoEstria.parseDadosBasicos(this.cadastro.getAvaliacao());
			 * } else { this.avaliacaoEstria = (AvaliacaoEstria)
			 * this.proxy.read(AvaliacaoEstria.class, this.avaliacaoID); }
			 * this.cadastro.setAvaliacao(avaliacaoEstria); } else if
			 * (this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.TRATAMENTO_GESTANTE) { if (this.avaliacaoID == null) {
			 * this
			 * .avaliacaoGestante.parseDadosBasicos(this.cadastro.getAvaliacao
			 * ()); } else { this.avaliacaoGestante = (AvaliacaoGestante)
			 * this.proxy.read(AvaliacaoGestante.class, this.avaliacaoID); }
			 * this.cadastro.setAvaliacao(avaliacaoGestante); } else if
			 * (this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.TRATAMENTO_FACIAL) { if (this.avaliacaoID == null) {
			 * this.avaliacaoTratamentoFacial.parseDadosBasicos(this.cadastro.
			 * getAvaliacao()); } else { this.avaliacaoTratamentoFacial =
			 * (AvaliacaoTratamentoFacial)
			 * this.proxy.read(AvaliacaoTratamentoFacial.class,
			 * this.avaliacaoID); }
			 * this.cadastro.setAvaliacao(avaliacaoTratamentoFacial); } else if
			 * (this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.DERMATOLOGIA) { if (this.avaliacaoID == null) {
			 * this.avaliacaoDermatologia
			 * .parseDadosBasicos(this.cadastro.getAvaliacao()); } else {
			 * this.avaliacaoDermatologia = (AvaliacaoDermatologia)
			 * this.proxy.read(AvaliacaoDermatologia.class, this.avaliacaoID); }
			 * 
			 * if (this.avaliacaoFileName != null) { String urlFoto =
			 * SystemUtils.parseFileName(this.avaliacaoFileName);
			 * copyFile(this.avaliacao, new File(SystemUtils.getPath() +
			 * "/img/avaliacoes/" + urlFoto));
			 * this.avaliacaoDermatologia.setAvaliacao(urlFoto); }
			 * 
			 * this.cadastro.setAvaliacao(avaliacaoDermatologia); } else if
			 * (this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.NUTRICAO) { if (this.avaliacaoID == null) {
			 * this.avaliacaoNutricao
			 * .parseDadosBasicos(this.cadastro.getAvaliacao()); } else {
			 * this.avaliacaoNutricao = (AvaliacaoNutricao)
			 * this.proxy.read(AvaliacaoNutricao.class, this.avaliacaoID); }
			 * this.cadastro.setAvaliacao(avaliacaoNutricao); } else if
			 * (this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.POWER_SHAPE) { if (this.avaliacaoID == null) {
			 * this.avaliacaoPowerShape
			 * .parseDadosBasicos(this.cadastro.getAvaliacao()); } else {
			 * this.avaliacaoPowerShape = (AvaliacaoPowerShape)
			 * this.proxy.read(AvaliacaoPowerShape.class, this.avaliacaoID); }
			 * this.cadastro.setAvaliacao(avaliacaoPowerShape); } else if
			 * (this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.NATACAO_INFANTIL) { if (this.avaliacaoID == null) {
			 * this.avaliacaoNatacaoInfantil.parseDadosBasicos(this.cadastro.
			 * getAvaliacao()); } else { this.avaliacaoNatacaoInfantil =
			 * (AvaliacaoNatacaoInfantil)
			 * this.proxy.read(AvaliacaoNatacaoInfantil.class,
			 * this.avaliacaoID); }
			 * this.cadastro.setAvaliacao(avaliacaoNatacaoInfantil); } else if
			 * (this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.OPERATORIO_CIRURGIA) { if (this.avaliacaoID == null) {
			 * this.avaliacaoCirurgiaPlastica.parseDadosBasicos(this.cadastro.
			 * getAvaliacao()); } else { this.avaliacaoCirurgiaPlastica =
			 * (AvaliacaoCirurgiaPlastica)
			 * this.proxy.read(AvaliacaoCirurgiaPlastica.class,
			 * this.avaliacaoID); }
			 * this.cadastro.setAvaliacao(avaliacaoCirurgiaPlastica); } else if
			 * (this.cadastro.getModalidade().getModalidade() ==
			 * Modalidade.GL_FEG) { if (this.avaliacaoID == null) {
			 * this.avaliacaoGorduraLocalizada
			 * .parseDadosBasicos(this.cadastro.getAvaliacao()); } else {
			 * this.avaliacaoGorduraLocalizada = (AvaliacaoGorduraLocalizada)
			 * this.proxy.read(AvaliacaoGorduraLocalizada.class,
			 * this.avaliacaoID); }
			 * this.cadastro.setAvaliacao(avaliacaoGorduraLocalizada); }
			 */
			proxy.inserirCadastro(cadastro);
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.CADASTRO_SUCESSO));
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public String actionEditarAvaliacao() {
		String resposta = "";
		try {
			proxy.atualizarAvaliacao(this.cadastro.getAvaliacao());
			addActionMessage(PilatesBundleUtil.getMsg(PilatesBundleUtil.ALTERACAO_SUCESSO));
			resposta = SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());
			resposta = ERROR;
		}
		return resposta;
	}

	public Cadastro getCadastro() {
		return cadastro;
	}

	public void setCadastro(Cadastro cadastro) {
		this.cadastro = cadastro;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public ContaReceber getContaReceber() {
		return contaReceber;
	}

	public void setContaReceber(ContaReceber contaReceber) {
		this.contaReceber = contaReceber;
	}

	public Collection<ContaReceber> getContasReceber() {
		return contasReceber;
	}

	public void setContasReceber(Collection<ContaReceber> contasReceber) {
		this.contasReceber = contasReceber;
	}

	public String getNovoTipoContaReceber() {
		return novoTipoContaReceber;
	}

	public void setNovoTipoContaReceber(String novoTipoContaReceber) {
		this.novoTipoContaReceber = novoTipoContaReceber;
	}

	public int getAvaliacaoID() {
		return avaliacaoID;
	}

	public void setAvaliacaoID(String avaliacaoID) {
		if (avaliacaoID == null || avaliacaoID.equals(""))
			this.avaliacaoID = null;
		else
			this.avaliacaoID = new Integer(avaliacaoID);
	}

	public AvaliacaoAlteracoesCirculatorias getAvaliacaoAlteracoesCirculatorias() {
		return avaliacaoAlteracoesCirculatorias;
	}

	public void setAvaliacaoAlteracoesCirculatorias(AvaliacaoAlteracoesCirculatorias avaliacaoAlteracoesCirculatorias) {
		this.avaliacaoAlteracoesCirculatorias = avaliacaoAlteracoesCirculatorias;
	}

	public AvaliacaoCirurgiaPlastica getAvaliacaoCirurgiaPlastica() {
		return avaliacaoCirurgiaPlastica;
	}

	public void setAvaliacaoCirurgiaPlastica(AvaliacaoCirurgiaPlastica avaliacaoCirurgiaPlastica) {
		this.avaliacaoCirurgiaPlastica = avaliacaoCirurgiaPlastica;
	}

	public AvaliacaoDaySpa getAvaliacaoDaySpa() {
		return avaliacaoDaySpa;
	}

	public void setAvaliacaoDaySpa(AvaliacaoDaySpa avaliacaoDaySpa) {
		this.avaliacaoDaySpa = avaliacaoDaySpa;
	}

	public AvaliacaoDepilacao getAvaliacaoDepilacao() {
		return avaliacaoDepilacao;
	}

	public void setAvaliacaoDepilacao(AvaliacaoDepilacao avaliacaoDepilacao) {
		this.avaliacaoDepilacao = avaliacaoDepilacao;
	}

	public AvaliacaoEstria getAvaliacaoEstria() {
		return avaliacaoEstria;
	}

	public void setAvaliacaoEstria(AvaliacaoEstria avaliacaoEstria) {
		this.avaliacaoEstria = avaliacaoEstria;
	}

	public AvaliacaoGestante getAvaliacaoGestante() {
		return avaliacaoGestante;
	}

	public void setAvaliacaoGestante(AvaliacaoGestante avaliacaoGestante) {
		this.avaliacaoGestante = avaliacaoGestante;
	}

	public AvaliacaoGorduraLocalizada getAvaliacaoGorduraLocalizada() {
		return avaliacaoGorduraLocalizada;
	}

	public void setAvaliacaoGorduraLocalizada(AvaliacaoGorduraLocalizada avaliacaoGorduraLocalizada) {
		this.avaliacaoGorduraLocalizada = avaliacaoGorduraLocalizada;
	}

	public AvaliacaoTratamentoFacial getAvaliacaoTratamentoFacial() {
		return avaliacaoTratamentoFacial;
	}

	public void setAvaliacaoTratamentoFacial(AvaliacaoTratamentoFacial avaliacaoTratamentoFacial) {
		this.avaliacaoTratamentoFacial = avaliacaoTratamentoFacial;
	}

	public AvaliacaoDermatologia getAvaliacaoDermatologia() {
		return avaliacaoDermatologia;
	}

	public void setAvaliacaoDermatologia(AvaliacaoDermatologia avaliacaoDermatologia) {
		this.avaliacaoDermatologia = avaliacaoDermatologia;
	}

	public AvaliacaoNutricao getAvaliacaoNutricao() {
		return avaliacaoNutricao;
	}

	public void setAvaliacaoNutricao(AvaliacaoNutricao avaliacaoNutricao) {
		this.avaliacaoNutricao = avaliacaoNutricao;
	}

	public AvaliacaoPowerShape getAvaliacaoPowerShape() {
		return avaliacaoPowerShape;
	}

	public void setAvaliacaoPowerShape(AvaliacaoPowerShape avaliacaoPowerShape) {
		this.avaliacaoPowerShape = avaliacaoPowerShape;
	}

	public AvaliacaoNatacaoInfantil getAvaliacaoNatacaoInfantil() {
		return avaliacaoNatacaoInfantil;
	}

	public void setAvaliacaoNatacaoInfantil(AvaliacaoNatacaoInfantil avaliacaoNatacaoInfantil) {
		this.avaliacaoNatacaoInfantil = avaliacaoNatacaoInfantil;
	}

	public File getAvaliacao() {
		return avaliacao;
	}

	public void setAvaliacao(File bannerCima) {
		this.avaliacao = bannerCima;
	}

	public String getAvaliacaoFileName() {
		return avaliacaoFileName;
	}

	public void setAvaliacaoFileName(String bannerCimaFileName) {
		this.avaliacaoFileName = bannerCimaFileName;
	}

	public String getAvaliacaoContentType() {
		return avaliacaoContentType;
	}

	public void setAvaliacaoContentType(String bannerCimaContentType) {
		this.avaliacaoContentType = bannerCimaContentType;
	}

	public AvaliacaoLimpezaPele getAvaliacaoLimpezaPele() {
		return avaliacaoLimpezaPele;
	}

	public void setAvaliacaoLimpezaPele(AvaliacaoLimpezaPele avaliacaoLimpezaPele) {
		this.avaliacaoLimpezaPele = avaliacaoLimpezaPele;
	}

	public AvaliacaoPeeling getAvaliacaoPeeling() {
		return avaliacaoPeeling;
	}

	public void setAvaliacaoPeeling(AvaliacaoPeeling avaliacaoPeeling) {
		this.avaliacaoPeeling = avaliacaoPeeling;
	}

	public AvaliacaoCripolise getAvaliacaoCripolise() {
		return avaliacaoCripolise;
	}

	public void setAvaliacaoCripolise(AvaliacaoCripolise avaliacaoCripolise) {
		this.avaliacaoCripolise = avaliacaoCripolise;
	}

	public AvaliacaoProjeto100Dias getAvaliacaoProjeto100Dias() {
		return avaliacaoProjeto100Dias;
	}

	public void setAvaliacaoProjeto100Dias(AvaliacaoProjeto100Dias avaliacaoProjeto100Dias) {
		this.avaliacaoProjeto100Dias = avaliacaoProjeto100Dias;
	}

}
